//
//  FavoritesFilmsTableViewCell.swift
//  trabalho-final-ios
//
//  Created by Thiago Mustafa on 21/10/19.
//  Copyright © 2019 Thiago Mustafa. All rights reserved.
//

import UIKit

class FavoritesFilmsTableViewCell: UITableViewCell {

    @IBOutlet weak var ivUserProfile: UIImageView!
    @IBOutlet weak var lbUserName: UILabel!
    @IBOutlet weak var lbCountFavoriteFilms: UILabel!
    //@IBOutlet weak var tvFavoriteFilms: UITableView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func prepare(with user:User){
        ivUserProfile.image = UIImage(named: user.ImageProfile)
        lbUserName.text = user.UserName
        lbCountFavoriteFilms.text = "0"//String(user.FavoriteFilms.count)
    }

}
