//
//  ProductsViewController.swift
//  UINavigationViewController
//
//  Created by Mikhail Chuparnov on 16.01.2023.
//

import UIKit

class ProductsViewController: UIViewController {

    let pizzaProduct = ProductView(name: "pizza")
    
    let sushiProduct = ProductView(name: "sushi")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemGray6
        setupLayout()
    }
    
    private func setupLayout() {
        self.view.addSubview(pizzaProduct)
        self.view.addSubview(sushiProduct)
        
        let inset: CGFloat = 16
        
        NSLayoutConstraint.activate([
            pizzaProduct.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: inset),
            pizzaProduct.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: inset),
            pizzaProduct.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -inset),
            pizzaProduct.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        NSLayoutConstraint.activate([
            sushiProduct.topAnchor.constraint(equalTo: pizzaProduct.bottomAnchor, constant: inset),
            sushiProduct.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: inset),
            sushiProduct.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -inset),
            sushiProduct.heightAnchor.constraint(equalToConstant: 100)
        ])
    }


}
