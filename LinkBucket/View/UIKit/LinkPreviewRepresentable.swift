//
//  LinkPreviewRepresentable.swift
//  LinkBucket
//
//  Created by Nihal Ismail on 2/9/24.
//

import Foundation
import SwiftUI
import LinkPresentation

struct LinkPreviewRepresentable: UIViewRepresentable{
    let metadata: LPLinkMetadata
    
    func makeUIView(context: Context) -> LPLinkView {
        LPLinkView(metadata: metadata)
    }
    
    func updateUIView(_ uiView: LPLinkView, context: Context) {
        
    }
}
