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
    @StateObject private var metadataProvider = MetadataProvider()
    
    var body: some View {
        if metadataProvider.error == nil{
            ProgressView()
                .task {
                    metadataProvider.fetchMetadata(of: url)
                }
        }
        else{
            if let metadata = metadataProvider.metadata{
                LinkPreviewRepresentable(metadata: metadata)
                    .fixedSize()
            }
            else{
                CompletedErrorView(url: url)
            }
        }
    }
}

private class MetadataProvider: ObservableObject{
    @Published var error: LinkBucketError?
    @Published var metadata: LPLinkMetadata?
    
    func fetchMetadata(of url: String){
        NetworkManager.shared.fetchMetadata(url: url) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let metadata):
                    self.metadata = metadata
                case .failure(let error):
                    self.error = error
                }
            }
        }
    }
}
