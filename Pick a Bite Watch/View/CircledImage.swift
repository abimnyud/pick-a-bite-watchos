//
//  CircleImage.swift
//  Pick a Bite WatchOS Watch App
//
//  Created by Abimanyu Damarjati on 16/05/25.
//

import SwiftUI

struct CircledImage: View {
    var imageName: String
    var size: CGFloat
    var body: some View {
        Image(imageName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: size, height: size)
            .clipShape(Circle())
            .padding(.all)
            .overlay(Circle().stroke(Color.cornsilk, lineWidth: 4))
            .background(Ellipse().fill(.white))
    }
}
