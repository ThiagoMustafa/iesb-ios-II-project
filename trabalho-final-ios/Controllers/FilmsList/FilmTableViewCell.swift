import UIKit

class FilmTableViewCell: UITableViewCell {

    @IBOutlet weak var ivPoster: UIImageView!
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbDescription: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func prepare(with film:Film){
        ivPoster.image = UIImage(named: film.PosterImage)
        lbTitle.text = film.Title
        if (lbDescription != nil)  {
            lbDescription.text = film.Description
        }
    }

}
