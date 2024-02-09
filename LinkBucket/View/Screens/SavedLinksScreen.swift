//
//  SavedLinksScreen.swift
//  LinkBucket
//
//  Created by Nihal Ismail on 2/9/24.
//

import SwiftUI

struct SavedLinksScreen: View {
    @State var url: String
    
    @State var urls: [String] = []
     
    var body: some View {
        NavigationStack {
            VStack{
                List {
                    ForEach(urls, id: \.self) { element in
                        RichLinkPreview(url: element)
                            .listRowSeparator(.hidden)
                            .listRowInsets(EdgeInsets())
                    }
                    .onDelete(perform: { indexSet in
                        urls.remove(atOffsets: indexSet)
                    })
                }
                .listStyle(.plain)
                HStack{
                    TextField("Paste your link here", text: $url)
                        .keyboardType(.URL)
                    Spacer()
                    Button(action: {
                        urls.append(url)
                        url = ""
                        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
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
