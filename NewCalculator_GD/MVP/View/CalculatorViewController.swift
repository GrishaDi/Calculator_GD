//
//  ViewController.swift
//  NewCalculator_GD
//
//  Created by Grisha Dil' on 26.03.2022.
//

import UIKit

class CalculatorViewController: UIViewController, CalculatorPresenterDelegate, Coordinating {

    private let compactButtonWidth: CGFloat = 1/5
    private let compactSpacing: CGFloat = -5
    private let compactButtonWidthDecrease: CGFloat = -6
    
    private let regularButtonWidth: CGFloat = 1/7
    private let regularButtonWidthDecrease: CGFloat = -4
    private let regularButtonHeight: CGFloat = 1/8
    private let regularSpacing: CGFloat = -4
    
    private var phoneContainerConstraints: [NSLayoutConstraint] = []
    private var padRegularContainerConstraints: [NSLayoutConstraint] = []
    private var padCompactContainerConstraints: [NSLayoutConstraint] = []
    
    private var basicViewConstraints: [NSLayoutConstraint] = []
    private var engineerViewConstraints: [NSLayoutConstraint] = []
    
    let presenter = CalculatorPresenter()
    let container = CalculatorView()
    
    var coordinator: Coordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(container)
        view.backgroundColor = .black
        container.backgroundColor = .black
        navigationController?.navigationBar.barTintColor = .black
        
        setupConstraints()
        layoutTrait(traitCollection: UIScreen.main.traitCollection)
        
        setUpButtons()

