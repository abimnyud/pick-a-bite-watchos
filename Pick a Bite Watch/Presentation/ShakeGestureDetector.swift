//
//  ArmMovementDetector.swift
//  Pick a Bite WatchOS Watch App
//
//  Created by Abimanyu Damarjati on 14/05/25.
//

import CoreMotion
import SwiftUI

class ShakeGestureDetector: ObservableObject {
    private let motionManager = CMMotionManager()
    @Published private(set) var isShaking: Bool = false
    
    init() {
        startMotionUpdates()
    }
    
    func reset() {
        isShaking = false
        startMotionUpdates()
    }
    
    private func startMotionUpdates() {
        if motionManager.isDeviceMotionAvailable { // Check if device motion data is available
            motionManager.deviceMotionUpdateInterval = 0.1 // Set the update interval to 0.1 seconds
            motionManager.startDeviceMotionUpdates(to: .main) { [weak self] data, _ in // Start receiving motion updates on the main thread
                guard let data = data else { return } // Ensure we have valid motion data
                
                self?.processDeviceMotion(data) // Process the motion data with the specified movement type
            }
        }
    }
    
    func triggerShake() {
        withAnimation {
            isShaking = true
            stopMotionUpdates()
        }
    }
    
    private func stopMotionUpdates() {
        motionManager.stopDeviceMotionUpdates()
    }

    private func processDeviceMotion(_ motion: CMDeviceMotion) {
        let userAcceleration = motion.userAcceleration // Access the device's user acceleration data
        let attitude = motion.attitude // Access the device's orientation data
        
        if abs(attitude.roll) > Double.pi / 10 || abs(userAcceleration.x) > 0.5 {
            if !isShaking {
                triggerShake()
            }
        }
    }
}
