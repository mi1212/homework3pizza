//
//  ProductsViewController.swift
//  UINavigationViewController
//
//  Created by Mikhail Chuparnov on 16.01.2023.
//

import UIKit

class ProductsViewController: UIViewController {

    let pepperoniPizza = ProductView(name: "pizza pepperoni")
    
    let mushroomPizza = ProductView(name: "pizza mushroom")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemGray6
        self.title = "Food"
        setupLayout()
        setupDelegates()
    }
    
    private func setupLayout() {
        self.view.addSubview(pepperoniPizza)
        self.view.addSubview(mushroomPizza)
        
        let inset: CGFloat = 16
        
        NSLayoutConstraint.activate([
            pepperoniPizza.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: inset),
            pepperoniPizza.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: inset),
            pepperoniPizza.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -inset),
            pepperoniPizza.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        NSLayoutConstraint.activate([
            mushroomPizza.topAnchor.constraint(equalTo: pepperoniPizza.bottomAnchor, constant: inset),
            mushroomPizza.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: inset),
            mushroomPizza.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -inset),
            mushroomPizza.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    private func setupDelegates() {
        pepperoniPizza.delegate = self
    }

}

extension ProductsViewController: ProductViewDelegate {
    func tapPlusButton() {
        let vc = ProductViewController()
        present(vc, animated: true)
    }
 
}
