//
//  Category.swift
//  Todoey
//
//  Created by Akash Agrawal on 13/03/19.
//  Copyright © 2019 Akash Agrawal. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    @objc dynamic var name: String = ""
    let items = List<Item>()
}
