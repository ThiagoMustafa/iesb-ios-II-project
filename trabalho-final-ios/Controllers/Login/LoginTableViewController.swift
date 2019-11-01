import UIKit

class LoginTableViewController: UITableViewController {

    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func btnLogin(_ sender: Any) {
        guard let email = tfEmail.text,
            !email.isEmpty,
            let senha = tfPassword.text,
            !senha.isEmpty else {
                
                let alert = UIAlertController(title: "Erro", message: "Preencha os campos", preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .cancel) { (alert) in
                    self.dismiss(animated: true, completion: nil)
                }
                alert.addAction(action)
                self.present(alert, animated: true, completion: nil)
                return
        }
        
        print(email)
        print(senha)
        //conexao com o servidor
        UserDefaults.standard.set(true, forKey: "UsuarioLogado")
        
        let usuarioLogado = NSNotification.Name(rawValue: "usuarioLogado")
        NotificationCenter.default.post(name: usuarioLogado, object: nil)
    }
}
