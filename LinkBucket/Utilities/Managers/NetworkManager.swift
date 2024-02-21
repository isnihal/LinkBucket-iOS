//
//  NetworkManager.swift
//  LinkBucket
//
//  Created by Nihal Ismail on 2/9/24.
//

import Foundation
import LinkPresentation

struct NetworkManager{
    static let shared = NetworkManager()
    
    private init() {}
    
    private let cache = NSCache<NSString,LPLinkMetadata>()
    
    func fetchMetadata(url: String, completed: @escaping(Result<LPLinkMetadata,LinkBucketError>) -> Void){
        let cacheKey = NSString(string: url.normalizedURL)
        let metadata = cache.object(forKey: cacheKey)
        if let metadata{
            completed(.success(metadata))
        }
        else{
            guard let url = URL(string: url) else {return completed(.failure(.invalidURL))} //TODO: THROW ERROR
            let metadataProvider = LPMetadataProvider()
            metadataProvider.startFetchingMetadata(for: url) { metadata, error in
                if error != nil{
                    completed(.failure(.others(message: error?.localizedDescription ?? "")))
                }
                else{
                    if let metadata{
                        cache.setObject(metadata, forKey: cacheKey)
                        completed(.success(metadata))
                    }
                    else{
                        completed(.failure(.invalidMetadata))
                    }
                }
            }
        }
    }
}
