import UIKit

extension CadastroTableViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func enableFields(_ isEnable: Bool){
        self.tfEmail.isUserInteractionEnabled = isEnable
        self.tfName.isUserInteractionEnabled = isEnable
        self.tfSenha.isUserInteractionEnabled = isEnable
        self.sReceberEmail.isUserInteractionEnabled = isEnable
        self.btnSelecionarImagem.isUserInteractionEnabled = isEnable
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            let originalWidth = image.size.width
            let aspectRatio = originalWidth / image.size.height
            var smallSize: CGSize
            if aspectRatio > 1 {
                smallSize = CGSize(width: 100, height: 100/aspectRatio)
            }else{
                smallSize = CGSize(width: 100 * aspectRatio, height: 100)
            }
            
            UIGraphicsBeginImageContext(smallSize)
            image.draw(in: CGRect(x: 0, y: 0, width: smallSize.width, height: smallSize.height))
            let smallImage = UIGraphicsGetImageFromCurrentImageContext()
            
            UIGraphicsEndImageContext()
            
            dismiss(animated: true, completion: {
                self.ivFoto.image = smallImage
            })
        }
    }
    
}
