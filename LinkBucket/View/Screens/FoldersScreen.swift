//
//  FoldersScreen.swift
//  LinkBucket
//
//  Created by Nihal Ismail on 2/14/24.
//

import SwiftUI
import SwiftData

struct FoldersScreen: View {
    
    @Query(sort: \Folder.timestamp) var folders: [Folder]
    @State var showFolderCreationSheet = false
    
    var body: some View {
        NavigationStack{
            VStack{
                ScrollView{
                    LazyVGrid(columns: [GridItem(.flexible()),GridItem(.flexible())], content: {
                        FolderView(folder: .savedLinks)
                        ForEach(folders) { folder in
                            FolderView(folder: folder)
                        }
                        ZStack{
                            FolderView(folder: .mockFolder)
                                .opacity(0)
                            Button(action: {
                                showFolderCreationSheet = true
                            }, label: {
                                Image(systemName: "plus.viewfinder")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 50)
                                    .foregroundStyle(.gray)
                            })
                        }
                    })
                }
                Spacer()
            }
            .padding()
            .navigationTitle("Your Buckets")
            .sheet(isPresented: $showFolderCreationSheet, content: {
                AddBucketSheet(showFolderCreationSheet: $showFolderCreationSheet)
                .padding()
            })
        }
    }
}

#Preview {
    FoldersScreen()
}
