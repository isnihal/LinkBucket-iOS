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
            Spacer()
            Image(systemName: "safari")
                .imageScale(.large)
                .foregroundStyle(.black.opacity(0.5))
                .padding(6)
                .background()
            Spacer()
                .frame(width: 4)
        }
        .onTapGesture {
            if let url = URL(string: url){
                UIApplication.shared.open(url)
            }
        }
        .padding(.trailing)
        .padding(.vertical,8)
        .background(.bubbleGray.opacity(0.25))
        .clipShape(.capsule)
    }
}

#Preview {
    CompletedErrorView(url: "https://www.google.com")
}
