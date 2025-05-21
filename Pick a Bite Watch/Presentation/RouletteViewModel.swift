//
//  RouletteViewModel.swift
//  Pick a Bite WatchOS Watch App
//
//  Created by Abimanyu Damarjati on 16/05/25.
//

import SwiftUI
import WatchKit

let tenants: [Tenant] = [
    Tenant(name: "% Arabica", image: "Arabica", priceRange: "Rp20rb - Rp60rb", category: "Coffee & Tea", coordinates: (-6.301937, 106.654244)),
    Tenant(name: "Auntie Anne’s", image: "AuntieAnne", priceRange: "Rp50rb - Rp80rb", category: "Snacks", coordinates: (-6.301937, 106.654244)),
    Tenant(name: "Bebek Bengil", image: "BebekBengil", priceRange: "Rp100rb - Rp150rb", category: "Duck, Indonesian", coordinates: (-6.301937, 106.654244)),
    Tenant(name: "Boost", image: "Boost", priceRange: "Rp40rb - Rp110rb", category: "Juice & Smoothies", coordinates: (-6.301937, 106.654244)),
    Tenant(name: "Brewerkz", image: "Brewerkz", priceRange: "Rp130rb - Rp230rb", category: "Western & Grill, Bar & Drinks", coordinates: (-6.301937, 106.654244)),
    Tenant(name: "Burgreens", image: "Burgreens", priceRange: "Rp120rb - Rp180rb", category: "Healthy & Vegan, Burgers, Asian Fusion", coordinates: (-6.301937, 106.654244)),
    Tenant(name: "Chakra Hall", image: "Chakra", priceRange: "Rp130rb - Rp200rb", category: "Western & Grill, Indonesian, Asian Fusion", coordinates: (-6.301937, 106.654244)),
    Tenant(name: "Chateraise", image: "Chateraise", priceRange: "Rp30rb - Rp100rb", category: "Desserts & Sweets", coordinates: (-6.301937, 106.654244)),
    Tenant(name: "Chatime", image: "Chatime", priceRange: "Rp20rb - Rp70rb", category: "Coffee & Tea", coordinates: (-6.301937, 106.654244)),
    Tenant(name: "Chong Qing Hot Pot", image: "Chong Qing", priceRange: "Rp110rb - Rp140rb", category: "Chinese (Hot Pot), Chinese", coordinates: (-6.301937, 106.654244)),
    Tenant(name: "Colico", image: "Colico", priceRange: "Rp20rb - Rp90rb", category: "Juice & Smoothies", coordinates: (-6.301937, 106.654244)),
    Tenant(name: "Croco", image: "Croco", priceRange: "Rp60rb - Rp140rb", category: "Bakery & Pastries, Coffee & Tea, Asian Fusion", coordinates: (-6.301937, 106.654244)),
    Tenant(name: "Cut & Grill", image: "CutGrill", priceRange: "Rp150rb - Rp250rb", category: "Western & Grill, Burgers", coordinates: (-6.301937, 106.654244)),
    Tenant(name: "D’cost", image: "Dcost", priceRange: "Rp40rb - Rp70rb", category: "Indonesian", coordinates: (-6.301937, 106.654244)),
    Tenant(name: "Dore by LeTAO", image: "Dore", priceRange: "Rp110rb - Rp210rb", category: "Desserts & Sweets", coordinates: (-6.301937, 106.654244)),
    Tenant(name: "Dum Dum Thai Tea", image: "DumDum", priceRange: "Rp20rb - Rp50rb", category: "Thai Tea, Coffee & Tea", coordinates: (-6.301937, 106.654244)),
    Tenant(name: "Fire Prawn", image: "FirePrawn", priceRange: "Rp140rb - Rp200rb", category: "Chinese", coordinates: (-6.301937, 106.654244)),
    Tenant(name: "Fore Coffee", image: "Fore", priceRange: "Rp40rb - Rp80rb", category: "Coffee & Tea", coordinates: (-6.301937, 106.654244)),
    Tenant(name: "Fruitty Juice", image: "Fruitty", priceRange: "Rp30rb - Rp60rb", category: "Juice & Smoothies", coordinates: (-6.301937, 106.654244)),
    Tenant(name: "Gallura", image: "Gallura", priceRange: "Rp150rb - Rp200rb", category: "Italian, Desserts & Sweets", coordinates: (-6.301937, 106.654244)),
    Tenant(name: "Gindaco", image: "Gindaco", priceRange: "Rp110rb - Rp160rb", category: "Japanese (Takoyaki)", coordinates: (-6.301937, 106.654244)),
    Tenant(name: "Gion", image: "Gion", priceRange: "Rp120rb - Rp210rb", category: "Japanese (Sushi), Japanese (Ramen)", coordinates: (-6.301937, 106.654244)),
    Tenant(name: "Gubug Makan Mang Engking", image: "MangEngking", priceRange: "Rp130rb - Rp170rb", category: "Indonesian", coordinates: (-6.301937, 106.654244)),
    Tenant(name: "Hachi Grill", image: "HachiGrill", priceRange: "Rp100rb - Rp140rb", category: "Western & Grill, Desserts & Sweets", coordinates: (-6.301937, 106.654244)),
    Tenant(name: "Han Guksu", image: "Hanguksu", priceRange: "Rp140rb - Rp240rb", category: "Korean", coordinates: (-6.301937, 106.654244)),
    Tenant(name: "Honu", image: "Honu", priceRange: "Rp50rb - Rp100rb", category: "Hawaiian (Poké), Coffee & Tea", coordinates: (-6.301937, 106.654244)),
    Tenant(name: "Ikkudo Ichi", image: "IkkudoIchi", priceRange: "Rp80rb - Rp130rb", category: "Japanese (Ramen)", coordinates: (-6.301937, 106.654244)),
    Tenant(name: "J.CO Donut & Coffee", image: "Jco", priceRange: "Rp120rb - Rp180rb", category: "Donuts, Coffee & Tea", coordinates: (-6.301937, 106.654244)),
    Tenant(name: "Jalarasa", image: "Jalarasa", priceRange: "Rp40rb - Rp140rb", category: "Indonesian", coordinates: (-6.301937, 106.654244)),
    Tenant(name: "Jittlada", image: "Jittlada", priceRange: "Rp110rb - Rp140rb", category: "Thai", coordinates: (-6.301937, 106.654244)),
    Tenant(name: "Katsukita", image: "Katsukita", priceRange: "Rp50rb - Rp120rb", category: "Japanese (Katsu)", coordinates: (-6.301937, 106.654244)),
    Tenant(name: "Kitchenette", image: "Kitchenette", priceRange: "Rp130rb - Rp170rb", category: "Cafe, Coffee & Tea", coordinates: (-6.301937, 106.654244)),
    Tenant(name: "Kumulo", image: "Kumulo", priceRange: "Rp90rb - Rp190rb", category: "Food & Beverage", coordinates: (-6.301937, 106.654244)),
    Tenant(name: "Leko", image: "Leko", priceRange: "Rp150rb - Rp210rb", category: "Indonesian", coordinates: (-6.301937, 106.654244)),
    Tenant(name: "Marugame Udon", image: "Marugame", priceRange: "Rp110rb - Rp180rb", category: "Japanese (Udon)", coordinates: (-6.301937, 106.654244)),
    Tenant(name: "Montato", image: "Montato", priceRange: "Rp140rb - Rp210rb", category: "Snacks", coordinates: (-6.301937, 106.654244)),
    Tenant(name: "NOB Bakery", image: "NOB", priceRange: "Rp50rb - Rp140rb", category: "Bakery & Pastries, Desserts & Sweets, Coffee & Tea", coordinates: (-6.301937, 106.654244)),
    Tenant(name: "Old Town Coffee", image: "OldTown", priceRange: "Rp70rb - Rp110rb", category: "Coffee & Tea", coordinates: (-6.301937, 106.654244)),
    Tenant(name: "Paul le Cafe", image: "Paul", priceRange: "Rp120rb - Rp170rb", category: "Coffee & Tea, Cafe", coordinates: (-6.301937, 106.654244)),
    Tenant(name: "Rejuve", image: "Rejuve", priceRange: "Rp100rb - Rp200rb", category: "Juice & Smoothies", coordinates: (-6.301937, 106.654244)),
    Tenant(name: "Saigon Delight", image: "Saigon", priceRange: "Rp130rb - Rp210rb", category: "Food & Beverage", coordinates: (-6.301937, 106.654244)),
    Tenant(name: "Sake Biru", image: "Sakebiru", priceRange: "Rp120rb - Rp180rb", category: "Bar & Drinks", coordinates: (-6.301937, 106.654244)),
    Tenant(name: "Salad Stop", image: "SaladStop", priceRange: "Rp70rb - Rp120rb", category: "Healthy & Vegan, Juice & Smoothies", coordinates: (-6.301937, 106.654244)),
    Tenant(name: "Sate Khas Senayan", image: "SateSenayan", priceRange: "Rp110rb - Rp140rb", category: "Indonesian", coordinates: (-6.301937, 106.654244)),
    Tenant(name: "Shihlin", image: "Shihlin", priceRange: "Rp50rb - Rp100rb", category: "Snacks", coordinates: (-6.301937, 106.654244)),
    Tenant(name: "Sinamon", image: "Sinamon", priceRange: "Rp140rb - Rp170rb", category: "Bakery & Pastries", coordinates: (-6.301937, 106.654244)),
    Tenant(name: "Sour Sally", image: "Sour Sally", priceRange: "Rp20rb - Rp50rb", category: "Desserts & Sweets", coordinates: (-6.301937, 106.654244)),
    Tenant(name: "Starbucks", image: "Starbucks", priceRange: "Rp40rb - Rp110rb", category: "Coffee & Tea", coordinates: (-6.301937, 106.654244)),
    Tenant(name: "Subway", image: "Subway", priceRange: "Rp150rb - Rp240rb", category: "Sandwiches", coordinates: (-6.301937, 106.654244)),
    Tenant(name: "Sushi Tei", image: "Sushi Tei", priceRange: "Rp140rb - Rp230rb", category: "Japanese (Sushi), Asian Fusion", coordinates: (-6.301937, 106.654244)),
    Tenant(name: "Tamper Coffee", image: "Tamper", priceRange: "Rp100rb - Rp160rb", category: "Coffee & Tea", coordinates: (-6.301937, 106.654244)),
    Tenant(name: "The Pancake Co.", image: "PancakeCo", priceRange: "Rp30rb - Rp70rb", category: "Pancakes, Desserts & Sweets", coordinates: (-6.301937, 106.654244)),
    Tenant(name: "The People's Cafe", image: "People's Cafe", priceRange: "Rp60rb - Rp140rb", category: "Cafe, Indonesian", coordinates: (-6.301937, 106.654244)),
    Tenant(name: "Villa Capri", image: "Villa Capri", priceRange: "Rp40rb - Rp140rb", category: "Italian, Bar & Drinks", coordinates: (-6.301937, 106.654244)),
    Tenant(name: "Vivoli", image: "Vivoli", priceRange: "Rp50rb - Rp90rb", category: "Desserts & Sweets, Healthy & Vegan", coordinates: (-6.301937, 106.654244)),
    Tenant(name: "Wee Nam Kee", image: "WeeNamKee", priceRange: "Rp100rb - Rp190rb", category: "Singaporean/Hainanese, Asian Fusion", coordinates: (-6.301937, 106.654244))
]

