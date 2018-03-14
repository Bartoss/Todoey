//
//  Category.swift
//  Todoey
//
//  Created by Sarata Bartlomiej on 14.03.2018.
//  Copyright © 2018 Bartłomiej Sarata. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object{
    @objc dynamic var name: String = ""
    let items = List<Item>()
}