        presenter.setViewDelegate(delegate: self)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        roundCorners()
    }
    
    public func setUpButtons() {
        container.pointButton.addTarget(self, action: #selector(point), for: .touchUpInside)
        container.zeroButton.addTarget(self, action: #selector(zero), for: .touchUpInside)
        container.clearButton.addTarget(self, action: #selector(clear), for: .touchUpInside)
        container.numberOne.addTarget(self, action: #selector(one), for: .touchUpInside)
        container.numberTwo.addTarget(self, action: #selector(two), for: .touchUpInside)
        container.numberThree.addTarget(self, action: #selector(three), for: .touchUpInside)
        container.numberFour.addTarget(self, action: #selector(four), for: .touchUpInside)
        container.numberFive.addTarget(self, action: #selector(five), for: .touchUpInside)
        container.numberSix.addTarget(self, action: #selector(six), for: .touchUpInside)
        container.numberSeven.addTarget(self, action: #selector(seven), for: .touchUpInside)
        container.numberEight.addTarget(self, action: #selector(eight), for: .touchUpInside)
        container.numberNine.addTarget(self, action: #selector(nine), for: .touchUpInside)
        
        container.sumButton.addTarget(self, action: #selector(sum), for: .touchUpInside)
        container.subtractButton.addTarget(self, action: #selector(subtract), for: .touchUpInside)
        container.multiplyButton.addTarget(self, action: #selector(multiply), for: .touchUpInside)
        container.divideButton.addTarget(self, action: #selector(divide), for: .touchUpInside)
        container.equalButton.addTarget(self, action: #selector(equal), for: .touchUpInside)
        
        container.memorySaveButton.addTarget(self, action: #selector(memorySave), for: .touchUpInside)
        container.memoryReadButton.addTarget(self, action: #selector(memoryRead), for: .touchUpInside)
        container.memoryClearButton.addTarget(self, action: #selector(memoryClear), for: .touchUpInside)
        container.addToMemoryButton.addTarget(self, action: #selector(memoryAdd), for: .touchUpInside)
        container.subtractFromMemoryButton.addTarget(self, action: #selector(memorySubtract), for: .touchUpInside)
        
        container.squareRootButton.addTarget(self, action: #selector(squareRoot), for: .touchUpInside)
        container.logarithmButton.addTarget(self, action: #selector(logarithm), for: .touchUpInside)
        container.naturalLogarithmButton.addTarget(self, action: #selector(naturalLogarithm), for: .touchUpInside)
        container.factorialButton.addTarget(self, action: #selector(factorial), for: .touchUpInside)
        
        container.piButton.addTarget(self, action: #selector(piNumber), for: .touchUpInside)
        container.sinButton.addTarget(self, action: #selector(sin), for: .touchUpInside)
        container.cosButton.addTarget(self, action: #selector(cos), for: .touchUpInside)
        container.tanButton.addTarget(self, action: #selector(tan), for: .touchUpInside)
        
        container.historyButton.addTarget(self, action: #selector(history), for: .touchUpInside)
        
        container.squareButton.addTarget(self, action: #selector(square), for: .touchUpInside)
        container.cubeButton.addTarget(self, action: #selector(cube), for: .touchUpInside)
        container.exponentiationButton.addTarget(self, action: #selector(exponentiation), for: .touchUpInside)
    }
    
    func setupConstraints() {
        let portraitScreenElements = [container, container.pointButton, container.zeroButton, container.clearButton, container.memoryClearButton, container.equalButton, container.numberOne, container.numberTwo, container.numberThree, container.addToMemoryButton, container.memorySaveButton, container.sumButton, container.numberFour, container.numberFive, container.numberSix, container.subtractFromMemoryButton, container.subtractButton, container.numberSeven, container.numberEight, container.numberNine, container.memoryReadButton, container.multiplyButton, container.squareButton, container.cubeButton, container.exponentiationButton, container.memorySaveButton, container.divideButton, container.numberInMemoryLabel, container.resultLabel]
        for element in portraitScreenElements {
            element.translatesAutoresizingMaskIntoConstraints = false
        }
        // MARK: -Container Constraints
        phoneContainerConstraints = [
            container.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            container.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            container.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            container.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor)
        ]
        padRegularContainerConstraints = [
            container.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            container.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            container.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 9/10),
            container.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 6/10)
        ]
        padCompactContainerConstraints = [
            container.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            container.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            container.widthAnchor.constraint(equalTo: view.widthAnchor),
            container.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 9/10)
        ]
        // MARK: -Basic View Constraints
        basicViewConstraints = [
            container.equalButton.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: compactSpacing),
            container.equalButton.bottomAnchor.constraint(equalTo: container.bottomAnchor),
            container.equalButton.widthAnchor.constraint(equalTo: container.widthAnchor, multiplier: compactButtonWidth, constant: compactButtonWidthDecrease),
            container.equalButton.heightAnchor.constraint(equalTo: container.equalButton.widthAnchor),
            
            container.memoryClearButton.trailingAnchor.constraint(equalTo: container.equalButton.leadingAnchor, constant: compactSpacing),
            container.memoryClearButton.bottomAnchor.constraint(equalTo: container.bottomAnchor),
            container.memoryClearButton.widthAnchor.constraint(equalTo: container.widthAnchor, multiplier: compactButtonWidth, constant: compactButtonWidthDecrease),
            container.memoryClearButton.heightAnchor.constraint(equalTo: container.memoryClearButton.widthAnchor),
            
            container.clearButton.trailingAnchor.constraint(equalTo: container.memoryClearButton.leadingAnchor, constant: compactSpacing),
            container.clearButton.bottomAnchor.constraint(equalTo: container.bottomAnchor),
            container.clearButton.widthAnchor.constraint(equalTo: container.widthAnchor, multiplier: compactButtonWidth, constant: compactButtonWidthDecrease),
            container.clearButton.heightAnchor.constraint(equalTo: container.clearButton.widthAnchor),
            
            container.zeroButton.trailingAnchor.constraint(equalTo: container.clearButton.leadingAnchor, constant: compactSpacing),
            container.zeroButton.bottomAnchor.constraint(equalTo: container.bottomAnchor),
            container.zeroButton.widthAnchor.constraint(equalTo: container.widthAnchor, multiplier: compactButtonWidth, constant: compactButtonWidthDecrease),
            container.zeroButton.heightAnchor.constraint(equalTo: container.zeroButton.widthAnchor),
            
            container.pointButton.trailingAnchor.constraint(equalTo: container.zeroButton.leadingAnchor, constant: compactSpacing),
            container.pointButton.bottomAnchor.constraint(equalTo: container.bottomAnchor),
            container.pointButton.widthAnchor.constraint(equalTo: container.widthAnchor, multiplier: compactButtonWidth, constant: compactButtonWidthDecrease),
            container.pointButton.heightAnchor.constraint(equalTo: container.pointButton.widthAnchor),
            
            container.sumButton.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: compactSpacing),
            container.sumButton.bottomAnchor.constraint(equalTo: container.equalButton.topAnchor, constant: compactSpacing),
            container.sumButton.widthAnchor.constraint(equalTo: container.widthAnchor, multiplier: compactButtonWidth, constant: compactButtonWidthDecrease),
            container.sumButton.heightAnchor.constraint(equalTo: container.sumButton.widthAnchor),
            
            container.addToMemoryButton.trailingAnchor.constraint(equalTo: container.sumButton.leadingAnchor, constant: compactSpacing),
            container.addToMemoryButton.bottomAnchor.constraint(equalTo: container.memoryClearButton.topAnchor, constant: compactSpacing),
            container.addToMemoryButton.widthAnchor.constraint(equalTo: container.widthAnchor, multiplier: compactButtonWidth, constant: compactButtonWidthDecrease),
            container.addToMemoryButton.heightAnchor.constraint(equalTo: container.addToMemoryButton.widthAnchor),
            
            container.numberThree.trailingAnchor.constraint(equalTo: container.addToMemoryButton.leadingAnchor, constant: compactSpacing),
            container.numberThree.bottomAnchor.constraint(equalTo: container.clearButton.topAnchor, constant: compactSpacing),
            container.numberThree.widthAnchor.constraint(equalTo: container.widthAnchor, multiplier: compactButtonWidth, constant: compactButtonWidthDecrease),
            container.numberThree.heightAnchor.constraint(equalTo: container.numberThree.widthAnchor),
            
            container.numberTwo.trailingAnchor.constraint(equalTo: container.numberThree.leadingAnchor, constant: compactSpacing),
            container.numberTwo.bottomAnchor.constraint(equalTo: container.zeroButton.topAnchor, constant: compactSpacing),
            container.numberTwo.widthAnchor.constraint(equalTo: container.widthAnchor, multiplier: compactButtonWidth, constant: compactButtonWidthDecrease),
            container.numberTwo.heightAnchor.constraint(equalTo: container.numberTwo.widthAnchor),
            
            container.numberOne.trailingAnchor.constraint(equalTo: container.numberTwo.leadingAnchor, constant: compactSpacing),
            container.numberOne.bottomAnchor.constraint(equalTo: container.pointButton.topAnchor, constant: compactSpacing),
            container.numberOne.widthAnchor.constraint(equalTo: container.widthAnchor, multiplier: compactButtonWidth, constant: compactButtonWidthDecrease),
            container.numberOne.heightAnchor.constraint(equalTo: container.numberOne.widthAnchor),
            
            container.subtractButton.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: compactSpacing),
            container.subtractButton.bottomAnchor.constraint(equalTo: container.sumButton.topAnchor, constant: compactSpacing),
            container.subtractButton.widthAnchor.constraint(equalTo: container.widthAnchor, multiplier: compactButtonWidth, constant: compactButtonWidthDecrease),
            container.subtractButton.heightAnchor.constraint(equalTo: container.subtractButton.widthAnchor),
            
            container.subtractFromMemoryButton.trailingAnchor.constraint(equalTo: container.subtractButton.leadingAnchor, constant: compactSpacing),
            container.subtractFromMemoryButton.bottomAnchor.constraint(equalTo: container.addToMemoryButton.topAnchor, constant: compactSpacing),
            container.subtractFromMemoryButton.widthAnchor.constraint(equalTo: container.widthAnchor, multiplier: compactButtonWidth, constant: compactButtonWidthDecrease),
            container.subtractFromMemoryButton.heightAnchor.constraint(equalTo: container.subtractFromMemoryButton.widthAnchor),
            
            container.numberSix.trailingAnchor.constraint(equalTo: container.subtractFromMemoryButton.leadingAnchor, constant: compactSpacing),
            container.numberSix.bottomAnchor.constraint(equalTo: container.numberThree.topAnchor, constant: compactSpacing),
            container.numberSix.widthAnchor.constraint(equalTo: container.widthAnchor, multiplier: compactButtonWidth, constant: compactButtonWidthDecrease),
            container.numberSix.heightAnchor.constraint(equalTo: container.numberSix.widthAnchor),
            
            container.numberFive.trailingAnchor.constraint(equalTo: container.numberSix.leadingAnchor, constant: compactSpacing),
            container.numberFive.bottomAnchor.constraint(equalTo: container.numberTwo.topAnchor, constant: compactSpacing),
            container.numberFive.widthAnchor.constraint(equalTo: container.widthAnchor, multiplier: compactButtonWidth, constant: compactButtonWidthDecrease),
            container.numberFive.heightAnchor.constraint(equalTo: container.numberFive.widthAnchor),
            
            container.numberFour.trailingAnchor.constraint(equalTo: container.numberFive.leadingAnchor, constant: compactSpacing),
            container.numberFour.bottomAnchor.constraint(equalTo: container.numberOne.topAnchor, constant: compactSpacing),
            container.numberFour.widthAnchor.constraint(equalTo: container.widthAnchor, multiplier: compactButtonWidth, constant: compactButtonWidthDecrease),
            container.numberFour.heightAnchor.constraint(equalTo: container.numberFour.widthAnchor),
            
            container.multiplyButton.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: compactSpacing),
            container.multiplyButton.bottomAnchor.constraint(equalTo: container.subtractButton.topAnchor, constant: compactSpacing),
            container.multiplyButton.widthAnchor.constraint(equalTo: container.widthAnchor, multiplier: compactButtonWidth, constant: compactButtonWidthDecrease),
            container.multiplyButton.heightAnchor.constraint(equalTo: container.multiplyButton.widthAnchor),
            
            container.memoryReadButton.trailingAnchor.constraint(equalTo: container.multiplyButton.leadingAnchor, constant: compactSpacing),
            container.memoryReadButton.bottomAnchor.constraint(equalTo: container.subtractFromMemoryButton.topAnchor, constant: compactSpacing),
            container.memoryReadButton.widthAnchor.constraint(equalTo: container.widthAnchor, multiplier: compactButtonWidth, constant: compactButtonWidthDecrease),
            container.memoryReadButton.heightAnchor.constraint(equalTo: container.memoryReadButton.widthAnchor),
            
            container.numberNine.trailingAnchor.constraint(equalTo: container.memoryReadButton.leadingAnchor, constant: compactSpacing),
            container.numberNine.bottomAnchor.constraint(equalTo: container.numberSix.topAnchor, constant: compactSpacing),
            container.numberNine.widthAnchor.constraint(equalTo: container.widthAnchor, multiplier: compactButtonWidth, constant: compactButtonWidthDecrease),
            container.numberNine.heightAnchor.constraint(equalTo: container.numberNine.widthAnchor),
            
            container.numberEight.trailingAnchor.constraint(equalTo: container.numberNine.leadingAnchor, constant: compactSpacing),
            container.numberEight.bottomAnchor.constraint(equalTo: container.numberFive.topAnchor, constant: compactSpacing),
            container.numberEight.widthAnchor.constraint(equalTo: container.widthAnchor, multiplier: compactButtonWidth, constant: compactButtonWidthDecrease),
            container.numberEight.heightAnchor.constraint(equalTo: container.numberEight.widthAnchor),
            
            container.numberSeven.trailingAnchor.constraint(equalTo: container.numberEight.leadingAnchor, constant: compactSpacing),
            container.numberSeven.bottomAnchor.constraint(equalTo: container.numberFour.topAnchor, constant: compactSpacing),
            container.numberSeven.widthAnchor.constraint(equalTo: container.widthAnchor, multiplier: compactButtonWidth, constant: compactButtonWidthDecrease),
            container.numberSeven.heightAnchor.constraint(equalTo: container.numberSeven.widthAnchor),
            
            container.divideButton.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: compactSpacing),
            container.divideButton.bottomAnchor.constraint(equalTo: container.multiplyButton.topAnchor, constant: compactSpacing),
            container.divideButton.widthAnchor.constraint(equalTo: container.widthAnchor, multiplier: compactButtonWidth, constant: compactButtonWidthDecrease),
            container.divideButton.heightAnchor.constraint(equalTo: container.divideButton.widthAnchor),
            
            container.memorySaveButton.trailingAnchor.constraint(equalTo: container.divideButton.leadingAnchor, constant: compactSpacing),
            container.memorySaveButton.bottomAnchor.constraint(equalTo: container.memoryReadButton.topAnchor, constant: compactSpacing),
            container.memorySaveButton.widthAnchor.constraint(equalTo: container.widthAnchor, multiplier: compactButtonWidth, constant: compactButtonWidthDecrease),
            container.memorySaveButton.heightAnchor.constraint(equalTo: container.memorySaveButton.widthAnchor),
            
            container.exponentiationButton.trailingAnchor.constraint(equalTo: container.memorySaveButton.leadingAnchor, constant: compactSpacing),
            container.exponentiationButton.bottomAnchor.constraint(equalTo: container.numberNine.topAnchor, constant: compactSpacing),
            container.exponentiationButton.widthAnchor.constraint(equalTo: container.widthAnchor, multiplier: compactButtonWidth, constant: compactButtonWidthDecrease),
            container.exponentiationButton.heightAnchor.constraint(equalTo: container.exponentiationButton.widthAnchor),
            
            container.cubeButton.trailingAnchor.constraint(equalTo: container.exponentiationButton.leadingAnchor, constant: compactSpacing),
            container.cubeButton.bottomAnchor.constraint(equalTo: container.numberEight.topAnchor, constant: compactSpacing),
            container.cubeButton.widthAnchor.constraint(equalTo: container.widthAnchor, multiplier: compactButtonWidth, constant: compactButtonWidthDecrease),
            container.cubeButton.heightAnchor.constraint(equalTo: container.cubeButton.widthAnchor),
            
            container.squareButton.trailingAnchor.constraint(equalTo: container.cubeButton.leadingAnchor, constant: compactSpacing),
            container.squareButton.bottomAnchor.constraint(equalTo: container.numberSeven.topAnchor, constant: compactSpacing),
            container.squareButton.widthAnchor.constraint(equalTo: container.widthAnchor, multiplier: compactButtonWidth, constant: compactButtonWidthDecrease),
            container.squareButton.heightAnchor.constraint(equalTo: container.squareButton.widthAnchor),
            
            container.numberInMemoryLabel.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -30),
            container.numberInMemoryLabel.bottomAnchor.constraint(equalTo: container.divideButton.topAnchor, constant: -5),
            container.numberInMemoryLabel.widthAnchor.constraint(equalTo: container.widthAnchor, constant: -60),
            container.numberInMemoryLabel.heightAnchor.constraint(equalToConstant: 30),
            
            container.resultLabel.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -25),
            container.resultLabel.bottomAnchor.constraint(equalTo: container.numberInMemoryLabel.topAnchor, constant: -5),
            container.resultLabel.widthAnchor.constraint(equalTo: container.widthAnchor, constant: -50),
            container.resultLabel.heightAnchor.constraint(equalToConstant: 90),
        ]
        // MARK: -Engineer View Constraints
        engineerViewConstraints = [
            container.equalButton.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -2),
            container.equalButton.bottomAnchor.constraint(equalTo: container.bottomAnchor),
            container.equalButton.widthAnchor.constraint(equalTo: container.widthAnchor, multiplier: regularButtonWidth, constant: regularButtonWidthDecrease),
            container.equalButton.heightAnchor.constraint(equalTo: container.heightAnchor, multiplier: regularButtonHeight),
            
            container.memoryClearButton.trailingAnchor.constraint(equalTo: container.equalButton.leadingAnchor, constant: regularSpacing),
            container.memoryClearButton.bottomAnchor.constraint(equalTo: container.bottomAnchor),
            container.memoryClearButton.widthAnchor.constraint(equalTo: container.widthAnchor, multiplier: regularButtonWidth, constant: regularButtonWidthDecrease),
            container.memoryClearButton.heightAnchor.constraint(equalTo: container.heightAnchor, multiplier: regularButtonHeight),
            
            container.clearButton.trailingAnchor.constraint(equalTo: container.memoryClearButton.leadingAnchor, constant: regularSpacing),
            container.clearButton.bottomAnchor.constraint(equalTo: container.bottomAnchor),
            container.clearButton.widthAnchor.constraint(equalTo: container.widthAnchor, multiplier: regularButtonWidth, constant: regularButtonWidthDecrease),
            container.clearButton.heightAnchor.constraint(equalTo: container.heightAnchor, multiplier: regularButtonHeight),
            
            container.zeroButton.trailingAnchor.constraint(equalTo: container.clearButton.leadingAnchor, constant: regularSpacing),
            container.zeroButton.bottomAnchor.constraint(equalTo: container.bottomAnchor),
            container.zeroButton.widthAnchor.constraint(equalTo: container.widthAnchor, multiplier: regularButtonWidth, constant: regularButtonWidthDecrease),
            container.zeroButton.heightAnchor.constraint(equalTo: container.heightAnchor, multiplier: regularButtonHeight),
            
            container.pointButton.trailingAnchor.constraint(equalTo: container.zeroButton.leadingAnchor, constant: regularSpacing),
            container.pointButton.bottomAnchor.constraint(equalTo: container.bottomAnchor),
            container.pointButton.widthAnchor.constraint(equalTo: container.widthAnchor, multiplier: regularButtonWidth, constant: regularButtonWidthDecrease),
            container.pointButton.heightAnchor.constraint(equalTo: container.heightAnchor, multiplier: regularButtonHeight),
            
            container.factorialButton.trailingAnchor.constraint(equalTo: container.pointButton.leadingAnchor, constant: regularSpacing),
            container.factorialButton.bottomAnchor.constraint(equalTo: container.bottomAnchor),
            container.factorialButton.widthAnchor.constraint(equalTo: container.widthAnchor, multiplier: regularButtonWidth, constant: regularButtonWidthDecrease),
            container.factorialButton.heightAnchor.constraint(equalTo: container.heightAnchor, multiplier: regularButtonHeight),
            
            container.tanButton.trailingAnchor.constraint(equalTo: container.factorialButton.leadingAnchor, constant: regularSpacing),
            container.tanButton.bottomAnchor.constraint(equalTo: container.bottomAnchor),
            container.tanButton.widthAnchor.constraint(equalTo: container.widthAnchor, multiplier: regularButtonWidth, constant: regularButtonWidthDecrease),
            container.tanButton.heightAnchor.constraint(equalTo: container.heightAnchor, multiplier: regularButtonHeight),
            
            container.sumButton.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -2),
            container.sumButton.bottomAnchor.constraint(equalTo: container.equalButton.topAnchor, constant: regularSpacing),
            container.sumButton.widthAnchor.constraint(equalTo: container.widthAnchor, multiplier: regularButtonWidth, constant: regularButtonWidthDecrease),
            container.sumButton.heightAnchor.constraint(equalTo: container.heightAnchor, multiplier: regularButtonHeight),
            
            container.addToMemoryButton.trailingAnchor.constraint(equalTo: container.sumButton.leadingAnchor, constant: regularSpacing),
            container.addToMemoryButton.bottomAnchor.constraint(equalTo: container.memoryClearButton.topAnchor, constant: regularSpacing),
            container.addToMemoryButton.widthAnchor.constraint(equalTo: container.widthAnchor, multiplier: regularButtonWidth, constant: regularButtonWidthDecrease),
            container.addToMemoryButton.heightAnchor.constraint(equalTo: container.heightAnchor, multiplier: regularButtonHeight),
            
            container.numberThree.trailingAnchor.constraint(equalTo: container.addToMemoryButton.leadingAnchor, constant: regularSpacing),
            container.numberThree.bottomAnchor.constraint(equalTo: container.clearButton.topAnchor, constant: regularSpacing),
            container.numberThree.widthAnchor.constraint(equalTo: container.widthAnchor, multiplier: regularButtonWidth, constant: regularButtonWidthDecrease),
            container.numberThree.heightAnchor.constraint(equalTo: container.heightAnchor, multiplier: regularButtonHeight),
            
            container.numberTwo.trailingAnchor.constraint(equalTo: container.numberThree.leadingAnchor, constant: regularSpacing),
            container.numberTwo.bottomAnchor.constraint(equalTo: container.zeroButton.topAnchor, constant: regularSpacing),
            container.numberTwo.widthAnchor.constraint(equalTo: container.widthAnchor, multiplier: regularButtonWidth, constant: regularButtonWidthDecrease),
            container.numberTwo.heightAnchor.constraint(equalTo: container.heightAnchor, multiplier: regularButtonHeight),
            
            container.numberOne.trailingAnchor.constraint(equalTo: container.numberTwo.leadingAnchor, constant: regularSpacing),
            container.numberOne.bottomAnchor.constraint(equalTo: container.pointButton.topAnchor, constant: regularSpacing),
            container.numberOne.widthAnchor.constraint(equalTo: container.widthAnchor, multiplier: regularButtonWidth, constant: regularButtonWidthDecrease),
            container.numberOne.heightAnchor.constraint(equalTo: container.heightAnchor, multiplier: regularButtonHeight),
            
            container.naturalLogarithmButton.trailingAnchor.constraint(equalTo: container.numberOne.leadingAnchor, constant: regularSpacing),
            container.naturalLogarithmButton.bottomAnchor.constraint(equalTo: container.factorialButton.topAnchor, constant: regularSpacing),
            container.naturalLogarithmButton.widthAnchor.constraint(equalTo: container.widthAnchor, multiplier: regularButtonWidth, constant: regularButtonWidthDecrease),
            container.naturalLogarithmButton.heightAnchor.constraint(equalTo: container.heightAnchor, multiplier: regularButtonHeight),
            
            container.cosButton.trailingAnchor.constraint(equalTo: container.naturalLogarithmButton.leadingAnchor, constant: regularSpacing),
            container.cosButton.bottomAnchor.constraint(equalTo: container.tanButton.topAnchor, constant: regularSpacing),
            container.cosButton.widthAnchor.constraint(equalTo: container.widthAnchor, multiplier: regularButtonWidth, constant: regularButtonWidthDecrease),
            container.cosButton.heightAnchor.constraint(equalTo: container.heightAnchor, multiplier: regularButtonHeight),
            
            container.subtractButton.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -2),
            container.subtractButton.bottomAnchor.constraint(equalTo: container.sumButton.topAnchor, constant: regularSpacing),
            container.subtractButton.widthAnchor.constraint(equalTo: container.widthAnchor, multiplier: regularButtonWidth, constant: regularButtonWidthDecrease),
            container.subtractButton.heightAnchor.constraint(equalTo: container.heightAnchor, multiplier: regularButtonHeight),
            
            container.subtractFromMemoryButton.trailingAnchor.constraint(equalTo: container.subtractButton.leadingAnchor, constant: regularSpacing),
            container.subtractFromMemoryButton.bottomAnchor.constraint(equalTo: container.addToMemoryButton.topAnchor, constant: regularSpacing),
            container.subtractFromMemoryButton.widthAnchor.constraint(equalTo: container.widthAnchor, multiplier: regularButtonWidth, constant: regularButtonWidthDecrease),
            container.subtractFromMemoryButton.heightAnchor.constraint(equalTo: container.heightAnchor, multiplier: regularButtonHeight),
            
            container.numberSix.trailingAnchor.constraint(equalTo: container.subtractFromMemoryButton.leadingAnchor, constant: regularSpacing),
            container.numberSix.bottomAnchor.constraint(equalTo: container.numberThree.topAnchor, constant: regularSpacing),
            container.numberSix.widthAnchor.constraint(equalTo: container.widthAnchor, multiplier: regularButtonWidth, constant: regularButtonWidthDecrease),
            container.numberSix.heightAnchor.constraint(equalTo: container.heightAnchor, multiplier: regularButtonHeight),
            
            container.numberFive.trailingAnchor.constraint(equalTo: container.numberSix.leadingAnchor, constant: regularSpacing),
            container.numberFive.bottomAnchor.constraint(equalTo: container.numberTwo.topAnchor, constant: regularSpacing),
            container.numberFive.widthAnchor.constraint(equalTo: container.widthAnchor, multiplier: regularButtonWidth, constant: regularButtonWidthDecrease),
            container.numberFive.heightAnchor.constraint(equalTo: container.heightAnchor, multiplier: regularButtonHeight),
            
            container.numberFour.trailingAnchor.constraint(equalTo: container.numberFive.leadingAnchor, constant: regularSpacing),
            container.numberFour.bottomAnchor.constraint(equalTo: container.numberOne.topAnchor, constant: regularSpacing),
            container.numberFour.widthAnchor.constraint(equalTo: container.widthAnchor, multiplier: regularButtonWidth, constant: regularButtonWidthDecrease),
            container.numberFour.heightAnchor.constraint(equalTo: container.heightAnchor, multiplier: regularButtonHeight),
            
            container.logarithmButton.trailingAnchor.constraint(equalTo: container.numberFour.leadingAnchor, constant: regularSpacing),
            container.logarithmButton.bottomAnchor.constraint(equalTo: container.naturalLogarithmButton.topAnchor, constant: regularSpacing),
            container.logarithmButton.widthAnchor.constraint(equalTo: container.widthAnchor, multiplier: regularButtonWidth, constant: regularButtonWidthDecrease),
            container.logarithmButton.heightAnchor.constraint(equalTo: container.heightAnchor, multiplier: regularButtonHeight),
            
            container.sinButton.trailingAnchor.constraint(equalTo: container.logarithmButton.leadingAnchor, constant: regularSpacing),
            container.sinButton.bottomAnchor.constraint(equalTo: container.cosButton.topAnchor, constant: regularSpacing),
            container.sinButton.widthAnchor.constraint(equalTo: container.widthAnchor, multiplier: regularButtonWidth, constant: regularButtonWidthDecrease),
            container.sinButton.heightAnchor.constraint(equalTo: container.heightAnchor, multiplier: regularButtonHeight),
            
            container.multiplyButton.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -2),
            container.multiplyButton.bottomAnchor.constraint(equalTo: container.subtractButton.topAnchor, constant: regularSpacing),
            container.multiplyButton.widthAnchor.constraint(equalTo: container.widthAnchor, multiplier: regularButtonWidth, constant: regularButtonWidthDecrease),
            container.multiplyButton.heightAnchor.constraint(equalTo: container.heightAnchor, multiplier: regularButtonHeight),
            
            container.memoryReadButton.trailingAnchor.constraint(equalTo: container.multiplyButton.leadingAnchor, constant: regularSpacing),
            container.memoryReadButton.bottomAnchor.constraint(equalTo: container.subtractFromMemoryButton.topAnchor, constant: regularSpacing),
            container.memoryReadButton.widthAnchor.constraint(equalTo: container.widthAnchor, multiplier: regularButtonWidth, constant: regularButtonWidthDecrease),
            container.memoryReadButton.heightAnchor.constraint(equalTo: container.heightAnchor, multiplier: regularButtonHeight),
            
            container.numberNine.trailingAnchor.constraint(equalTo: container.memoryReadButton.leadingAnchor, constant: regularSpacing),
            container.numberNine.bottomAnchor.constraint(equalTo: container.numberSix.topAnchor, constant: regularSpacing),
            container.numberNine.widthAnchor.constraint(equalTo: container.widthAnchor, multiplier: regularButtonWidth, constant: regularButtonWidthDecrease),
            container.numberNine.heightAnchor.constraint(equalTo: container.heightAnchor, multiplier: regularButtonHeight),
            
            container.numberEight.trailingAnchor.constraint(equalTo: container.numberNine.leadingAnchor, constant: regularSpacing),
            container.numberEight.bottomAnchor.constraint(equalTo: container.numberFive.topAnchor, constant: regularSpacing),
            container.numberEight.widthAnchor.constraint(equalTo: container.widthAnchor, multiplier: regularButtonWidth, constant: regularButtonWidthDecrease),
            container.numberEight.heightAnchor.constraint(equalTo: container.heightAnchor, multiplier: regularButtonHeight),
            
            container.numberSeven.trailingAnchor.constraint(equalTo: container.numberEight.leadingAnchor, constant: regularSpacing),
            container.numberSeven.bottomAnchor.constraint(equalTo: container.numberFour.topAnchor, constant: regularSpacing),
            container.numberSeven.widthAnchor.constraint(equalTo: container.widthAnchor, multiplier: regularButtonWidth, constant: regularButtonWidthDecrease),
            container.numberSeven.heightAnchor.constraint(equalTo: container.heightAnchor, multiplier: regularButtonHeight),
            
            container.squareRootButton.trailingAnchor.constraint(equalTo: container.numberSeven.leadingAnchor, constant: regularSpacing),
            container.squareRootButton.bottomAnchor.constraint(equalTo: container.logarithmButton.topAnchor, constant: regularSpacing),
            container.squareRootButton.widthAnchor.constraint(equalTo: container.widthAnchor, multiplier: regularButtonWidth, constant: regularButtonWidthDecrease),
            container.squareRootButton.heightAnchor.constraint(equalTo: container.heightAnchor, multiplier: regularButtonHeight),
            
            container.piButton.trailingAnchor.constraint(equalTo: container.squareRootButton.leadingAnchor, constant: regularSpacing),
            container.piButton.bottomAnchor.constraint(equalTo: container.sinButton.topAnchor, constant: regularSpacing),
            container.piButton.widthAnchor.constraint(equalTo: container.widthAnchor, multiplier: regularButtonWidth, constant: regularButtonWidthDecrease),
            container.piButton.heightAnchor.constraint(equalTo: container.heightAnchor, multiplier: regularButtonHeight),
            
            container.divideButton.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -2),
            container.divideButton.bottomAnchor.constraint(equalTo: container.multiplyButton.topAnchor, constant: regularSpacing),
            container.divideButton.widthAnchor.constraint(equalTo: container.widthAnchor, multiplier: regularButtonWidth, constant: regularButtonWidthDecrease),
            container.divideButton.heightAnchor.constraint(equalTo: container.heightAnchor, multiplier: regularButtonHeight),
            
            container.memorySaveButton.trailingAnchor.constraint(equalTo: container.divideButton.leadingAnchor, constant: regularSpacing),
            container.memorySaveButton.bottomAnchor.constraint(equalTo: container.memoryReadButton.topAnchor, constant: regularSpacing),
            container.memorySaveButton.widthAnchor.constraint(equalTo: container.widthAnchor, multiplier: regularButtonWidth, constant: regularButtonWidthDecrease),
            container.memorySaveButton.heightAnchor.constraint(equalTo: container.heightAnchor, multiplier: regularButtonHeight),
            
            container.exponentiationButton.trailingAnchor.constraint(equalTo: container.memorySaveButton.leadingAnchor, constant: regularSpacing),
            container.exponentiationButton.bottomAnchor.constraint(equalTo: container.numberNine.topAnchor, constant: regularSpacing),
            container.exponentiationButton.widthAnchor.constraint(equalTo: container.widthAnchor, multiplier: regularButtonWidth, constant: regularButtonWidthDecrease),
            container.exponentiationButton.heightAnchor.constraint(equalTo: container.heightAnchor, multiplier: regularButtonHeight),
            
            container.cubeButton.trailingAnchor.constraint(equalTo: container.exponentiationButton.leadingAnchor, constant: regularSpacing),
            container.cubeButton.bottomAnchor.constraint(equalTo: container.numberEight.topAnchor, constant: regularSpacing),
            container.cubeButton.widthAnchor.constraint(equalTo: container.widthAnchor, multiplier: regularButtonWidth, constant: regularButtonWidthDecrease),
            container.cubeButton.heightAnchor.constraint(equalTo: container.heightAnchor, multiplier: regularButtonHeight),
            
            container.squareButton.trailingAnchor.constraint(equalTo: container.cubeButton.leadingAnchor, constant: regularSpacing),
            container.squareButton.bottomAnchor.constraint(equalTo: container.numberSeven.topAnchor, constant: regularSpacing),
            container.squareButton.widthAnchor.constraint(equalTo: container.widthAnchor, multiplier: regularButtonWidth, constant: regularButtonWidthDecrease),
            container.squareButton.heightAnchor.constraint(equalTo: container.heightAnchor, multiplier: regularButtonHeight),
            
            container.historyButton.trailingAnchor.constraint(equalTo: container.squareButton.leadingAnchor, constant: regularSpacing),
            container.historyButton.bottomAnchor.constraint(equalTo: container.squareRootButton.topAnchor, constant: regularSpacing),
            container.historyButton.widthAnchor.constraint(equalTo: container.widthAnchor, multiplier: regularButtonWidth*2, constant: regularButtonWidthDecrease),
            container.historyButton.heightAnchor.constraint(equalTo: container.heightAnchor, multiplier: regularButtonHeight),
            
            container.numberInMemoryLabel.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -30),
            container.numberInMemoryLabel.bottomAnchor.constraint(equalTo: container.divideButton.topAnchor, constant: -4),
            container.numberInMemoryLabel.widthAnchor.constraint(equalTo: container.widthAnchor, constant: -60),
            container.numberInMemoryLabel.heightAnchor.constraint(equalToConstant: 30),
            
            container.resultLabel.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -25),
            container.resultLabel.bottomAnchor.constraint(equalTo: container.numberInMemoryLabel.topAnchor),
            container.resultLabel.widthAnchor.constraint(equalTo: container.widthAnchor, constant: -50),
            container.resultLabel.heightAnchor.constraint(equalToConstant: 80),
        ]
    }

    func layoutTrait(traitCollection:UITraitCollection) {
        let additionalButtons = [container.historyButton, container.piButton, container.sinButton, container.cosButton, container.tanButton, container.squareRootButton, container.logarithmButton, container.naturalLogarithmButton, container.factorialButton]
        
        if UIDevice.current.userInterfaceIdiom == .phone {
            NSLayoutConstraint.activate(phoneContainerConstraints)
            // If regular height - Remove buttons
            if traitCollection.verticalSizeClass == .regular {
                for button in additionalButtons {
                    button.removeFromSuperview()
                }
                if engineerViewConstraints[0].isActive {
                    NSLayoutConstraint.deactivate(engineerViewConstraints)
                }
                NSLayoutConstraint.activate(basicViewConstraints)
            }
            // If compact height - Add buttons
            if traitCollection.verticalSizeClass == .compact {
                for button in additionalButtons {
                    button.translatesAutoresizingMaskIntoConstraints = false
                    container.addSubview(button)
                }
                if basicViewConstraints[0].isActive {
                    NSLayoutConstraint.deactivate(basicViewConstraints)
                }
                NSLayoutConstraint.activate(engineerViewConstraints)
            }
        } else if UIDevice.current.userInterfaceIdiom == .pad {
            // If regular width - Add buttons
            if traitCollection.horizontalSizeClass == .regular {
                for button in additionalButtons {
                    button.translatesAutoresizingMaskIntoConstraints = false
                    container.addSubview(button)
                }
                if engineerViewConstraints[0].isActive {
                    NSLayoutConstraint.deactivate(padCompactContainerConstraints)
                    NSLayoutConstraint.deactivate(basicViewConstraints)
                }
                NSLayoutConstraint.activate(padRegularContainerConstraints)
                NSLayoutConstraint.activate(engineerViewConstraints)
            }
            // If compact width - Remove buttons
            if traitCollection.horizontalSizeClass == .compact {
                for button in additionalButtons {
                    button.removeFromSuperview()
                }
                if basicViewConstraints[0].isActive {
                    NSLayoutConstraint.deactivate(padRegularContainerConstraints)
                    NSLayoutConstraint.deactivate(engineerViewConstraints)
                }
                NSLayoutConstraint.activate(padCompactContainerConstraints)
                NSLayoutConstraint.activate(basicViewConstraints)
            }
        }
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        layoutTrait(traitCollection: traitCollection)
    }

    func roundCorners() {
        if traitCollection.verticalSizeClass == .compact {
            container.pointButton.layer.cornerRadius = 0
            container.squareButton.layer.cornerRadius = 0

            container.tanButton.layer.cornerRadius = container.tanButton.frame.height/3
            container.tanButton.layer.maskedCorners = .layerMinXMaxYCorner
            container.equalButton.layer.cornerRadius = container.equalButton.frame.height/3
            container.equalButton.layer.maskedCorners = .layerMaxXMaxYCorner
            container.historyButton.layer.cornerRadius = container.historyButton.frame.height/3
            container.historyButton.layer.maskedCorners = .layerMinXMinYCorner
            container.divideButton.layer.cornerRadius = container.divideButton.frame.height/3
            container.divideButton.layer.maskedCorners = .layerMaxXMinYCorner
        } else if traitCollection.horizontalSizeClass == .compact {
            container.pointButton.layer.cornerRadius = container.pointButton.frame.width/3
            container.pointButton.layer.maskedCorners = .layerMinXMaxYCorner
            container.equalButton.layer.cornerRadius = container.equalButton.frame.width/3
            container.equalButton.layer.maskedCorners = .layerMaxXMaxYCorner
            container.squareButton.layer.cornerRadius = container.squareButton.frame.width/3
            container.squareButton.layer.maskedCorners = .layerMinXMinYCorner
            container.divideButton.layer.cornerRadius = container.divideButton.frame.width/3
            container.divideButton.layer.maskedCorners = .layerMaxXMinYCorner
        } else if traitCollection.horizontalSizeClass == .regular && UIDevice.current.userInterfaceIdiom == .pad {
            container.pointButton.layer.cornerRadius = 0
            container.squareButton.layer.cornerRadius = 0

            container.tanButton.layer.cornerRadius = container.tanButton.frame.height/3
            container.tanButton.layer.maskedCorners = .layerMinXMaxYCorner
            container.equalButton.layer.cornerRadius = container.equalButton.frame.height/3
            container.equalButton.layer.maskedCorners = .layerMaxXMaxYCorner
            container.historyButton.layer.cornerRadius = container.historyButton.frame.height/3
            container.historyButton.layer.maskedCorners = .layerMinXMinYCorner
            container.divideButton.layer.cornerRadius = container.divideButton.frame.height/3
            container.divideButton.layer.maskedCorners = .layerMaxXMinYCorner
        } else {
            container.pointButton.layer.cornerRadius = container.pointButton.frame.width/3
            container.pointButton.layer.maskedCorners = .layerMinXMaxYCorner
            container.equalButton.layer.cornerRadius = container.equalButton.frame.width/3
            container.equalButton.layer.maskedCorners = .layerMaxXMaxYCorner
            container.squareButton.layer.cornerRadius = container.squareButton.frame.width/3
            container.squareButton.layer.maskedCorners = .layerMinXMinYCorner
            container.divideButton.layer.cornerRadius = container.divideButton.frame.width/3
            container.divideButton.layer.maskedCorners = .layerMaxXMinYCorner
        }
    }
}