class RouletteViewModel: ObservableObject {
    @Published private(set) var rotationAngle: Double = 0.0
    @Published private(set) var isAnimating: Bool = false
    @Published private(set) var tenantValue: Tenant = tenants[0]
    @Published private(set) var isFinished: Bool = false

    func reset() {
        withAnimation {
            self.isFinished = false
            self.tenantValue = tenants[0]
        }
    }

    func startAnimation() {
        guard !self.isAnimating else { return }
        self.isAnimating = true
        withAnimation(.timingCurve(0, 0, 0, 1, duration: 4.5)) {
            self.rotationAngle += 360 * 10
            self.startHapticSequence()
            self.startTextRandomizer()
        } completion: {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [weak self] in
                withAnimation {
                    self?.isAnimating = false
                    self?.isFinished = true  
                }
            }
        }
    }

    private func startHapticSequence() {
        let hapticDuration: TimeInterval = 3.5
        let totalTaps = 240 // More taps = smoother simulation
        let bezierCurve = UnitBezier(p1x: 0.2, p1y: 0, p2x: 0, p2y: 1)
        let intervals = (0 ..< totalTaps).map { i -> TimeInterval in
            let t = Double(i) / Double(totalTaps - 1)
            return hapticDuration * bezierCurve.solve(t)
        }

        for (_, interval) in intervals.enumerated() {
            DispatchQueue.main.asyncAfter(deadline: .now() + interval) {
                WKInterfaceDevice.current().play(.click)
            }
        }
    }

    private func startTextRandomizer() {
        let textRandomizerDuration: TimeInterval = 3.5
        let totalRandomizer = 240
        let bezierCurve = UnitBezier(p1x: 0.2, p1y: 0, p2x: 0, p2y: 1)

        let intervals = (0 ..< totalRandomizer).map { i -> TimeInterval in
            let t = Double(i) / Double(totalRandomizer - 1)
            return textRandomizerDuration * bezierCurve.solve(t)
        }

        for (_, interval) in intervals.enumerated() {
            DispatchQueue.main.asyncAfter(deadline: .now() + interval) {
                self.tenantValue = tenants.randomElement() ?? tenants[0]
            }
        }
    }
}
