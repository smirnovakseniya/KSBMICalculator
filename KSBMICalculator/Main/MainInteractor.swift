//
//  MainInteractor.swift
//  KSBMICalculator
//
//  Created by Kseniya Smirnova on 13.11.22.
//

import Foundation
import RealmSwift

protocol MainInteractorProtocol: AnyObject {
    func loadUserData()
    func createArrayPickerView() -> [Int]
    
    var BMI: Double { get }
}

class MainInteractor: MainInteractorProtocol {
    weak var presenter: MainPresenterProtocol?
    let user = User()
    var BMI: Double = 25
    var pickerAge: [Int] = []
    
    func loadUserData() {
        self.presenter?.loadData(userData: user.userData)
    }
    
    func createArrayPickerView() -> [Int] {
        for i in 18...65 {
            pickerAge.append(i)
        }
        return pickerAge
    }
}
