//
//  FoldersScreen.swift
//  LinkBucket
//
//  Created by Nihal Ismail on 2/14/24.
//

import SwiftUI

struct FoldersScreen: View {
    var body: some View {
        NavigationStack{
            VStack{
                LazyVGrid(columns: [GridItem(.flexible()),GridItem(.flexible())], content: {
                    FolderView()
                    FolderView()
                })
                Spacer()
            }
            .padding()
            .navigationTitle("Folders")
        }
    }
}

#Preview {
    FoldersScreen()
}
