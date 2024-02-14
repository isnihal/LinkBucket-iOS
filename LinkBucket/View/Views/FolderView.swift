//
//  Folder.swift
//  LinkBucket
//
//  Created by Nihal Ismail on 2/14/24.
//

import SwiftUI

struct FolderView: View {
    var body: some View {
        VStack{
            Button(action: {}, label: {
                Image(systemName: "folder.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 100)
                    .foregroundStyle(.folder)
            })
            Text("Folder Name")
                .font(.title3)
        }
    }
}

#Preview {
    FolderView()
}
