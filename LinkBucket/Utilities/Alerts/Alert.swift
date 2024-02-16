//
//  Alert.swift
//  LinkBucket
//
//  Created by Nihal Ismail on 2/16/24.
//

import Foundation

struct Alert{
    let title: String
    let message: String
}

extension Alert{
    static func duplicateName(folderName: String) -> Alert{
        return Alert(title: "Duplicate Folder", message: "The name \"\(folderName)\" is already taken. Please choose a different name.")
    }
}
