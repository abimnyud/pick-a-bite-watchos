//
//  UnitBezier.swift
//  Pick a Bite WatchOS Watch App
//
//  Created by Abimanyu Damarjati on 15/05/25.
//

import Foundation

struct UnitBezier {
    let cx: Double
    let bx: Double
    let ax: Double
    let cy: Double
    let by: Double
    let ay: Double

    init(p1x: Double, p1y: Double, p2x: Double, p2y: Double) {
        // Precompute polynomial coefficients
        self.cx = 3.0 * p1x
        self.bx = 3.0 * (p2x - p1x) - cx
        self.ax = 1.0 - cx - bx

        self.cy = 3.0 * p1y
        self.by = 3.0 * (p2y - p1y) - cy
        self.ay = 1.0 - cy - by
    }

    func sampleCurveX(_ t: Double) -> Double {
        return ((ax * t + bx) * t + cx) * t
    }

    func sampleCurveY(_ t: Double) -> Double {
        return ((ay * t + by) * t + cy) * t
    }

    func sampleCurveDerivativeX(_ t: Double) -> Double {
        return (3.0 * ax * t + 2.0 * bx) * t + cx
    }

    func solve(_ x: Double, epsilon: Double = 1.0e-6) -> Double {
        var t0: Double = 0
        var t1: Double = 1
        var t2: Double = x
        var x2: Double
        var d2: Double

        // Newton-Raphson
        for _ in 0 ..< 8 {
            x2 = sampleCurveX(t2) - x
            if abs(x2) < epsilon { return sampleCurveY(t2) }
            d2 = sampleCurveDerivativeX(t2)
            if abs(d2) < epsilon { break }
            t2 = t2 - x2 / d2
        }

        // Fall back to bisection
        while t0 < t1 {
            x2 = sampleCurveX(t2)
            if abs(x2 - x) < epsilon { return sampleCurveY(t2) }
            if x > x2 { t0 = t2 } else { t1 = t2 }
            t2 = (t1 + t0) / 2.0
        }

        return sampleCurveY(t2)
    }
}
