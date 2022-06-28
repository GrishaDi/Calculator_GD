//
//  PresenterBasicButtons | Extension.swift
//  NewCalculator_GD
//
//  Created by Grisha Dil' on 22.06.2022.
//

import Foundation

extension CalculatorPresenter {
    
    public func pointTapped() {
        if model.currentValueIsFirst == true {
            if model.firstValue.last == "." {
            }
            else if model.firstValue.contains(".") {
            }
            else {
                model.firstValue.insert(".", at: model.firstValue.endIndex)
                self.delegate?.displayData(text: model.firstValue)
            }
        } else {
            if model.secondValue.last == "." {
            }
            else if model.secondValue.contains(".") {
            }
            else {
                model.secondValue.insert(".", at: model.secondValue.endIndex)
                self.delegate?.displayData(text: model.secondValue)
            }
        }
    }
    
    public func zeroTapped() {
        if model.currentValueIsFirst == true {
            if model.firstValue == "0" {
                self.delegate?.displayData(text: model.firstValue)
            } else {
                model.firstValue += "0"
                self.delegate?.displayData(text: model.firstValue)
            }
        } else {
            if model.secondValue == "0" {
            } else {
                model.secondValue += "0"
                self.delegate?.displayData(text: model.secondValue)
            }
        }
    }
    
    public func clearTapped() {
        currentOperation = nil
        model.currentValueIsFirst = true
        model.resultOnScreen = false
        model.firstValue = "0"
        model.secondValue = "0"
        model.result = "0"
        self.delegate?.displayData(text: model.firstValue)
    }
    
    public func oneTapped() {
        if model.resultOnScreen == true || model.firstValue.contains("π") {
            clearTapped()
        }
        display(number: 1)
    }
    
    public func twoTapped() {
        if model.resultOnScreen == true || model.firstValue.contains("π") {
            clearTapped()
        }
        display(number: 2)
    }
    
    public func threeTapped() {
        if model.resultOnScreen == true || model.firstValue.contains("π") {
            clearTapped()
        }
        display(number: 3)
    }
    
    public func fourTapped() {
        if model.resultOnScreen == true || model.firstValue.contains("π") {
            clearTapped()
        }
        display(number: 4)
    }
    
    public func fiveTapped() {
        if model.resultOnScreen == true || model.firstValue.contains("π") {
            clearTapped()
        }
        display(number: 5)
    }
    
    public func sixTapped() {
        if model.resultOnScreen == true || model.firstValue.contains("π") {
            clearTapped()
        }
        display(number: 6)
    }
    
    public func sevenTapped() {
        if model.resultOnScreen == true || model.firstValue.contains("π") {
            clearTapped()
        }
        display(number: 7)
    }
    
    public func eightTapped() {
        if model.resultOnScreen == true || model.firstValue.contains("π") {
            clearTapped()
        }
        display(number: 8)
    }
    
    public func nineTapped() {
        if model.resultOnScreen == true || model.firstValue.contains("π") {
            clearTapped()
        }
        display(number: 9)
    }
}
