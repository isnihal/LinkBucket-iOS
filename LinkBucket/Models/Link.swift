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
    let url: String?
    
    init(url: String?) {
        self.url = url
    }
}
