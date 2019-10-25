//
//  FavoritesViewController.swift
//  trabalho-final-ios
//
//  Created by Thiago Mustafa on 13/08/19.
//  Copyright © 2019 Thiago Mustafa. All rights reserved.
//

import UIKit

class FavoritesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var user = User(UserName: "",ImageProfile: "", FavoriteFilms: [])
    
    //@IBOutlet weak var ivProfile: UIImageView!
    //@IBOutlet weak var lbUserName: UILabel!
    //@IBOutlet weak var lbNumberFilms: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tableViewFavoriteFilms: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "userData")
        
        tableViewFavoriteFilms.dataSource = self
        tableViewFavoriteFilms.delegate = self
                tableView.register(UITableViewCell.self, forCellReuseIdentifier: "userData")
        
        loadUser()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! FilmDetailsViewController
        let film = user.FavoriteFilms[tableViewFavoriteFilms.indexPathForSelectedRow!.row]
        vc.filmDetail = film
    }
    
    func loadUser()
    {
        let fileURL = Bundle.main.url(forResource: "userData.json", withExtension: nil)!
        let jsonData = try! Data(contentsOf: fileURL)
        do {
            user = try JSONDecoder().decode(User.self, from: jsonData)
            //ivProfile.image = UIImage(named: user.ImageProfile)
            //lbUserName.text = user.UserName
            //lbNumberFilms.text = String(user.FavoriteFilms.count)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == self.tableView {
            return 1
        }else{
            return user.FavoriteFilms.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //var cell:UITableViewCell?
        
        if tableView == self.tableView {
            let cell = tableView.dequeueReusableCell(withIdentifier: "userData", for: indexPath) as! UserTableViewCell
            cell.prepare(with: user)
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "favoriteFilmsCell", for: indexPath) as! FilmTableViewCell
            let film = user.FavoriteFilms[indexPath.row]
            
            cell.prepare(with: film)
            
            return cell
        }
        
        
        //let cell = tableView.dequeueReusableCell(withIdentifier: "cellFavoriteFilms", for: indexPath) as! FilmTableViewCell
        
        //let film = user.FavoriteFilms[indexPath.row]
        
        //cell.prepare(with: film)
        
        //return cell
    }

}

/*extension FavoritesViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return user.FavoriteFilms.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellFavoriteFilms", for: indexPath) as! FilmTableViewCell
        
        let film = user.FavoriteFilms[indexPath.row]
        
        cell.prepare(with: film)
        
        return cell
    }
    
}

extension FavoritesViewController : UITableViewDelegate {
}*/
