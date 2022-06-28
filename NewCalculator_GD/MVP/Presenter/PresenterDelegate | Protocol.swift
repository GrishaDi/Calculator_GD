//
//  PresenterDelegateProtocol.swift
//  NewCalculator_GD
//
//  Created by Grisha Dil' on 22.06.2022.
//

import Foundation

protocol CalculatorPresenterDelegate: AnyObject {
    func point()
    func zero()
    func clear()
    func one()
    func two()
    func three()
    func four()
    func five()
    func six()
    func seven()
    func eight()
    func nine()
    
    func sum()
    func subtract()
    func multiply()
    func divide()
    func equal()
    
    func square()
    func cube()
    func exponentiation()
    
    func memorySave()
    func memoryRead()
    func memoryClear()
    func memoryAdd()
    func memorySubtract()
    
    func squareRoot()
    func logarithm()
    func naturalLogarithm()
    func factorial()
    
    func piNumber()
    func sin()
    func cos()
    func tan()
    
    func history()
    
    func displayData(text: String)
    func displayMemoryData(text: String)
}
