//
//  ResultPresenter.swift
//  KSBMICalculator
//
//  Created by Kseniya Smirnova on 14.11.22.
//

import Foundation

protocol ResultPresenterProtocol: AnyObject {
    func setBMIResult()
    
    func tableViewCellCount() -> Int
    func tableViewCellData(row: Int) -> BMITableViewCell.ResultCell
    func calculateBMI() -> Double
    
    func collectionViewCellCount() -> Int
    func collectionViewCellData(row: Int) -> CollectionViewCell.ResultCell
    
    func addHistory()
}

class ResultPresenter {
    weak var view: ResultViewProtocol?
    var router: ResultRouterProtocol
    var interactor: ResultInteractorProtocol
    
    init(interactor: ResultInteractorProtocol, router: ResultRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }
}

extension ResultPresenter: ResultPresenterProtocol {
    func setBMIResult() {
        let newUserdata = interactor.userData()
        let BMI = interactor.calculateBMI()
        let idealWeight = interactor.idealWeight()
        view?.showResult(newUserData: newUserdata, BMI: BMI, idealWeight: idealWeight)
    }
    
    func tableViewCellCount() -> Int {
        return interactor.tableViewCellCount()
    }
    
    func tableViewCellData(row: Int) -> BMITableViewCell.ResultCell {
        return interactor.tableViewCellData(row: row)
    }
    
    func calculateBMI() -> Double {
        return interactor.calculateBMI()
    }
    
    func collectionViewCellCount() -> Int {
        return interactor.collectionViewCellCount()
    }
    
    func addHistory() {
        interactor.addHistory()
    }
    
    func collectionViewCellData(row: Int) -> CollectionViewCell.ResultCell {
        return interactor.collectionViewCellData(row: row)
    }
}
