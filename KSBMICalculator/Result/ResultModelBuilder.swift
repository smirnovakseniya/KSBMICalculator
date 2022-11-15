//
//  ResultModelBuilder.swift
//  KSBMICalculator
//
//  Created by Kseniya Smirnova on 14.11.22.
//

import UIKit

class ResultModelBuilder {
    static func build(newUserData: UserData, BMI: Double) -> ResultViewController {
        let interactor = ResultInteractor(newUserData: newUserData, BMI: BMI)
        let router = ResultRouter()
        let presenter = ResultPresenter(interactor: interactor, router: router)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "Result") as! ResultViewController
        viewController.presenter = presenter
        presenter.view = viewController
        interactor.presenter = presenter
        router.viewController = viewController
        return viewController
    }
}
