//
//  CustomButton.swift
//  KSBMICalculator
//
//  Created by Kseniya Smirnova on 13.11.22.
//

import UIKit

struct ButtomConfig {
    func configure(_ view: UIButton) {
        view.layer.cornerRadius = 10
    }
}
class CustomButton: UIButton {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        ButtomConfig().configure(self)
    }
}
