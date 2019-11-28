//
//  CadastroTableViewController.swift
//  trabalho-final-ios
//
//  Created by Thiago Mustafa on 13/08/19.
//  Copyright © 2019 Thiago Mustafa. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase
import FirebaseAnalytics

class CadastroTableViewController: UITableViewController {

    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfSenha: UITextField!
    @IBOutlet weak var sReceberEmail: UISwitch!
    @IBOutlet weak var ivFoto: UIImageView!
    @IBOutlet weak var btnSelecionarImagem: UIButton!
    @IBOutlet weak var btnCadastro: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 6
    }
    
    func validaCampos() -> String?{
        if (tfName.text ?? "").isEmpty ||
            (tfEmail.text ?? "").isEmpty ||
            (tfSenha.text ?? "").isEmpty {
            return "Os campos de nome, email e senha são de preenchimento obrigatório. Verifique se todos estão prenchidos!"
        }
        
        return nil;
    }
    
    @IBAction func SelecionarImagem(_ sender: Any) {
        let alert = UIAlertController(title: "Selecionar foto", message: "De onde você quer selecionar sua foto?", preferredStyle: .actionSheet)
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            let cameraAction = UIAlertAction(title: "Câmera", style: .default, handler: {(action) in
                self.selectPicture(sourceType: .camera)
            })
            alert.addAction(cameraAction)
        }
        
        let libraryAction = UIAlertAction(title: "Biblioteca de fotos", style: .default){
            (action) in
            self.selectPicture(sourceType: .photoLibrary)
        }
        alert.addAction(libraryAction)
        
        let photosAction = UIAlertAction(title: "Album de fotos", style: .default){
            (action) in
            self.selectPicture(sourceType: .savedPhotosAlbum)
        }
        alert.addAction(photosAction)
        
        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        alert.addAction(cancelAction)
    
        present(alert, animated: true, completion: nil)
    }
    
    func selectPicture(sourceType: UIImagePickerController.SourceType) {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = sourceType
        imagePicker.delegate = self
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func Cadastrar(_ sender: Any) {
        self.enableFields(false)
        self.btnCadastro.loadingIndicator(true)
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            //Verifica se os campos obrigatorios estão preenchidos e cadastra o cliente
            let erro = self.validaCampos()
            if erro != nil{
                self.enableFields(true)
                self.btnCadastro.loadingIndicator(false)
                self.exibirAlerta(erro!)
                return;
            }
            
            //Retira espaços em branco no inicio e final dos parametros
            let email = self.tfEmail.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let nome = self.tfName.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let senha = self.tfSenha.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            // Criar usuario
            Auth.auth().createUser(withEmail: email, password: senha) { (result, err) in
                
                if err != nil {
                    self.enableFields(true)
                    self.btnCadastro.loadingIndicator(false)
                    self.exibirAlerta("Erro ao cadastrar usuário")
                }
                else {
                    
                    //successfully authenticated user
                    let imageName = NSUUID().uuidString
                    let storageRef = Storage.storage().reference().child("profile_images").child("\(imageName).png")
                    
                    if let uploadData = self.ivFoto.image!.pngData() {
                        
                        storageRef.putData(uploadData, metadata: nil, completion: { (_, err) in
                            
                            if let error = err {
                                self.exibirAlerta("Ocorreu um erro ao salvar alguns dados do usuário")
                                self.enableFields(true)
                                self.btnCadastro.loadingIndicator(false)
                                print(error)
                                return
                            }
                            
                            storageRef.downloadURL(completion: { (url, err) in
                                if let err = err {
                                    print(err)
                                    self.enableFields(true)
                                    self.btnCadastro.loadingIndicator(false)
                                    return
                                }
                                
                                guard let url = url else { return }
                                
                                
                                // Se o usuario foi cadastrado com sucesso, salva as demais informações
                                let db = Firestore.firestore()
                                
                                db.collection("users").addDocument(data: ["uid": result!.user.uid, "nome":nome,"profileImageUrl": url.absoluteString, "receberEmails":self.sReceberEmail.isOn ]) { (error) in
                                    
                                    if error != nil {
                                        self.enableFields(true)
                                        self.btnCadastro.loadingIndicator(false)
                                        // Exibe mensagem de erro
                                        self.exibirAlerta("Erro ao salvar os dados do usuario")
                                        return
                                    }
                                    
                                    Analytics.logEvent("sign_up", parameters: ["user_id": result?.user.uid, "user_email": result?.user.email])
                                }
                                self.enableFields(true)
                                self.btnCadastro.loadingIndicator(false)
                                self.transicaoParaHome()
                            })
                            
                        })
                    }
                }
            }
        }

    }
    
    func transicaoParaHome(){
        UserDefaults.standard.set(true, forKey: "UsuarioLogado")
        
        let usuarioLogado = NSNotification.Name(rawValue: "usuarioLogado")
        NotificationCenter.default.post(name: usuarioLogado, object: nil)
    }
    
    func exibirAlerta(_ mensagem:String){
        //Exibe um alerta caso os campos obrigatorios não estejam preenchidos
        let alert = UIAlertController(title: "Ops!", message: mensagem, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel) { (alert) in
            self.dismiss(animated: true, completion: nil)
        }
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
}

//extension CadastroTableViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
//    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
//            let originalWidth = image.size.width
//            let aspectRatio = originalWidth / image.size.height
//            var smallSize: CGSize
//            if aspectRatio > 1 {
//                smallSize = CGSize(width: 100, height: 100/aspectRatio)
//            }else{
//                smallSize = CGSize(width: 100 * aspectRatio, height: 100)
//            }
//
//            UIGraphicsBeginImageContext(smallSize)
//            image.draw(in: CGRect(x: 0, y: 0, width: smallSize.width, height: smallSize.height))
//            let smallImage = UIGraphicsGetImageFromCurrentImageContext()
//
//            UIGraphicsEndImageContext()
//
//            dismiss(animated: true, completion: {
//                self.ivFoto.image = smallImage
//            })
//        }
//    }
//}
