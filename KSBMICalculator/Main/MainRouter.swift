//
//  MainRouter.swift
//  KSBMICalculator
//
//  Created by Kseniya Smirnova on 13.11.22.
//

import Foundation

protocol MainRouterProtocol: AnyObject {
    func showResultViewController(newUserData: UserData, BMI: Double)
}

class MainRouter: MainRouterProtocol {
    weak var viewController: ViewController?
    
    func showResultViewController(newUserData: UserData, BMI: Double) {
        let vc = ResultModelBuilder.build(newUserData: newUserData, BMI: BMI)
//        vc.modalPresentationStyle = .fullScreen
        viewController?.present(vc, animated: true)
    }
}
