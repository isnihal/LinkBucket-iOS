//
//  LinkBucketApp.swift
//  LinkBucket
//
//  Created by Nihal Ismail on 2/9/24.
//

import SwiftUI
import SwiftData

@main
struct LinkBucketApp: App {
    
    let modelContainer: ModelContainer
    
    init() {
        do{
            modelContainer = try ModelContainer(for: Link.self)
        }
        catch{
            fatalError("Error initializing model container: \(error)")
        }
    }
    
    var body: some Scene {
        WindowGroup {
            SavedLinksScreen(url: "")
                .modelContainer(modelContainer)
        }
    }
}
