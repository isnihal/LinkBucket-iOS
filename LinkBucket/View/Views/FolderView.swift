//
//  Folder.swift
//  LinkBucket
//
//  Created by Nihal Ismail on 2/14/24.
//

import SwiftUI

struct FolderView: View {
    
    var folder: Folder
    
    @State var showDeleteAlert: Bool = false
    @Environment(\.modelContext) var context
    
    var body: some View {
        VStack{
            NavigationLink {
                LinksScreen(selectedFolder: folder)
            } label: {
                Image(systemName: "folder.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 100)
                    .foregroundStyle(.folder)
            }
            .contextMenu {
                if folder.isDeletable{
                    Button(role: .destructive){
                        showDeleteAlert = true
                    } label: {
                        Label("Delete Folder", systemImage: "trash")
                    }
                }
            }
            Text(folder.title)
                .font(.title3)
                .multilineTextAlignment(.center)
                .lineLimit(1)
        }
        .alert("Delete Folder", isPresented: $showDeleteAlert) {
            Button(role: .destructive, action: {
                context.delete(folder)
            }, label: {
                Text("Delete")
                    .bold()
            })
        } message: {
            Text("Are you sure you want to delete this folder? Deleting the folder will also delete all the files inside it.")
        }

    }
}

#Preview {
    FolderView(folder: .mockFolder)
}
