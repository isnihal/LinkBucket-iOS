//
//  SavedLinksScreen.swift
//  LinkBucket
//
//  Created by Nihal Ismail on 2/9/24.
//

import SwiftUI

struct SavedLinksScreen: View {
    @State var url: String
     
    var body: some View {
        NavigationStack {
            VStack{
                ScrollView{
                    VStack(alignment: .leading){
                        HStack{
                            Spacer()
                        }
                        RichLinkPreview(url: "https://youtube.com/shorts/fofT4SJ4LRQ?si=6jIEZfi3aJeM7bsh")
                    }
                }
                HStack{
                    TextField("Paste your link here", text: $url)
                        .keyboardType(.URL)
                    Spacer()
                    Button(action: {
                        print("Hello")
                    }, label: {
                        Image(systemName: "arrow.up.circle.fill")
                            .imageScale(.large)
                            .foregroundStyle(.blue)
                    })
                }
                .frame(maxWidth: .infinity)
                .padding(.horizontal)
                .padding(.vertical,4)
                .background()
                .clipShape(.capsule)
                .overlay(
                    Capsule().stroke(Color.secondary)
                        .opacity(0.5)
                )
                .padding(.trailing)
                .safeAreaPadding(.bottom)
            }
            .padding(.leading)
            .scrollDismissesKeyboard(.interactively)
            .navigationTitle("Saved Links")
        }
    }
}

#Preview {
    SavedLinksScreen(url: "")
}
