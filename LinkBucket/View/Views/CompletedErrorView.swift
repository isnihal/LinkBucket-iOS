//
//  CompletedErrorView.swift
//  LinkBucket
//
//  Created by Nihal Ismail on 2/21/24.
//

import Foundation
import SwiftUI

struct CompletedErrorView: View {
    let url: String
    
    var body: some View {
        Button(action: {
            if let url = URL(string: url){
                UIApplication.shared.open(url)
            }
        }, label: {
            Text(url)
                .padding([.bottom,.leading,.top])
                .foregroundStyle(.foreground)
            Image(systemName: "safari")
                .foregroundStyle(.foreground)
            Spacer()
        })
        .background(.bubbleGray)
        .clipShape(.capsule)
    }
}

#Preview {
    CompletedErrorView(url: "https://www.google.com")
}
