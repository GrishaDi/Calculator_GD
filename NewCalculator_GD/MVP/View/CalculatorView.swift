//
//  CalculatorView.swift
//  NewCalculator_GD
//
//  Created by Grisha Dil' on 08.04.2022.
//

import UIKit

class CalculatorView: UIView {
    
    let resultLabel: UILabel = {
    let label = UILabel()
    label.text = "0"
    label.textColor = .orange
    label.textAlignment = .right
    label.font = UIFont(name: "Helvetica", size: 80)
    label.adjustsFontSizeToFitWidth = true
    label.minimumScaleFactor = 0.3
    return label
    }()
    let numberInMemoryLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.textColor = .systemIndigo
        label.textAlignment = .right
        label.font = UIFont(name: "Helvetica", size: 30)
        return label
    }()
    
    
    let numberOne: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemGreen
        button.setTitle("1", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.borderWidth = 1.5
        button.layer.borderColor = UIColor.black.cgColor
        return button
    }()
    let numberTwo: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemGreen
        button.setTitle("2", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.borderWidth = 1.5
        button.layer.borderColor = UIColor.black.cgColor
        return button
    }()
    let numberThree: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemGreen
        button.setTitle("3", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.borderWidth = 1.5
        button.layer.borderColor = UIColor.black.cgColor
        return button
    }()
    let numberFour: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemGreen
        button.setTitle("4", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.borderWidth = 1.5
        button.layer.borderColor = UIColor.black.cgColor
        return button
    }()
    let numberFive: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemGreen
        button.setTitle("5", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.borderWidth = 1.5
        button.layer.borderColor = UIColor.black.cgColor
        return button
    }()
    let numberSix: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemGreen
        button.setTitle("6", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.borderWidth = 1.5
        button.layer.borderColor = UIColor.black.cgColor
        return button
    }()
    let numberSeven: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemGreen
        button.setTitle("7", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.borderWidth = 1.5
        button.layer.borderColor = UIColor.black.cgColor
        return button
    }()
    let numberEight: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemGreen
        button.setTitle("8", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.borderWidth = 1.5
        button.layer.borderColor = UIColor.black.cgColor
        return button
    }()
    let numberNine: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemGreen
        button.setTitle("9", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.borderWidth = 1.5
        button.layer.borderColor = UIColor.black.cgColor
        return button
    }()
    let pointButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemGreen
        button.setTitle(".", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.borderWidth = 1.5
        button.layer.borderColor = UIColor.black.cgColor
        return button
    }()
    let zeroButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemGreen
        button.setTitle("0", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.borderWidth = 1.5
        button.layer.borderColor = UIColor.black.cgColor
        button.tag = 1
        return button
    }()
    let clearButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemOrange
        button.setTitle("Clear", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.borderWidth = 1.5
        button.layer.borderColor = UIColor.black.cgColor
        return button
    }()
    
    let memoryClearButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemIndigo
        button.titleLabel?.numberOfLines = 0
        button.titleLabel?.textAlignment = .center
        button.setTitle("M-Clear", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.borderWidth = 1.5
        button.layer.borderColor = UIColor.black.cgColor
        button.tag = 1
        return button
    }()
    let addToMemoryButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemIndigo
        button.setTitle("M+", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.borderWidth = 1.5
        button.layer.borderColor = UIColor.black.cgColor
        button.tag = 2
        return button
    }()
    let subtractFromMemoryButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemIndigo
        button.setTitle("M-", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.borderWidth = 1.5
        button.layer.borderColor = UIColor.black.cgColor
        button.tag = 3
        return button
    }()
    let memoryReadButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemIndigo
        button.setTitle("MR", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.borderWidth = 1.5
        button.layer.borderColor = UIColor.black.cgColor
        button.tag = 4
        return button
    }()
    let memorySaveButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemIndigo
        button.setTitle("MS", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.borderWidth = 1.5
        button.layer.borderColor = UIColor.black.cgColor
        button.tag = 5
        return button
    }()
    
    let equalButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .orange
        button.setTitle("=", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.borderWidth = 1.5
        button.layer.borderColor = UIColor.black.cgColor
        button.tag = 1
        return button
    }()
    let sumButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .orange
        button.setTitle("+", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.borderWidth = 1.5
        button.layer.borderColor = UIColor.black.cgColor
        button.tag = 2
        return button
    }()
    let subtractButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .orange
        button.setTitle("-", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.borderWidth = 1.5
        button.layer.borderColor = UIColor.black.cgColor
        button.tag = 3
        return button
    }()
    let multiplyButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .orange
        button.setTitle("x", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.borderWidth = 1.5
        button.layer.borderColor = UIColor.black.cgColor
        button.tag = 4
        return button
    }()
    let divideButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .orange
        button.setTitle("/", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.borderWidth = 1.5
        button.layer.borderColor = UIColor.black.cgColor
        button.tag = 5
        return button
    }()
    let exponentiationButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemYellow
        button.setTitle("x^y", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.borderWidth = 1.5
        button.layer.borderColor = UIColor.black.cgColor
        button.tag = 6
        return button
    }()
    
    let squareButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemYellow
        button.setTitle("x^2", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.borderWidth = 1.5
        button.layer.borderColor = UIColor.black.cgColor
        button.tag = 1
        return button
    }()
    let cubeButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemYellow
        button.setTitle("x^3", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.borderWidth = 1.5
        button.layer.borderColor = UIColor.black.cgColor
        button.tag = 2
        return button
    }()

    // Landscape Buttons
    let historyButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemOrange
        button.setTitle("History", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.borderWidth = 1.5
        button.layer.borderColor = UIColor.black.cgColor
        button.tag = 0
        return button
    }()
    
    let piButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemYellow
        button.setTitle("π", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.borderWidth = 1.5
        button.layer.borderColor = UIColor.black.cgColor
        button.tag = 2
        return button
    }()
    
    let sinButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemYellow
        button.setTitle("sin", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.borderWidth = 1.5
        button.layer.borderColor = UIColor.black.cgColor
        button.tag = 2
        return button
    }()
    
    let cosButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemYellow
        button.setTitle("cos", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.borderWidth = 1.5
        button.layer.borderColor = UIColor.black.cgColor
        button.tag = 2
        return button
    }()
    
    let tanButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemYellow
        button.setTitle("tan", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.borderWidth = 1.5
        button.layer.borderColor = UIColor.black.cgColor
        button.tag = 2
        return button
    }()
    
    let squareRootButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemYellow
        button.setTitle("√x", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.borderWidth = 1.5
        button.layer.borderColor = UIColor.black.cgColor
        button.tag = 2
        return button
    }()
    
    let logarithmButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemYellow
        button.setTitle("log", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.borderWidth = 1.5
        button.layer.borderColor = UIColor.black.cgColor
        button.tag = 2
        return button
    }()
    
    let naturalLogarithmButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemYellow
        button.setTitle("ln", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.borderWidth = 1.5
        button.layer.borderColor = UIColor.black.cgColor
        button.tag = 2
        return button
    }()
    
    let factorialButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemYellow
        button.setTitle("n!", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.borderWidth = 1.5
        button.layer.borderColor = UIColor.black.cgColor
        button.tag = 2
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        clipsToBounds = true
        addSubview(numberOne)
        addSubview(numberTwo)
        addSubview(numberThree)
        addSubview(numberFour)
        addSubview(numberFive)
        addSubview(numberSix)
        addSubview(numberSeven)
        addSubview(numberEight)
        addSubview(numberNine)
        addSubview(pointButton)
        addSubview(zeroButton)
        addSubview(clearButton)
        addSubview(memoryClearButton)
        addSubview(addToMemoryButton)
        addSubview(subtractFromMemoryButton)
        addSubview(memoryReadButton)
        addSubview(memorySaveButton)
        addSubview(equalButton)
        addSubview(sumButton)
        addSubview(subtractButton)
        addSubview(multiplyButton)
        addSubview(divideButton)
        addSubview(exponentiationButton)
        addSubview(squareButton)
        addSubview(cubeButton)
        addSubview(resultLabel)
        addSubview(numberInMemoryLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
