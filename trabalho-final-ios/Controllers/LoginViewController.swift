import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfSenha: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func actionEntrar(_ sender: Any) {
        if (!(tfEmail.text ?? "").isEmpty && !(tfSenha.text ?? "").isEmpty) {
            print("email: \(tfEmail.text!), senha: \(tfSenha.text!)")
        }
    }
    
}
