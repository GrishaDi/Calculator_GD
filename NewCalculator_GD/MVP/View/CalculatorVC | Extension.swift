//
//  CalculatorViewController | Extension.swift
//  NewCalculator_GD
//
//  Created by Grisha Dil' on 22.06.2022.
//

import UIKit

extension CalculatorViewController {
    @objc func point() {
        presenter.pointTapped()
    }
    @objc func zero() {
        presenter.zeroTapped()
    }
    @objc func clear() {
        presenter.clearTapped()
        container.pointButton.isEnabled = true
        container.pointButton.alpha = 1
    }
    @objc func one() {
        presenter.oneTapped()
    }
    @objc func two() {
        presenter.twoTapped()
    }
    @objc func three() {
        presenter.threeTapped()
    }
    @objc func four() {
        presenter.fourTapped()
    }
    @objc func five() {
        presenter.fiveTapped()
    }
    @objc func six() {
        presenter.sixTapped()
    }
    @objc func seven() {
        presenter.sevenTapped()
    }
    @objc func eight() {
        presenter.eightTapped()
    }
    @objc func nine() {
        presenter.nineTapped()
    }
    @objc func sum() {
        presenter.sumTapped()
    }
    @objc func subtract() {
        presenter.subtractTapped()
    }
    @objc func multiply() {
        presenter.multiplyTapped()
    }
    @objc func divide() {
        presenter.divideTapped()
    }
    @objc func equal() {
        presenter.equalPressed()
        container.pointButton.isEnabled = true
        container.pointButton.alpha = 1
    }
    @objc func square() {
        presenter.squareTapped()
    }
    @objc func cube() {
        presenter.cubeTapped()
    }
    @objc func exponentiation() {
        presenter.exponentiationTapped()
        container.pointButton.isEnabled = false
        container.pointButton.alpha = 0.65
    }
    @objc func memorySave() {
        presenter.memorySavePressed()
    }
    @objc func memoryRead() {
        presenter.memoryReadPressed()
    }
    @objc func memoryClear() {
        presenter.memoryClearTapped()
    }
    @objc func memoryAdd() {
        presenter.memoryAddTapped()
    }
    @objc func memorySubtract() {
        presenter.memorySubtractTapped()
    }
    @objc func squareRoot(){
        presenter.squareRootTapped()
    }
    @objc func logarithm() {
        presenter.logarithmTapped()
    }
    @objc func naturalLogarithm() {
        presenter.naturalLogarithmTapped()
    }
    @objc func factorial() {
        presenter.factorialTapped()
    }
    @objc func piNumber(){
        presenter.piNumberTapped()
    }
    @objc func sin() {
        presenter.sinTapped()
    }
    @objc func cos() {
        presenter.cosTapped()
    }
    @objc func tan() {
        presenter.tanTapped()
    }
    @objc func history() {
        coordinator?.eventOccurred(with: .operationsResultHistoryTapped)
    }
    
    func displayData(text: String) {
        container.resultLabel.text = text
    }
    func displayMemoryData(text: String) {
        container.numberInMemoryLabel.text = text
    }
}
