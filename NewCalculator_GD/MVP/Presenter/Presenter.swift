//
//  Presenter.swift
//  NewCalculator_GD
//
//  Created by Grisha Dil' on 06.04.2022.
//

import Foundation

class CalculatorPresenter {
    
    private let memoryKey = Keys.savedNumberKey.rawValue
    private let resultsKey = Keys.resultsKey.rawValue
    private let historyMaxLimit = 7

    let model = Model()
    var currentOperation: Operation?
  
    weak var delegate: CalculatorPresenterDelegate?
            
    enum Operation {
        case add, subtract, multiply, divide, exponentiation, sin, cos, tan
    }
    enum MemoryOperation {
        case save, read, clear, add, subtract
    }
    enum Keys: String {
        case savedNumberKey, resultsKey
    }
    
    public func setViewDelegate(delegate: CalculatorPresenterDelegate) {
        self.delegate = delegate
    }

    
    public func piNumberTapped() {
        if currentOperation == nil {
            self.delegate?.displayData(text: "Firstly select trigonometric function 🥸")
        } else if model.currentValueIsFirst && model.firstValue.contains("π"){
            return
        } else {
            if model.firstValue == "0" {
                model.firstValue = "π"
            } else {
                model.firstValue += "π"
            }
            self.delegate?.displayData(text: model.firstValue)
        }
    }
    
    public func sinTapped() {
        clearTapped()
        currentOperation = Operation.sin
        self.delegate?.displayData(text: "sin(degrees or π)")
    }
    public func cosTapped() {
        clearTapped()
        currentOperation = Operation.cos
        self.delegate?.displayData(text: "cos(degrees or π)")
    }
    public func tanTapped() {
        clearTapped()
        currentOperation = Operation.tan
        self.delegate?.displayData(text: "tan(degrees or π)")
    }
    
    public func sumTapped() {
        guard Decimal(string: model.firstValue)! > 0 else { return }
        model.currentValueIsFirst = false
        currentOperation = Operation.add
        self.delegate?.displayData(text: model.secondValue)
    }
    
    public func subtractTapped() {
        guard Decimal(string: model.firstValue)! > 0 else { return }
        model.currentValueIsFirst = false
        currentOperation = Operation.subtract
        self.delegate?.displayData(text: model.secondValue)
    }
    
    public func multiplyTapped() {
        guard Decimal(string: model.firstValue)! > 0 else { return }
        model.currentValueIsFirst = false
        currentOperation = Operation.multiply
        self.delegate?.displayData(text: model.secondValue)
    }
    
    public func divideTapped() {
        guard Decimal(string: model.firstValue)! > 0 else { return }
        model.currentValueIsFirst = false
        currentOperation = Operation.divide
        self.delegate?.displayData(text: model.secondValue)
    }
    
    public func exponentiationTapped() {
        guard Decimal(string: model.firstValue)! > 0 else { return }
        model.currentValueIsFirst = false
        currentOperation = Operation.exponentiation
        self.delegate?.displayData(text: model.secondValue)
    }
    
    public func squareTapped() {
        guard var firstValue = Decimal(string: model.firstValue) else { return }
        firstValue *= firstValue
        model.firstValue = "\(firstValue)"
        model.resultOnScreen = true
        saveOperationResultToHistory()
        self.delegate?.displayData(text: model.firstValue)
    }
    
    public func cubeTapped() {
        guard var firstValue = Decimal(string: model.firstValue) else { return }
        firstValue = pow(firstValue, 3)
        model.firstValue = "\(firstValue)"
        model.resultOnScreen = true
        saveOperationResultToHistory()
        self.delegate?.displayData(text: model.firstValue)
    }
    
