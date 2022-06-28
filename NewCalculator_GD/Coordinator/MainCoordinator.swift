//
//  MainCoordinator.swift
//  NewCalculator_GD
//
//  Created by Grisha Dil' on 12.06.2022.
//

import Foundation
import UIKit

class MainCoordinator: Coordinator {
    var navigationController: UINavigationController?
    var presenter = CalculatorPresenter()
    
    func start() {
        var vc:UIViewController & Coordinating = CalculatorViewController()
        vc.coordinator = self
        navigationController?.setViewControllers([vc], animated: false)
    }
    
    func eventOccurred(with type: Event) {
        switch type {
        case .operationsResultHistoryTapped:
            var vc: UIViewController & Coordinating = OperationsHistoryViewController()
            
            vc.coordinator = self
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
