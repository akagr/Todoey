//
//  Item.swift
//  Todoey
//
//  Created by Akash Agrawal on 13/03/19.
//  Copyright © 2019 Akash Agrawal. All rights reserved.
//

import Foundation
import RealmSwift

class Item: Object {
    @objc dynamic var title: String = ""
    @objc dynamic var done: Bool = false
    @objc dynamic var dateCreated: Date?
    var parentCategory = LinkingObjects(fromType: Category.self, property: "items")
}
