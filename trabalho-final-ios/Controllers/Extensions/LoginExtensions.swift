import UIKit

extension LoginTableViewController {
    func enableFields(_ isEnable: Bool){
        self.tfEmail.isUserInteractionEnabled = isEnable;
        self.tfPassword.isUserInteractionEnabled = isEnable;
    }
    
}
