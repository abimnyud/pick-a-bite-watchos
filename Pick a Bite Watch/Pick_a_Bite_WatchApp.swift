//
//  Pick_a_Bite_WatchApp.swift
//  Pick a Bite Watch Watch App
//
//  Created by Abimanyu Damarjati on 18/05/25.
//

import SwiftUI

@main
struct Pick_a_Bite_WatchApp: App {
    @State private var shakeGestureDetector = ShakeGestureDetector()

    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
                    .environmentObject(shakeGestureDetector)
                    .onContinueUserActivity("GetRandomFoodTenantIntent") { _ in
                        shakeGestureDetector.triggerShake()
                    }
            }
        }
    }
}
