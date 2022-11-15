//
//  Double + Ex.swift
//  KSBMICalculator
//
//  Created by Kseniya Smirnova on 14.11.22.
//

import Foundation

extension Double {
    func rounded(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