    func equalPressed() {
        guard let currentOperation = currentOperation,
              let secondValue = Decimal(string: model.secondValue),
              var result = Decimal(string: model.result)
        else { return }
        model.currentValueIsFirst = false
        model.resultOnScreen = true
        
        switch currentOperation {
            case .add:
                guard let firstValue = Decimal(string: model.firstValue) else { return }
                result = firstValue + secondValue
                model.result = "\(result)"
                saveOperationResultToHistory()
                self.delegate?.displayData(text: model.result)
            case .subtract:
                guard let firstValue = Decimal(string: model.firstValue) else { return }
                result = (firstValue - secondValue).rounded(3, .plain)
                model.result = "\(result)"
                saveOperationResultToHistory()
                self.delegate?.displayData(text: model.result)
            case .multiply:
                guard let firstValue = Decimal(string: model.firstValue) else { return }
                result = (firstValue * secondValue).rounded(3, .plain)
                model.result = "\(result)"
                saveOperationResultToHistory()
                self.delegate?.displayData(text: model.result)
            case .divide:
                guard let firstValue = Decimal(string: model.firstValue) else { return }
                result = (firstValue / secondValue).rounded(3, .plain)
                model.result = "\(result)"
                saveOperationResultToHistory()
                self.delegate?.displayData(text: model.result)
            case .exponentiation:
                guard let firstValue = Decimal(string: model.firstValue) else { return }
                guard let exponentionValue = Int(model.secondValue) else { return }
                result = pow(firstValue,exponentionValue)
                model.result = "\(result)"
                saveOperationResultToHistory()
                self.delegate?.displayData(text: model.result)
            case .sin:
                if model.firstValue == "π" {
                    model.result = "\(sin(degrees: 180))"
                    removeZeroAndPoint()
                    saveOperationResultToHistory()
                    self.delegate?.displayData(text: model.result)
                } else if model.firstValue.contains("π") {
                    model.firstValue.removeLast()
                    guard var degrees = Double(model.firstValue) else { return }
                    degrees *= 180
                    model.result = "\(sin(degrees: degrees))"
                    if model.result.last == "0" {
                        removeZeroAndPoint()
                    }
                    saveOperationResultToHistory()
                    self.delegate?.displayData(text: model.result)
                } else {
                    guard let degrees = Double(model.firstValue) else { return }
                    model.result = "\(sin(degrees: degrees))"
                    if model.result.last == "0" {
                        removeZeroAndPoint()
                    }
                    saveOperationResultToHistory()
                    self.delegate?.displayData(text: model.result)
                }
            case .cos:
                if model.firstValue == "π" {
                    model.result = "\(cos(degrees: 180))"
                    removeZeroAndPoint()
                    saveOperationResultToHistory()
                    self.delegate?.displayData(text: model.result)
                } else if model.firstValue.contains("π") {
                    model.firstValue.removeLast()
                    guard var degrees = Double(model.firstValue) else { return }
                    degrees *= 180
                    model.result = "\(cos(degrees: degrees))"
                    if model.result.last == "0" {
                        removeZeroAndPoint()
                    }
                    saveOperationResultToHistory()
                    self.delegate?.displayData(text: model.result)
                } else {
                    guard let degrees = Double(model.firstValue) else { return }
                    model.result = "\(cos(degrees: degrees))"
                    if model.result.last == "0" {
                        removeZeroAndPoint()
                    }
                    saveOperationResultToHistory()
                    self.delegate?.displayData(text: model.result)
                }
            case .tan:
            if model.firstValue == "90" || model.firstValue == "270" || model.firstValue == "0.5π" || model.firstValue == "1.5π" {
                model.result = "undefined ∞"
                saveOperationResultToHistory()
                self.delegate?.displayData(text: model.result)
            } else if model.firstValue == "π" {
                model.result = "\(0)"
                saveOperationResultToHistory()
                self.delegate?.displayData(text: model.result)
            } else {
                guard let degrees = Double(model.firstValue) else { return }
                model.result = "\(tan(degrees: degrees))"
                if model.result == "-0.0" {
                    model.result = "0"
                } else if model.result.last == "0" {
                    removeZeroAndPoint()
                }
                saveOperationResultToHistory()
                self.delegate?.displayData(text: model.result)
            }
        }
    }
        
