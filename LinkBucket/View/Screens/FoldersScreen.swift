//
//  FoldersScreen.swift
//  LinkBucket
//
//  Created by Nihal Ismail on 2/14/24.
//

import SwiftUI
import SwiftData

struct FoldersScreen: View {
    @Query(sort: \Folder.title) var folders: [Folder]
    
    var body: some View {
        NavigationStack{
            VStack{
                LazyVGrid(columns: [GridItem(.flexible()),GridItem(.flexible())], content: {
                    FolderView(folder: .savedLinks)
                    FolderView(folder: Folder(title: "Hello", links: []))
                })
                Spacer()
            }
            .padding()
            .navigationTitle("Your Buckets")
        }
    }
}

#Preview {
    FoldersScreen()
}
