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
        HStack{
            Text(url)
                .padding(.leading)
                .foregroundStyle(.foreground)
            Image(systemName: "safari")
                .foregroundStyle(.foreground)
            Spacer()
        }
        .onTapGesture {
            if let url = URL(string: url){
                UIApplication.shared.open(url)
            }
        }
        .padding()
        .background(.bubbleGray.opacity(0.25))
        .clipShape(.capsule)
    }
}

#Preview {
    CompletedErrorView(url: "https://www.google.com")
}