    public func memorySavePressed() {
        if model.currentValueIsFirst == true {
            guard model.firstValue != "0" else { return }
            model.defaults.set(model.firstValue, forKey: memoryKey)
            model.numberInMemory = model.firstValue
            self.delegate?.displayMemoryData(text: model.numberInMemory)
        } else if model.currentValueIsFirst == false && model.resultOnScreen == false {
            guard model.secondValue != "0" else { return }
            model.defaults.set(model.secondValue, forKey: memoryKey)
            model.numberInMemory = model.secondValue
            self.delegate?.displayMemoryData(text: model.numberInMemory)
        } else {
            guard model.result != "0" else { return }
            model.defaults.set(model.result, forKey: memoryKey)
            model.numberInMemory = model.result
            self.delegate?.displayMemoryData(text: model.numberInMemory)
        }
    }
    
    public func memoryReadPressed() {
        if model.currentValueIsFirst == true {
            model.firstValue = model.numberInMemory
        } else {
            model.secondValue = model.numberInMemory
        }
        self.delegate?.displayData(text: model.numberInMemory)
    }
    
    public func memoryClearTapped() {
        model.defaults.set(0, forKey: memoryKey)
        model.numberInMemory = "0"
        self.delegate?.displayMemoryData(text: model.numberInMemory)
    }
    
    public func memoryAddTapped() {
        guard var numberInMemory = Decimal(string: model.numberInMemory),
              let firstValue = Decimal(string: model.firstValue),
              let secondValue = Decimal(string: model.secondValue),
              let result = Decimal(string: model.result)
        else { return }
        
        if model.currentValueIsFirst == true {
            numberInMemory += firstValue
            model.numberInMemory = "\(numberInMemory)"
            self.delegate?.displayMemoryData(text: model.numberInMemory)
        } else if model.currentValueIsFirst == false && model.resultOnScreen == false {
            numberInMemory += secondValue
            model.numberInMemory = "\(numberInMemory)"
            self.delegate?.displayMemoryData(text: model.numberInMemory)
        } else {
            numberInMemory += result
            model.numberInMemory = "\(numberInMemory)"
            self.delegate?.displayMemoryData(text: model.numberInMemory)
        }
    }
    
    public func memorySubtractTapped() {
        guard var numberInMemory = Decimal(string: model.numberInMemory),
              let firstValue = Decimal(string: model.firstValue),
              let secondValue = Decimal(string: model.secondValue),
              let result = Decimal(string: model.result)
        else { return }
        
        if model.currentValueIsFirst == true {
            numberInMemory -= firstValue
            model.numberInMemory = "\(numberInMemory)"
            self.delegate?.displayMemoryData(text: model.numberInMemory)
        } else if model.currentValueIsFirst == false && model.resultOnScreen == false {
            numberInMemory -= secondValue
            model.numberInMemory = "\(numberInMemory)"
            self.delegate?.displayMemoryData(text: model.numberInMemory)
        } else {
            numberInMemory -= result
            model.numberInMemory = "\(numberInMemory)"
            self.delegate?.displayMemoryData(text: model.numberInMemory)
        }
    }
    
    public func squareRootTapped() {
        if model.currentValueIsFirst == true {
            guard let value = Double(model.firstValue) else { return }
            model.firstValue = "\(sqrt(value).rounded(digits: 2))"
            if model.firstValue.last == "0" {
                removeZeroAndPoint()
            }
            saveOperationResultToHistory()
            self.delegate?.displayData(text: model.firstValue)
        } else if model.resultOnScreen == true {
            guard let result = Double(model.result) else { return }
            if result > 0 {
                model.result = "\(sqrt(result).rounded(digits: 2))"
                if model.result.last == "0" {
                    removeZeroAndPoint()
                }
                saveOperationResultToHistory()
                self.delegate?.displayData(text: model.result)
            } else { return }
        }
    }
    
    public func logarithmTapped() {
        if model.currentValueIsFirst == true {
            guard let value = Double(model.firstValue) else { return }
            model.firstValue = "\(log10(value).rounded(digits: 2))"
            if model.firstValue.last == "0" {
                removeZeroAndPoint()
            }
            saveOperationResultToHistory()
            self.delegate?.displayData(text: model.firstValue)
        } else if model.resultOnScreen == true {
            guard let result = Double(model.result) else { return }
            if result >= 0 {
                model.result = "\(log10(result).rounded(digits: 2))"
                if model.result.last == "0" {
                    removeZeroAndPoint()
                }
                saveOperationResultToHistory()
                self.delegate?.displayData(text: model.result)
            } else { return }
        }
    }
    
