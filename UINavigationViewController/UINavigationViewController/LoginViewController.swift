//
//  LoginViewController.swift
//  UINavigationViewController
//
//  Created by Mikhail Chuparnov on 16.01.2023.
//

import UIKit

class LoginViewController: UIViewController {
    
    private let textFieldsStack: UIStackView = {
        let stack = UIStackView()
        stack.spacing = 16
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let phoneTextField: UITextField = {
        let textfield = UITextField()
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 2))
        textfield.leftView = leftView
        textfield.leftViewMode = .always
        textfield.rightView = leftView
        textfield.rightViewMode = .always
        textfield.autocapitalizationType = .none
        textfield.tintColor = .black
        textfield.textColor = .black
        textfield.adjustsFontForContentSizeCategory = true
        textfield.layer.cornerRadius = 12
        textfield.layer.borderColor = UIColor.lightGray.cgColor
        textfield.layer.borderWidth = 2
        textfield.clipsToBounds = true
        textfield.backgroundColor = .white
        textfield.clearButtonMode = .whileEditing
        textfield.translatesAutoresizingMaskIntoConstraints = false
        return textfield
    }()
    
    private let passTextField: UITextField = {
        let textfield = UITextField()
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 2))
        textfield.leftView = leftView
        textfield.leftViewMode = .always
        textfield.rightView = leftView
        textfield.rightViewMode = .always
        textfield.autocapitalizationType = .none
        textfield.backgroundColor = .white
        textfield.tintColor = .black
        textfield.textColor = .black
        textfield.adjustsFontForContentSizeCategory = true
        textfield.layer.cornerRadius = 12
        textfield.layer.borderColor = UIColor.lightGray.cgColor
        textfield.layer.borderWidth = 2
        textfield.clipsToBounds = true
        textfield.clearButtonMode = .whileEditing
        textfield.isSecureTextEntry = true
        textfield.translatesAutoresizingMaskIntoConstraints = false
        return textfield
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemGray5
        setupLayout()
    }
    
    private func setupLayout() {
        self.view.addSubview(textFieldsStack)
        textFieldsStack.addArrangedSubview(phoneTextField)
        textFieldsStack.addArrangedSubview(passTextField)
        
        let inset: CGFloat = 16
        
        NSLayoutConstraint.activate([
            textFieldsStack.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            textFieldsStack.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: inset),
            textFieldsStack.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -inset),
            textFieldsStack.heightAnchor.constraint(equalToConstant: 112),
            
        ])
    }
    
}
