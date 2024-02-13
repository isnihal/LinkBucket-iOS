//
//  SavedLinksScreen.swift
//  LinkBucket
//
//  Created by Nihal Ismail on 2/9/24.
//

import SwiftUI
import SwiftData

struct SavedLinksScreen: View {
    @State var inputValue: String
    
    @Query(sort: \Link.url) var urls: [Link]
    
    @Environment(\.modelContext) var context
    
    var body: some View {
        NavigationStack {
            VStack{
                List {
                    ForEach(urls, id: \.self) { element in
                        if let url = element.url{
                            RichLinkPreview(url: url)
                                .padding(.bottom)
                                .listRowSeparator(.hidden)
                                .listRowInsets(EdgeInsets())
                        }
                    }
                    .onDelete(perform: { indexSet in
                        for index in indexSet{
                            context.delete(urls[index])
                        }
                    })
                }
                .listStyle(.plain)
                HStack{
                    TextField("Paste your link here", text: $inputValue)
                        .keyboardType(.URL)
                    Spacer()
                    Button(action: {
                        let link = Link(url: inputValue)
                        context.insert(link)
                       //TODO: SHORTEN THIS FUNCTION
                        inputValue = ""
//                        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
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
    SavedLinksScreen(inputValue: "")
}
