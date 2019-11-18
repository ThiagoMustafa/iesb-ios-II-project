import UIKit
import FirebaseAuth

class LoginTableViewController: UITableViewController {

    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func validaCampos() -> String?{
        if (tfEmail.text ?? "").isEmpty ||
            (tfPassword.text ?? "").isEmpty {
            return "Os campos de email e senha são de preenchimento obrigatório. Verifique se todos estão prenchidos!"
        }
        
        return nil;
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
    
    func transicaoParaHome(){
        UserDefaults.standard.set(true, forKey: "UsuarioLogado")
        
        let usuarioLogado = NSNotification.Name(rawValue: "usuarioLogado")
        NotificationCenter.default.post(name: usuarioLogado, object: nil)
    }
    
    @IBAction func btnLogin(_ sender: Any) {
        
        let erro = validaCampos()
        if erro != nil{
            self.exibirAlerta(erro!)
            return;
        }
        //Retira espaços em branco no inicio e final dos parametros
        let email = tfEmail.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let senha = tfPassword.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        // Autentica usuario
        Auth.auth().signIn(withEmail: email, password: senha) { (result, error) in
            
            if error != nil {
                // Couldn't sign in
                self.exibirAlerta("Usuário não encontrado!")
            }
            else {
                self.transicaoParaHome()
            }
        }
    }
}
