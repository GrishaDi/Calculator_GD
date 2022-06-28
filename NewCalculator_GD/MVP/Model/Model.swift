//
//  Model.swift
//  NewCalculator_GD
//
//  Created by Grisha Dil' on 06.04.2022.
//

import Foundation

class Model {
    let defaults = UserDefaults.standard
    var numberInMemory = "0"
    var firstValue = "0"
    var secondValue = "0"
    var currentValueIsFirst = true
    var result = "0"
    var resultOnScreen = false
    var operationResultHistory = [String]()
}
