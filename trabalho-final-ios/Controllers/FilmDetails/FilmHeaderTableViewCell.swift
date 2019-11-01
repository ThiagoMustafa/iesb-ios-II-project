//
//  FilmHeaderTableViewCell.swift
//  trabalho-final-ios
//
//  Created by HC2MAC32 on 31/10/2019.
//  Copyright © 2019 Thiago Mustafa. All rights reserved.
//

import UIKit

class FilmHeaderTableViewCell: UITableViewCell {

    
    @IBOutlet weak var ivPoster: UIImageView!
    @IBOutlet weak var lbFilmTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func prepare(img: String, title: String){
        ivPoster.image = UIImage(named: img)
        lbFilmTitle.text = title
    }

}
