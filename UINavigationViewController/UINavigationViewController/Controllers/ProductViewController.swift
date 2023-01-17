//
//  ProductViewController.swift
//  UINavigationViewController
//
//  Created by Mikhail Chuparnov on 17.01.2023.
//

import UIKit

class ProductViewController: UIViewController {
    // массив дополнительных ингридиентов
    var addsArray = [String]()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 24, weight: .heavy)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let image: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let addsStack: UIStackView = {
        let stack = UIStackView()
        stack.spacing = 16
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let cheeseSwitch = LabelSwitchView(name: "Сыр моцарелла")
    
    private let hamSwitch = LabelSwitchView(name: "Ветчина")
    
    private let mushroomsSwitch = LabelSwitchView(name: "Грибы")
    
    private let olivesSwitch = LabelSwitchView(name: "Маслины")
    
    private let checkoutButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemTeal
        button.layer.cornerRadius = 12
        button.clipsToBounds = true
        button.setTitle("Купить", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    init(pizza: Pizza) {
        super.init(nibName: nil, bundle: nil)
        setupLayout()
        setupData(pizza: pizza)
        setupProperts()
    }
    
    @available (*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        
    }
    
    private func setupLayout() {
        view.addSubview(titleLabel)
        view.addSubview(image)
        view.addSubview(addsStack)
        view.addSubview(checkoutButton)
        
        addsStack.addArrangedSubview(cheeseSwitch)
        addsStack.addArrangedSubview(hamSwitch)
        addsStack.addArrangedSubview(mushroomsSwitch)
        addsStack.addArrangedSubview(olivesSwitch)
         
        let inset: CGFloat = 16
        
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 2*inset),
            image.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: inset*4),
            image.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -inset*4),
            image.heightAnchor.constraint(equalTo: image.widthAnchor)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 2*inset),
            titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: inset),
            titleLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -inset),
            
        ])
        
        NSLayoutConstraint.activate([
            addsStack.topAnchor.constraint(equalTo: image.bottomAnchor, constant: inset*3),
            addsStack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: inset*3),
            addsStack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -inset*3),
            addsStack.heightAnchor.constraint(equalToConstant: 250)
        ])
        
        NSLayoutConstraint.activate([
            checkoutButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -inset),
            checkoutButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: inset*2),
            checkoutButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -inset*2),
            checkoutButton.heightAnchor.constraint(equalToConstant: 56)
        ])
    }
    
    private func setupData(pizza: Pizza) {
        image.image = UIImage(named: pizza.imageName)
        titleLabel.text = pizza.name
    }
    
    private func setupProperts() {
       cheeseSwitch.delegate = self
       hamSwitch.delegate = self
       mushroomsSwitch.delegate = self
       olivesSwitch.delegate = self
        
        checkoutButton.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
       
    }
    
    @objc private func tapButton() {
        checkoutButton.animationTapButton()
    }

}

extension ProductViewController: LabelSwitchViewDelegate {
    func add(name: String) {
        addsArray.append(name)
    }
    
    func remove(name: String) {
        addsArray = addsArray.filter { $0 != name}
    }

    
    
}
