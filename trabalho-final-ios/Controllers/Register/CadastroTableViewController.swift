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

class CadastroTableViewController: UITableViewController {

    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfSenha: UITextField!
    @IBOutlet weak var sReceberEmail: UISwitch!
    
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
    
    
    @IBAction func Cadastrar(_ sender: Any) {
        //Verifica se os campos obrigatorios estão preenchidos e cadastra o cliente
        let erro = validaCampos()
        if erro != nil{
            exibirAlerta(erro!)
            //Exibe um alerta caso os campos obrigatorios não estejam preenchidos
//            let alert = UIAlertController(title: "Ops!", message: erro, preferredStyle: .alert)
//            let action = UIAlertAction(title: "OK", style: .cancel) { (alert) in
//                self.dismiss(animated: true, completion: nil)
//            }
//            alert.addAction(action)
//            self.present(alert, animated: true, completion: nil)
            return;
        }
        
        //Retira espaços em branco no inicio e final dos parametros
        let email = tfEmail.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let nome = tfName.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let senha = tfSenha.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        // Criar usuario
        Auth.auth().createUser(withEmail: email, password: senha) { (result, err) in
            
            if err != nil {
                self.exibirAlerta("Erro ao cadastrar usuário")
            }
            else {
                // Se o usuario foi cadastrado com sucesso, salva as demais informações
                let db = Firestore.firestore()
                
                db.collection("users").addDocument(data: ["uid": result!.user.uid, "nome":nome, "receberEmails":self.sReceberEmail.isOn ]) { (error) in
                    
                    if error != nil {
                        // Exibe mensagem de erro
                        self.exibirAlerta("Erro ao salvar os dados do usuario")
                    }
                }
                
                self.transicaoParaHome()
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
    
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
