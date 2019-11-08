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
    
    var favoriteFilms = [Film]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //favoriteFilmsTableView.hidden = true
        
//        // Register cell
//        favoriteFilmsTableView.register(UITableViewCell.self, forCellReuseIdentifier: "favoriteFilmsCell")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func prepare(with user:User){
        ivUserProfile.image = UIImage(named: user.ImageProfile)
        lbUserName.text = user.UserName
        lbCountFavoriteFilms.text = String(user.FavoriteFilms.count)
//        favoriteFilms = user.FavoriteFilms
//        favoriteFilmsTableView.dataSource = self
//        favoriteFilmsTableView.delegate = self
//        favoriteFilmsTableView.isScrollEnabled = true
//        favoriteFilmsTableView.reloadData()
        print(favoriteFilms)
    }
    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return favoriteFilms.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cellFavoriteFilms", for: indexPath) as! FilmTableViewCell
//
//        let film = favoriteFilms[indexPath.row]
//
//        cell.prepare(with: film)
//
//        return cell
//    }

}

/*extension FavoritesFilmsTableViewCell: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoriteFilms.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellFavoriteFilms", for: indexPath) as! FilmTableViewCell
        
        let film = favoriteFilms[indexPath.row]
        
        cell.prepare(with: film)
        
        return cell
    }
    
    
}*/