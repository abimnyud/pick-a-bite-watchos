//
//  RouletteView.swift
//  Pick a Bite WatchOS Watch App
//
//  Created by Abimanyu Damarjati on 15/05/25.
//

import SwiftUI

struct RouletteView: View {
    @StateObject var viewModel: RouletteViewModel

    var body: some View {
        if viewModel.isFinished {
            TenantDetailView(rouletteViewModel: viewModel)
        } else {
            ZStack {
                Text(viewModel.tenantValue.name)
                    .offset(
                        x: 0,
                        y: -64
                    )
                    .foregroundStyle(.kombuGreen)
                    .fontWeight(.medium)
                Group {
                    Image("Roulette")
                        .resizable()
                        .frame(width: 240, height: 240)
                        .ignoresSafeArea()
                        .rotationEffect(.degrees(viewModel.rotationAngle))
                        .onTapGesture {
                            viewModel.startAnimation()
                        }
                        .offset(
                            x: 0,
                            y: 110
                        )
                    Image("Indicator")
                        .resizable()
                        .frame(width: 48, height: 48)
                        .offset(y: -5)
                }
            }
            .onAppear {
                viewModel.startAnimation()
            }
        }
    }
}

#Preview {
    @Previewable @StateObject var rouletteViewModel = RouletteViewModel()
    RouletteView(viewModel: rouletteViewModel)
        .background(LinearGradient(
            colors: [.cornsilk, .caramel],
            startPoint: .top,
            endPoint: .bottom
        )
        .ignoresSafeArea())
}
