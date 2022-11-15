//
//  ResultInteractor.swift
//  KSBMICalculator
//
//  Created by Kseniya Smirnova on 14.11.22.
//

import Foundation
import RealmSwift

class History: Object {
    @objc dynamic var date: Date = Date()
    @objc dynamic var gender: String = Gender.female.rawValue
    @objc dynamic var age: Int = 30
    @objc dynamic var weight: Int = 80
    @objc dynamic var height: Int = 180
    @objc dynamic var BMI: Double = 25
    
    @objc dynamic var completed = false
}

protocol ResultInteractorProtocol: AnyObject {
    func calculateBMI() -> Double
    func userData() -> UserData
    func idealWeight() -> String
    
    func tableViewCellCount() -> Int
    func tableViewCellData(row: Int) -> BMITableViewCell.ResultCell
    
    func collectionViewCellCount() -> Int
    func collectionViewCellData(row: Int) -> CollectionViewCell.ResultCell
    
    func addHistory()
}

class ResultInteractor: ResultInteractorProtocol {
    weak var presenter: ResultPresenterProtocol?
    let newUserData: UserData
    let BMI: Double
    
    let realm = try! Realm()
    var historyBMI: [History] = []
    var historyArray: Results<History>!
    
    init(newUserData: UserData, BMI: Double) {
        self.newUserData = newUserData
        self.BMI = BMI
    }
}

extension ResultInteractor {
    func calculateBMI() -> Double {
        let x = (Double(newUserData.weight) / (Double(newUserData.height) / 100 * Double(newUserData.height) / 100)).rounded(toPlaces: 1)
        return x
    }
    
    func userData() -> UserData {
        return newUserData
    }
    
    func idealWeight() -> String {
        let hieght = Double(newUserData.height) / 100
        let from = 18.5 * hieght * hieght
        let to = 24.9 * hieght * hieght
        return "\(from.rounded(toPlaces: 1)) - \(to.rounded(toPlaces: 1)) kg"
    }
}

extension ResultInteractor {
    func addHistory() {
        let oneData = History()
        oneData.date = Date()
        oneData.gender = newUserData.gender.rawValue
        oneData.age = newUserData.age
        oneData.weight = newUserData.weight
        oneData.height = newUserData.height
        oneData.BMI = calculateBMI()
        try! realm.write {
            realm.add(oneData)
        }
        historyArray = realm.objects(History.self)
        historyBMI = historyArray.sorted(by: { $0.date > $1.date })
    }
}

extension ResultInteractor {
    func tableViewCellCount() -> Int {
        return BMIArray.count
    }
    
    func tableViewCellData(row: Int) -> BMITableViewCell.ResultCell {
        let result = BMIArray[row]
        return BMITableViewCell.ResultCell(row: row, color: result.color, name: result.name, result: result.result)
    }
}

extension ResultInteractor {
    func collectionViewCellCount() -> Int {
            return historyBMI.count
    }
    
    func collectionViewCellData(row: Int) -> CollectionViewCell.ResultCell {
        let result = historyBMI[row]
        return CollectionViewCell.ResultCell(date: result.date, gender: Gender(rawValue: result.gender) ?? .male, age: result.age, weight: result.weight, height: result.height, BMI: result.BMI)
    }
}
