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
    
    func fetchMetadata(url: String, completed: @escaping(LPLinkMetadata?) -> Void){
        let metadataProvider = LPMetadataProvider()
        guard let url = URL(string: url) else {return} //TODO: THROW ERROR
        metadataProvider.startFetchingMetadata(for: url) { metadata, error in
            if error != nil{
                //TODO: THROW ERROR
            }
            else{
                completed(metadata)
            }
        }
    }
}
