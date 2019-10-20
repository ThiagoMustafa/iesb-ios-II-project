import UIKit

class FilmDetailsViewController: UIViewController {
    
    var filmDetail: Film!
    
    @IBOutlet weak var ivPoster: UIImageView!
    @IBOutlet weak var lbFilmTitle: UILabel!
    @IBOutlet weak var lbFilmDescription: UILabel!
    @IBOutlet weak var lbFilmInfo: UILabel!
    @IBOutlet weak var lbGenero: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ivPoster.image = UIImage(named: filmDetail.PosterImage)
        lbFilmTitle.text = filmDetail.Title
        lbFilmInfo.text = "\(filmDetail.Duration) \(filmDetail.Year)"
        lbFilmDescription.text = filmDetail.Description
        lbGenero.text = filmDetail.Genero
    }
}

extension FilmDetailsViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filmDetail.SimilarFilms.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listItemSimilarFilms", for: indexPath) as! SimilarFilmTableViewCell
        let film = filmDetail.SimilarFilms[indexPath.row]
        cell.prepare(with: film)
        
        
        return cell
    }
    
}

extension FilmDetailsViewController : UITableViewDelegate {
    
}
