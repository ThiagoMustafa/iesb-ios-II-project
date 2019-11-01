//
//  SimilarFilmTableViewCell.swift
//  trabalho-final-ios
//
//  Created by Thiago Mustafa on 13/08/19.
//  Copyright © 2019 Thiago Mustafa. All rights reserved.
//

import UIKit

class SimilarFilmTableViewCell: UITableViewCell {

    @IBOutlet weak var ivPosterSimilarFilm: UIImageView!
    @IBOutlet weak var lbTitleSimilarFilm: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func prepare(with similarFilm: SimilarFilm){
        ivPosterSimilarFilm.image = UIImage(named: similarFilm.PosterImage)
        lbTitleSimilarFilm.text = similarFilm.Title
    }
}
