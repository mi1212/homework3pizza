//
//  CheckoutViewController.swift
//  UINavigationViewController
//
//  Created by Mikhail Chuparnov on 17.01.2023.
//

import UIKit

class CheckoutViewController: UIViewController {

    var pizza: Pizza
    
    var adds: [String]
    
    var isByCash = false {
        didSet {
            setupSwitchers()
        }
    }
    
    private let switchesStack: UIStackView = {
        let stack = UIStackView()
        stack.spacing = 4
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    var payByCashLabelSwitchView = LabelSwitchView(name: "Оплата наличкой")
    
    var payByCreditashLabelSwitchView = LabelSwitchView(name: "Оплата картой")
    
    private let payButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .black
        button.layer.cornerRadius = 12
        button.clipsToBounds = true
        button.setTitle("Оплата \u{F8FF}", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    init(pizza: Pizza, adds: [String]) {
        self.adds = adds
        self.pizza = pizza
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = .systemGray6
        self.title = "Оплата"
        self.navigationItem.setHidesBackButton(true, animated: true)
        
        setupLayout()
        setupSwitchers()
        
    }
    
    @available (*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
 
    private func setupLayout() {
        view.addSubview(payButton)
        view.addSubview(switchesStack)
        
        switchesStack.addArrangedSubview(payByCashLabelSwitchView)
        switchesStack.addArrangedSubview(payByCreditashLabelSwitchView)
        
        payByCashLabelSwitchView.delegate = self
        payByCreditashLabelSwitchView.delegate = self
        
        let inset: CGFloat = 16
        
        NSLayoutConstraint.activate([
            payButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -inset),
            payButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: inset*2),
            payButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -inset*2),
            payButton.heightAnchor.constraint(equalToConstant: 56)
        ])
        
        NSLayoutConstraint.activate([
            switchesStack.bottomAnchor.constraint(equalTo: payButton.topAnchor, constant: -inset*2),
            switchesStack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: inset*3),
            switchesStack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -inset*3),
            switchesStack.heightAnchor.constraint(equalToConstant: 80)
        ])
        
        
    }
    
    private func setupSwitchers() {
        
        if isByCash {
            payByCreditashLabelSwitchView.switcher.isOn = true
            payByCashLabelSwitchView.switcher.isOn = false
        } else {
            payByCreditashLabelSwitchView.switcher.isOn = false
            payByCashLabelSwitchView.switcher.isOn = true
        }
        
    } 
    
}

extension CheckoutViewController: LabelSwitchViewDelegate {
    func add(name: String) {
        if name == "Оплата наличкой" {
            isByCash = false
        } else {
            isByCash = true
        }
    }
    
    func remove(name: String) {
        if name == "Оплата наличкой" {
            isByCash = true
        } else {
            isByCash = false
        }
    }
    
    
}
