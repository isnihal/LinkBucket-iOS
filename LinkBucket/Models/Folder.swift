//
//  Folder.swift
//  LinkBucket
//
//  Created by Nihal Ismail on 2/14/24.
//

import Foundation
import SwiftData

@Model
class Folder{
    var title: String = ""
    
    init(title: String) {
        self.title = title
    }
}
