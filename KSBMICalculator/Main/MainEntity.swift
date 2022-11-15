//
//  MainEntity.swift
//  KSBMICalculator
//
//  Created by Kseniya Smirnova on 14.11.22.
//

import UIKit

struct UserData {
    var gender: Gender
    var age: Int
    var weight: Int
    var height: Int
}

enum Gender: String {
    case male = "Male"
    case female = "Female"
}

class User {
    var userData = UserData(gender: .female, age: 30, weight: 59, height: 155)
}


