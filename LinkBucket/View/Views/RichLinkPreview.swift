//
//  RichLinkPreview.swift
//  LinkBucket
//
//  Created by Nihal Ismail on 2/9/24.
//

import Foundation
import SwiftUI
import LinkPresentation

struct RichLinkPreview: View {
    let url: String
    private let metadataProvider = MetadataProvider()
    
    var body: some View {
        if metadataProvider.metadata == nil{
            ProgressView()
        }
        else{
            if let metadata = metadataProvider.metadata{
                LinkPreviewRepresentable(metadata: metadata)
            }
            else{
                //TODO: ERROR VIEW
            }
        }
    }
}

private class MetadataProvider: ObservableObject{
    @Published var metadata: LPLinkMetadata?
    
    func fetchMetadata(of url: String){
        NetworkManager.shared.fetchMetadata(url: url) { metadata in
            DispatchQueue.main.async {
                self.metadata = metadata
            }
        }
    }
}
