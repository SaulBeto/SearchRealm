//
//  Person.swift
//  SearchBar
//
//  Created by Saul Alberto Cortez Garcia on 1/14/19.
//  Copyright © 2019 SaulCortez. All rights reserved.
//

import Foundation
import RealmSwift

class Person: Object {
    @objc dynamic var name = ""
    @objc dynamic var image = "profile"
}
