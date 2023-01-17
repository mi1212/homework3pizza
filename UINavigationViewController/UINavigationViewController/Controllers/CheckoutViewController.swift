//
//  CheckoutViewController.swift
//  UINavigationViewController
//
//  Created by Mikhail Chuparnov on 17.01.2023.
//

import UIKit

class CheckoutViewController: UIViewController {

    init(pizza: Pizza, adds: [String]) {
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = .systemGray6
        
    }
    
    @available (*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
 

}
