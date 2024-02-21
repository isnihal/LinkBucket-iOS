//
//  LinkBucketErrors.swift
//  LinkBucket
//
//  Created by Nihal Ismail on 2/21/24.
//

enum LinkBucketError: Error{
    case invalidHost
    case invalidURL
    case invalidMetadata
    case others(message: String)
}
