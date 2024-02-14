//
//  FoldersScreen.swift
//  LinkBucket
//
//  Created by Nihal Ismail on 2/14/24.
//

import SwiftUI
import SwiftData

struct FoldersScreen: View {
    @Environment(\.modelContext) var context
    @Query(sort: \Folder.timestamp) var folders: [Folder]
    @State var showFolderCreationSheet = false
    @State var inputValue: String = ""
    
    private func createFolder(){
        let folder = Folder(title: inputValue, links: [])
        context.insert(folder)
        inputValue = ""
        showFolderCreationSheet = false
    }
    
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
                VStack{
                    HStack{
                        Button(role: .destructive,action: {
                            showFolderCreationSheet = false
                        }, label: {
                            Text("Cancel")
                        })
                        Spacer()
                        Text("Create Bucket")
                            .font(.title3)
                            .bold()
                        Spacer()
                        Button(action: {
                            if !inputValue.isEmpty{
                                createFolder()
                            }
                            else{
                                //TODO: Avoid creating empty folder names
                            }
                        }, label: {
                           Text("Done")
                        })
                    }
                    Spacer()
                    Image(systemName: "folder.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 240)
                        .foregroundStyle(.folder)
                        .padding(.bottom,4)
                    TextField("Enter the bucket name",text: $inputValue)
                        .multilineTextAlignment(.center)
                    Spacer()
                }
                .padding()
            })
        }
    }
}

#Preview {
    FoldersScreen()
}
