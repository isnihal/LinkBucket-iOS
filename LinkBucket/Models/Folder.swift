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
    var folderId = UUID()
    var title: String = ""
    var isDeletable: Bool = true
    var timestamp: Date = Date.now
    var lowercasedTitle: String = ""
    
    @Relationship(deleteRule: .cascade, inverse: \Link.folder)
    var links: [Link]? = []
    
    init(title: String, links: [Link], isDeletable: Bool = true) {
        self.title = title
        self.links = links
        self.isDeletable = isDeletable
        lowercasedTitle = title.lowercased()
    }
}

extension Folder{
    static let mockFolder = Folder(title: "Mock Title", links: [])
    static let savedLinks = Folder(title: "Saved Links", links: [], isDeletable: false)
}
