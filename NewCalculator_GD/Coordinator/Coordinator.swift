//
//  Coordinator.swift
//  NewCalculator_GD
//
//  Created by Grisha Dil' on 12.06.2022.
//

import Foundation
import UIKit

enum Event {
    case operationsResultHistoryTapped
}

protocol Coordinator {
    var navigationController: UINavigationController? { get set }
    
    func start()
    
    func eventOccurred(with type: Event)
}

protocol Coordinating {
    var coordinator: Coordinator? { get set }
}
