//
//  BaconCoders_OMG_iOSApp.swift
//  BaconCoders_OMG_iOS
//
//  Created by 알파카 on 2024/09/22.
//

import SwiftUI

@main
struct BaconCoders_OMG_iOSApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
