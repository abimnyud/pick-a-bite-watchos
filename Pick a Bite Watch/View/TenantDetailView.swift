//
//  TenantDetailView.swift
//  Pick a Bite WatchOS Watch App
//
//  Created by Abimanyu Damarjati on 15/05/25.
//

import MapKit
import SwiftUI

struct TenantDetailView: View {
    @StateObject var rouletteViewModel: RouletteViewModel
    @EnvironmentObject private var shakeGestureDetector: ShakeGestureDetector
    @State private var showImage = false

    var body: some View {
        List {
            ZStack {
                VStack(spacing: 16) {
                    Text(rouletteViewModel.tenantValue.name)
                        .font(.title3)
                        .fontWeight(.bold)
                    Text(rouletteViewModel.tenantValue.priceRange)
                        .font(.caption)

                    VStack(spacing: 6) {
                        Text("Category")
                            .font(.caption)
                            .fontWeight(.bold)
                        Text(rouletteViewModel.tenantValue.category)
                            .font(.caption)
                            .multilineTextAlignment(.center)
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding(.top, 72)
                .padding(.bottom, 16)
                .padding(.horizontal, 12)
                .background(Color.kombuGreen)
                .cornerRadius(32)

                if showImage {
                    CircledImage(imageName: rouletteViewModel.tenantValue.image, size: 120)
                        .offset(y: -120)
                        .transition(.scale)
                }
            }
            .padding(.top, 64)
            .frame(maxWidth: .infinity, alignment: .center)
            .listItemTint(.clear)
            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))

            Button {
                let location = CLLocationCoordinate2D(latitude: -6.301976, longitude: 106.653730)
                let mapItem = MKMapItem(placemark: MKPlacemark(coordinate: location, addressDictionary: nil))

                mapItem.openInMaps(launchOptions: nil)

            } label: {
                Text("Get Directions")
                    .font(.caption)
                    .fontWeight(.medium)
            }
            .frame(maxWidth: .infinity)
            .foregroundStyle(.kombuGreen)
            .listRowPlatterColor(.kombuGreen.opacity(0.2))

            Button(action: reset) {
                Text("Retry")
                    .font(.caption)
                    .fontWeight(.medium)
            }
            .frame(maxWidth: .infinity)
            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
            .foregroundStyle(.kombuGreen)
            .listRowPlatterColor(.kombuGreen.opacity(0.2))
        }
        .listStyle(.elliptical)
        .onAppear {
            withAnimation(.easeIn(duration: 0.5)) {
                showImage.toggle()
            }
        }
    }

    private func reset() {
        withAnimation {
            shakeGestureDetector.reset()
            rouletteViewModel.reset()
        }
    }
}

#Preview {
    TenantDetailView(
        rouletteViewModel: RouletteViewModel())
        .background(LinearGradient(
            colors: [.cornsilk, .caramel],
            startPoint: .top,
            endPoint: .bottom
        ).ignoresSafeArea())
        .environmentObject(ShakeGestureDetector())
}
