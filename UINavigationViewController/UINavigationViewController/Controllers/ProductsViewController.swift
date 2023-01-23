//
//  ProductsViewController.swift
//  UINavigationViewController
//
//  Created by Mikhail Chuparnov on 16.01.2023.
//

import UIKit

final class ProductsViewController: UIViewController {

    let pepperoniPizza = ProductView(pizza: Pizza(name: "Пепперони", imageName: "pizza pepperoni", price: 450))
    
    let mushroomPizza = ProductView(pizza: Pizza(name: "Грибная", imageName: "pizza mushroom", price: 390))
    
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
    func tapPlusButton(pizza: Pizza) {
        let vc = ProductViewController(pizza: pizza)
        vc.delegate = self
        present(vc, animated: true)
    }
}

extension ProductsViewController: ProductViewControllerDelegate {
    func presentCheckoutViewController(pizza: Pizza, adds: [String]) {
        let vc = CheckoutViewController(pizza: pizza , adds: adds)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
