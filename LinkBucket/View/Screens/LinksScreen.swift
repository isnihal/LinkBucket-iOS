//
//  SavedLinksScreen.swift
//  LinkBucket
//
//  Created by Nihal Ismail on 2/9/24.
//

import SwiftUI
import SwiftData

struct LinksScreen: View {
    @State var userInput: String = ""
    @Environment(\.modelContext) var context
    @FocusState private var isFocused: Bool
    @Query var urls: [Link]
    
    var selectedFolder: Folder
    
    init(selectedFolder: Folder){
        self.selectedFolder = selectedFolder
        let selectedFolderId = selectedFolder.folderId
        
        let filter = #Predicate<Link> { $0.folder?.folderId == selectedFolderId
        }
        
        _urls = Query(filter: filter,sort: \Link.timestamp, order: .reverse)
    }
    
    func saveLink(){
        if let url = URL(string: userInput), url.host != nil{
            let link = Link(url: userInput, folder: selectedFolder)
            context.insert(link)
        }else{
            //TODO: HANDLE INVALID URL
        }
        userInput = ""
        isFocused = false
    }
    
    var body: some View {
        NavigationStack {
            VStack{
                List {
                    ForEach(urls, id: \.self) { element in
                        RichLinkPreview(url: element.url)
                            .listRowSeparator(.hidden)
                            .listRowInsets(EdgeInsets())
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
                    TextField("Paste your link here", text: $userInput)
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
            .navigationTitle(selectedFolder.title)
        }
    }
}

#Preview {
    LinksScreen(selectedFolder: .mockFolder)
}
