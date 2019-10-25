//
//  FavoritesTableViewController.swift
//  trabalho-final-ios
//
//  Created by Thiago Mustafa on 21/10/19.
//  Copyright © 2019 Thiago Mustafa. All rights reserved.
//

import UIKit

class FavoritesTableViewController: UITableViewController {
    var user = User(UserName: "",ImageProfile: "", FavoriteFilms: [])
    
    override func viewWillAppear(_ animated: Bool) {
        print("viewWillAppear was just called")
        super.viewWillAppear(true)
        loadUser()
    }
    
    override func viewDidLoad() {
        print("viewDidLoad was just called")
        super.viewDidLoad()
    }
    
    func loadUser()
    {
        let fileURL = Bundle.main.url(forResource: "userData.json", withExtension: nil)!
        do {
            let jsonData = try Data(contentsOf: fileURL)
            user = try JSONDecoder().decode(User.self, from: jsonData)
            tableView.reloadData()
        } catch {
            print(error.localizedDescription)
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1 + user.FavoriteFilms.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "userData", for: indexPath) as! FavoritesFilmsTableViewCell
            cell.prepare(with: user)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "favoriteFilmsCell", for: indexPath) as! FilmTableViewCell
            cell.prepare(with: user.FavoriteFilms[indexPath.row - 1])
            
            return cell
        }
    }
 
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 358
        }
        return 191
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
