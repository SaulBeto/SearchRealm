//
//  SearchBarVC-TableView-EXT.swift
//  SearchBar
//
//  Created by Saul Alberto Cortez Garcia on 1/16/19.
//  Copyright © 2019 SaulCortez. All rights reserved.
//

import UIKit

extension SearchBarVC: UITableViewDelegate{
    
}

extension SearchBarVC: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return currentProfile.count > 0 ? "Wasa": "asaw"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentProfile.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblProfile.dequeueReusableCell(withIdentifier: Cell.reuseIdentifier, for: indexPath) as! Cell
        let item = currentProfile[indexPath.row]
        cell.lblName.text = item.name
        cell.ivPicture.image = UIImage(named: item.image)
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath){
        if editingStyle == .delete {
            let profile = currentProfile[indexPath.row]
            
            try! self.realm.write {
                self.realm.delete(profile)
                self.currentProfile = self.profile // 1 we have to update de array, if we don`t the app will crash
            }
            tableView.deleteRows(at: [indexPath], with: .automatic) // 2
            //Delete 1 and 2 if you want to use -reloaddata-
            //tableView.reloadData()
        }
    }
}

