//
//  ResultEntity.swift
//  KSBMICalculator
//
//  Created by Kseniya Smirnova on 14.11.22.
//

import Foundation

struct ModelBMITableView {
    let color: String
    let name: String
    let result: String
}

var BMIArray = [
    ModelBMITableView(color: "01 BMI", name: "Very severely underweight", result: "< 16"),
    ModelBMITableView(color: "02 BMI", name: "Severely underweight", result: "16.0 - 16.9"),
    ModelBMITableView(color: "03 BMI", name: "Underweight", result: "17.0 - 18.4"),
    ModelBMITableView(color: "04 BMI", name: "Normal", result: "18.5 - 24.9"),
    ModelBMITableView(color: "05 BMI", name: "Overwidth", result: "25.0 - 29.9"),
    ModelBMITableView(color: "06 BMI", name: "Obese Class I", result: "30.0 - 34.9"),
    ModelBMITableView(color: "07 BMI", name: "Obese Class II", result: "35.0 - 39.9"),
    ModelBMITableView(color: "08 BMI", name: "Obese Class III", result: "≥ 40.0")
]


