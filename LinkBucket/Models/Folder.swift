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
    @Relationship(deleteRule: .cascade, inverse: \Link.folder)
    var links: [Link] = []
    var timestamp: Date = Date.now
    
    init(title: String, links: [Link]) {
        self.title = title
        self.links = links
    }
}

extension Folder{
    static let mockFolder = Folder(title: "Mock Title", links: [])
    static let savedLinks = Folder(title: "Saved Links", links: [])
}
