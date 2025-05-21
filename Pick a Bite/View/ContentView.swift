//
//  ContentView.swift
//  Pick a Bite
//
//  Created by Abimanyu Damarjati on 18/05/25.
//

import SwiftData
import SwiftUI

struct ContentView: View {
//    @Environment(\.modelContext) private var modelContext
//    @Query private var items: [Item]
    @State private var isSiriShortcutPresented = false

    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                Button {
                    isSiriShortcutPresented = true
                } label: {
                    HStack(spacing: 0) {
                        Image("SiriIcon")
                            .resizable()
                            .frame(width: 50, height: 50)
                        Text("Add to Siri")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .padding()
                            .foregroundColor(.white)
                    }
                    .padding(.all)
                }.background(.black)
                    .cornerRadius(32)
                Spacer()
            }
            .navigationTitle("Siri Shortcuts")
        }
        .sheet(isPresented: $isSiriShortcutPresented) {
            SiriShortcutSetupView(isPresented: $isSiriShortcutPresented)
        }
    }
}

#Preview {
    ContentView()
//        .modelContainer(for: Item.self, inMemory: true)
}
