//
//  ChecklistItem.swift
//  todolist
//
//  Created by tam nguyen on 5/23/20.
//  Copyright © 2020 tam nguyen. All rights reserved.
//

import Foundation
class ChecklistItem: NSObject, Encodable, Decodable  {
    var text = ""
    var checked = false
}
