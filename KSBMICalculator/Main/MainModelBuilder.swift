//
//  MainModelBuilder.swift
//  KSBMICalculator
//
//  Created by Kseniya Smirnova on 13.11.22.
//

import UIKit

class MainModuleBuilder {
    static func build() -> ViewController {
        let interactor = MainInteractor()
        let router = MainRouter()
        let presenter = MainPresenter(interactor: interactor, router: router)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "Main") as! ViewController
        viewController.presenter = presenter
        presenter.view = viewController
        interactor.presenter = presenter
        router.viewController = viewController
        return viewController
        
    }
}
