//
//  MainPresenter.swift
//  KSBMICalculator
//
//  Created by Kseniya Smirnova on 13.11.22.
//

import Foundation

protocol MainPresenterProtocol: AnyObject {
    func loadData(userData: UserData)
    func viewDidloaded()
    func didTapedCalculateButton(userData: UserData)
    func createArrayPickerView() -> [Int]
}

class MainPresenter {
    weak var view: MainViewProtocol?
    var router: MainRouterProtocol
    var interactor: MainInteractorProtocol
    
    init(interactor: MainInteractorProtocol, router: MainRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }
}

extension MainPresenter: MainPresenterProtocol {
    
    func didTapedCalculateButton(userData: UserData) {
        let BMI = interactor.BMI
        router.showResultViewController(newUserData: userData, BMI: BMI)
    }

    func viewDidloaded() {
        interactor.loadUserData()
    }

    func loadData(userData: UserData) {
        view?.showUserInfo(userData: userData)
    }
    
    func createArrayPickerView() -> [Int] {
        return interactor.createArrayPickerView()
    }
}
