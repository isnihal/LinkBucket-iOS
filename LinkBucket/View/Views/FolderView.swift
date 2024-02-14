//
//  Folder.swift
//  LinkBucket
//
//  Created by Nihal Ismail on 2/14/24.
//

import SwiftUI

struct FolderView: View {
    var folder: Folder
    
    var body: some View {
        VStack{
            NavigationLink {
                SavedLinksScreen(selectedFolder: folder)
            } label: {
                Image(systemName: "folder.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 100)
                    .foregroundStyle(.folder)
            }
            Text(folder.title)
                .font(.title3)
        }
    }
}

#Preview {
    FolderView(folder: .mockFolder)
}
