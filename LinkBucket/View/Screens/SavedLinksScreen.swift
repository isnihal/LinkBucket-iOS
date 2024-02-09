//
//  SavedLinksScreen.swift
//  LinkBucket
//
//  Created by Nihal Ismail on 2/9/24.
//

import SwiftUI

struct SavedLinksScreen: View {
    var body: some View {
        NavigationStack {
            VStack{
                RichLinkPreview(url: "https://youtube.com/shorts/fofT4SJ4LRQ?si=6jIEZfi3aJeM7bsh")
            }
            .padding()
            .navigationTitle("Saved Links")
        }
    }
}

#Preview {
    SavedLinksScreen()
}
