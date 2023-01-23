//
//  CheckoutViewController.swift
//  UINavigationViewController
//
//  Created by Mikhail Chuparnov on 17.01.2023.
//

import UIKit

class CheckoutViewController: UIViewController {

    private var pizza: Pizza
    
    private var adds: [String]
    
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
    
    private var payByCashLabelSwitchView = LabelSwitchView(name: "Оплата наличкой")
    
    private var payByCreditashLabelSwitchView = LabelSwitchView(name: "Оплата картой")
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Ваш заказ:"
        label.font = UIFont.systemFont(ofSize: 24, weight: .heavy)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let labelsStack: UIStackView = {
        let stack = UIStackView()
        stack.spacing = 4
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let label0: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let label1: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let label2: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let label3: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let labelPizza: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let payButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .black
        button.layer.cornerRadius = 12
        button.clipsToBounds = true
        button.setTitle("Оплата \u{F8FF}", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let alert = UIAlertController(
        title: "Заказ оплачен",
        message: "Ваш заказ доставят в течении 15 минут! \nПриятного аппетита",
        preferredStyle: .alert
    )
    
    init(pizza: Pizza, adds: [String]) {
        self.adds = adds
        self.pizza = pizza
        super.init(nibName: nil, bundle: nil)
        setupLayout()
        setupSwitchers()
        setupLabelsData()
        setupProperts()
        setupAlertAction()
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
        view.addSubview(titleLabel)
        view.addSubview(labelsStack)
        
        switchesStack.addArrangedSubview(payByCashLabelSwitchView)
        switchesStack.addArrangedSubview(payByCreditashLabelSwitchView)
        
        labelsStack.addArrangedSubview(labelPizza)
        labelsStack.addArrangedSubview(label0)
        labelsStack.addArrangedSubview(label1)
        labelsStack.addArrangedSubview(label2)
        labelsStack.addArrangedSubview(label3)
        
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
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: inset*2),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        NSLayoutConstraint.activate([
            labelsStack.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: inset*2),
            labelsStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: inset*2),
            labelsStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -inset*2),
            labelsStack.heightAnchor.constraint(equalToConstant: 200)
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
    
    private func setupLabelsData() {
        labelPizza.text = "Пицца " + pizza.name
        
        if adds.count > 1 {
            for i in 0...adds.count-1 {
                switch i {
                case 0: label0.text = adds[0]
                case 1: label1.text = adds[1]
                case 2: label2.text = adds[2]
                case 3: label3.text = adds[3]
                default: return
                }
            }
            
        }
    }
    
    private func setupProperts() {
        view.backgroundColor = .systemGray6
        self.title = "Оплата"
        self.navigationItem.setHidesBackButton(true, animated: true)
        
        payByCashLabelSwitchView.delegate = self
        payByCreditashLabelSwitchView.delegate = self
        
        payButton.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
    }
    
    @objc private func tapButton() {
        payButton.animationTapButton()
        present(alert, animated: true)
    }
    
    private func setupAlertAction() {
        let alertAction = UIAlertAction(title: "Ok", style: .cancel) { action in
            self.navigationController?.popViewController(animated: true)
        }
        alert.addAction(alertAction)
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
