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
                Button(role: .destructive){
                        showDeleteAlert = true
                    } label: {
                        Label("Delete Bucket", systemImage: "trash")
                    }
                }
            Text(folder.title)
                .font(.title3)
        }
        .alert("Delete Bucket", isPresented: $showDeleteAlert) {
            Button(role: .destructive, action: {
                context.delete(folder)
            }, label: {
                Text("Delete")
                    .bold()
            })
        } message: {
            Text("Are you sure you want to delete this bucket? Deleting the bucket will also delete all the files inside it.")
        }

    }
}

#Preview {
    FolderView(folder: .mockFolder)
}
