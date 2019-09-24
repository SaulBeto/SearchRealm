//
//  SearchBarVC.swift
//  SearchBar
//
//  Created by Saul Alberto Cortez Garcia on 1/11/19.
//  Copyright © 2019 SaulCortez. All rights reserved.
//

import UIKit
import RealmSwift

class SearchBarVC: UIViewController {
    
    @IBOutlet weak var sbProfile: UISearchBar!
    @IBOutlet weak var tblProfile: UITableView!
    
    var bbtn: UIBarButtonItem!
    var realm: Realm!
    
    var profile: [Person] {
        get {
            return Array(realm.objects(Person.self))
        }
    }
    
    var currentProfile = [Person]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        realm = try! Realm()
        drawUI()
        setUpTable()
        setUpSearchBar()
        
        currentProfile = profile

    }
    
    func setUpTable(){
        tblProfile.delegate = self
        tblProfile.dataSource = self
        tblProfile.isHidden = true
    }
    
    func setUpSearchBar(){
        sbProfile.delegate = self
        sbProfile.showsCancelButton = true
        sbProfile.backgroundColor = UIColor.white        
    }
    
    func drawUI() {
        view.backgroundColor = .white
//        navigationItem.title = "Nombres"
//        navigationController?.navigationBar.prefersLargeTitles = true
        
        bbtn = UIBarButtonItem(title: "Agregar", style: .done, target: self, action: #selector(newName))
        navigationItem.rightBarButtonItem = bbtn
        navigationController?.navigationBar.tintColor = UIColor.black
    }
    
    @objc func newName() {
        let alertVC = UIAlertController(title: "Nuevo", message: "Agrega un nuevo nombre", preferredStyle: .alert)
        alertVC.addTextField(configurationHandler: nil)
        let cancelAction = UIAlertAction(title: "Cancelar", style: .destructive, handler: nil)
        let addAction = UIAlertAction(title: "Agregar", style: .default) { (UIAlertAction) in
            let myTextField = (alertVC.textFields?.first)! as UITextField
            
            let profile = Person()
            profile.name = myTextField.text!
            
            try! self.realm.write {
                self.realm.add(profile)
                self.currentProfile = self.profile //3 we have to update de array, if we don`t the app will crash
                self.tblProfile.insertRows(at: [IndexPath(row: self.currentProfile.count - 1, section: 0)], with: .automatic)//4
                //
                //Replace 3 and 4 if you want to use -reloaddata-
                //tblProfile.reloadData()

            }
        }
        alertVC.addAction(cancelAction)
        alertVC.addAction(addAction)
        present(alertVC, animated: true, completion: nil)
    }
}

