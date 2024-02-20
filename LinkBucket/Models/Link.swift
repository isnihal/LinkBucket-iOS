//
//  Link.swift
//  LinkBucket
//
//  Created by Nihal Ismail on 2/13/24.
//

import Foundation
import SwiftData

@Model
class Link{
    var url: String = ""
    var folder: Folder?
    var timestamp: Date = Date.now
    
    init(url: String, folder: Folder?) {
        self.url = url
        self.folder = folder
    }
}
