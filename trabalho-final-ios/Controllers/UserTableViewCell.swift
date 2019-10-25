//
//  UserTableViewCell.swift
//  trabalho-final-ios
//
//  Created by HC2MAC32 on 24/10/2019.
//  Copyright © 2019 Thiago Mustafa. All rights reserved.
//

import UIKit

class UserTableViewCell: UITableViewCell {
    @IBOutlet weak var ivUserProfile: UIImageView!
    @IBOutlet weak var lbUserName: UILabel!
    @IBOutlet weak var lbCountFavoriteFilms: UILabel!
    
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
        lbCountFavoriteFilms.text = String(user.FavoriteFilms.count)
    }
}
