//
//  Extensions.swift
//  LinkBucket
//
//  Created by Nihal Ismail on 2/20/24.
//

import Foundation

extension String{
    var isValidUrl: Bool{
        // This pattern matches a string that starts with the form https://www. or http://www. and the"website" part (alphanumeric characters, hyphens, or underscores),a dot, and then the "extension" part (alphanumeric characters, at least 2 characters long).
        let pattern = "^(https?:\\/\\/)?(www\\.)?([a-zA-Z0-9_-]+)\\.([a-zA-Z]{2,}).*"
            let regex = try! NSRegularExpression(pattern: pattern)
            let matches = regex.matches(in: self, range: NSRange(location: 0, length: self.utf16.count))
            return !matches.isEmpty
    }
    
    var isValidSimpleURL: Bool {
        // This pattern matches a string that starts with the format, "website" part (alphanumeric characters, hyphens, or underscores),a dot, and then the "extension" part (alphanumeric characters, at least 2 characters long).
        let pattern = "^[a-zA-Z0-9_-]+\\.[a-zA-Z0-9]{2,}$"
        let regex = try! NSRegularExpression(pattern: pattern)
        let matches = regex.matches(in: self, range: NSRange(location: 0, length: self.utf16.count))
        return !matches.isEmpty
    }
    
    var isValidWWWURL: Bool {
        // This pattern matches a string that starts with "www.",followed by the "website" part (alphanumeric characters, hyphens, or underscores),a dot, and then the "extension" part (alphanumeric characters, at least 2 characters long).
        let pattern = "^www\\.[a-zA-Z0-9_-]+\\.[a-zA-Z]{2,}$"
        let regex = try! NSRegularExpression(pattern: pattern)
        let matches = regex.matches(in: self, range: NSRange(location: 0, length: self.utf16.count))
        return !matches.isEmpty
    }
    
    var formattedUrl: String{
        if self.isValidSimpleURL{
            return "https://www.\(self)"
        }
        else if self.isValidWWWURL{
            return "https://\(self)"
        }
        else{
            return self
        }
    }
}
