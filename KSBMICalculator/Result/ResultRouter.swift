//
//  ResultRouter.swift
//  KSBMICalculator
//
//  Created by Kseniya Smirnova on 14.11.22.
//

import Foundation

protocol ResultRouterProtocol: AnyObject {
}

class ResultRouter: ResultRouterProtocol {
    weak var viewController: ResultViewProtocol?
}
