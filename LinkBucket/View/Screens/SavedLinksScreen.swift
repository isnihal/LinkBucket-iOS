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
    
    @Query(sort: \Link.timestamp, order: .reverse) var urls: [Link]
    
    @Environment(\.modelContext) var context
    
    @FocusState private var isFocused: Bool
    
    func saveLink(){
        if let url = URL(string: inputValue), url.host != nil{
            let link = Link(url: inputValue)
            context.insert(link)
        }else{
            //TODO: HANDLE INVALID URL
        }
        inputValue = ""
        isFocused = false
    }
    
    var body: some View {
        NavigationStack {
            VStack{
                List {
                    ForEach(urls, id: \.self) { element in
                        if let url = element.url{
                            RichLinkPreview(url: url)
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
                .listRowSpacing(16)
                HStack{
                    TextField("Paste your link here", text: $inputValue)
                        .focused($isFocused)
                        .keyboardType(.URL)
                        .onSubmit{
                            saveLink()
                        }
                    Spacer()
                    Button(action: {
                       saveLink()
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
