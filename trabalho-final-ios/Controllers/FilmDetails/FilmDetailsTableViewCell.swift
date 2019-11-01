//
//  FilmDetailsTableViewCell.swift
//  trabalho-final-ios
//
//  Created by HC2MAC32 on 31/10/2019.
//  Copyright © 2019 Thiago Mustafa. All rights reserved.
//

import UIKit

class FilmDetailsTableViewCell: UITableViewCell {

    @IBOutlet weak var lbfilmDescription: UILabel!
    @IBOutlet weak var lbFilmInfo: UILabel!
    @IBOutlet weak var lbGenero: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func prepare(description: String, info: String, genero: String){
        lbfilmDescription.text = description
        lbFilmInfo.text = info
        lbGenero.text = genero
    }

}
