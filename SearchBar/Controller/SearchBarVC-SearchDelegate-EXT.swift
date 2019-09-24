//
//  SearchBarVC-SearchDelegate-EXT.swift
//  SearchBar
//
//  Created by Saul Alberto Cortez Garcia on 1/14/19.
//  Copyright © 2019 SaulCortez. All rights reserved.
//

import UIKit

extension SearchBarVC: UISearchBarDelegate{
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        print("Action cancel")
        tblProfile.isHidden = true
        sbProfile.resignFirstResponder()
    }
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        print("Did begin editing")
        tblProfile.isHidden = false
        
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        currentProfile = profile.filter({ profile -> Bool in
            switch searchBar.selectedScopeButtonIndex {
            case 0:
                if searchText.isEmpty{ return true }
                return profile.name.lowercased().contains(searchText.lowercased())
            default:
                return false
            }
        })
        tblProfile.reloadData()
    }
}
