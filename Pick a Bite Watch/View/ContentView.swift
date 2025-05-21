//
//  ContentView.swift
//  Pick a Bite WatchOS Watch App
//
//  Created by Abimanyu Damarjati on 09/05/25.
//

import CoreMotion
import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var shakeGestureDetector: ShakeGestureDetector
    @StateObject private var rouletteViewModel = RouletteViewModel()

    var body: some View {
        NavigationStack {
            if shakeGestureDetector.isShaking {
                RouletteView(viewModel: rouletteViewModel)

            } else {
                MainView()
                    .onTapGesture {
                        shakeGestureDetector.triggerShake()
                    }
            }
        }
        .background(
            LinearGradient(
                colors: [.cornsilk, .caramel],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
        )
    }
}

#Preview {
    ContentView()
        .environmentObject(ShakeGestureDetector())
}