    public func naturalLogarithmTapped() {
        if model.currentValueIsFirst == true {
            guard let value = Double(model.firstValue) else { return }
            model.firstValue = "\(log(value).rounded(digits: 2))"
            if model.firstValue.last == "0" {
                removeZeroAndPoint()
            }
            saveOperationResultToHistory()
            self.delegate?.displayData(text: model.firstValue)
        } else if model.resultOnScreen == true {
            guard let result = Double(model.result) else { return }
            if result >= 0 {
                model.result = "\(log(result).rounded(digits: 2))"
                if model.result.last == "0" {
                    removeZeroAndPoint()
                }
                saveOperationResultToHistory()
                self.delegate?.displayData(text: model.result)
            } else { return }
        }
    }
    
    public func factorialTapped() {
        let maximumValueQuote = "Maximum value for factorial calculation is 20 or less"
        let valueTypeQuote = "😩 Only non-negative integers 🤓"
        
        if model.currentValueIsFirst == true && !model.firstValue.contains(".") {
            guard let value = UInt(model.firstValue) else { return }
            if value <= 20 {
                model.firstValue = "\(factorial(value))"
                self.delegate?.displayData(text: model.firstValue)
                saveOperationResultToHistory()
                model.resultOnScreen = true
            } else {
                clearTapped()
                self.delegate?.displayData(text: maximumValueQuote)
            }
        } else if model.resultOnScreen == true && !model.result.contains(".") && !model.result.contains("-") {
            guard let value = UInt(model.result) else { return }
            if value <= 20 {
                model.result = "\(factorial(value))"
                saveOperationResultToHistory()
                self.delegate?.displayData(text: model.result)
            }
        } else {
            clearTapped()
            self.delegate?.displayData(text: valueTypeQuote)
        }
    }
}


extension CalculatorPresenter {
    
    private func saveOperationResultToHistory() {
        model.operationResultHistory = model.defaults.stringArray(forKey: resultsKey) ?? []
        if model.operationResultHistory.count == historyMaxLimit {
            model.operationResultHistory.remove(at: model.operationResultHistory.count-1)
        }
        if model.currentValueIsFirst == true {
            model.operationResultHistory.insert(model.firstValue, at: 0)
            model.defaults.set(model.operationResultHistory, forKey: resultsKey)
            
        } else if model.resultOnScreen == true {
            model.operationResultHistory.insert(model.result, at: 0)
            model.defaults.set(model.operationResultHistory, forKey: resultsKey)
        }
    }
    
    private func sin(degrees: Double) -> Double {
        return __sinpi(degrees/180.0).rounded(digits: 3)
    }
    
    private func cos(degrees: Double) -> Double {
        return __cospi(degrees/180.0).rounded(digits: 3)
    }
    
    private func tan(degrees: Double) -> Double {
        return __tanpi(degrees/180.0).rounded(digits: 3)
    }
    
    private func factorial(_ n: UInt) -> UInt {
        if n == 0 {
            return 1
        }
        return n*factorial(n-1)
    }
    
    func display(number: Int) {
        if model.currentValueIsFirst == true {
            if model.firstValue == "0" {
                model.firstValue = "\(number)"
            } else {
                model.firstValue += "\(number)"
            }
            self.delegate?.displayData(text: model.firstValue)
        } else {
            if model.secondValue == "0" {
                model.secondValue = "\(number)"
            } else {
                model.secondValue += "\(number)"
            }
            self.delegate?.displayData(text: model.secondValue)
        }
    }
    
    private func removeZeroAndPoint() {
        if model.currentValueIsFirst == true {
            model.firstValue.removeLast()
            model.firstValue.removeLast()
        } else {
            model.result.removeLast()
            model.result.removeLast()
        }
    }
}

