//
//  MainView.swift
//  Pick a Bite WatchOS Watch App
//
//  Created by Abimanyu Damarjati on 15/05/25.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        VStack(spacing: 16) {
            Image(systemName: "hand.wave")
                .resizable()
                .frame(width: 64, height: 64)
                .foregroundStyle(.kombuGreen)
                .symbolEffect(.wiggle.byLayer, options: .repeat(.continuous))
            VStack {
                Text("Shake your wrist")
                    .font(.headline)
                    .foregroundStyle(.kombuGreen)
                Text("to discover your next bite! 🍔")
                    .font(.footnote)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.kombuGreen)
            }
        }
        .padding()
        .toolbar(.hidden)
        .toolbarColorScheme(.dark)
    }
}

