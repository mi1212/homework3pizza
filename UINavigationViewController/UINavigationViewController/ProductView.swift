//
//  ProductView.swift
//  UINavigationViewController
//
//  Created by Mikhail Chuparnov on 16.01.2023.
//

import UIKit

protocol ProductViewDelegate: AnyObject {
    func tapPlusButton()
}

class ProductView: UIView {
    
    var delegate: ProductViewDelegate?

    private let image: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let plusImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.image = UIImage(systemName: "plus.app.fill")
        image.tintColor = .systemTeal
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    init(name: String) {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        setupProperts(name)
        setupLayout()
        addGesture()
    }
    
    @available (*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupProperts(_ name: String) {
        self.layer.cornerRadius = 12
        self.clipsToBounds = true
        self.backgroundColor = .white
        
        image.image = UIImage(named: name)
        label.text = name
    }
    
    private func setupLayout() {
        self.addSubview(image)
        self.addSubview(label)
        self.addSubview(plusImage)
        let inset: CGFloat = 8
        
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: self.topAnchor, constant: inset),
            image.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: inset),
            image.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -inset),
            image.widthAnchor.constraint(equalTo: self.heightAnchor),
            
        ])
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: self.topAnchor, constant: inset),
            label.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -inset),
            label.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: inset),
            label.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -inset),
        ])
        
        NSLayoutConstraint.activate([
            plusImage.topAnchor.constraint(equalTo: self.topAnchor, constant: inset*4),
            plusImage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -inset*2),
            plusImage.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -inset*4),
            plusImage.widthAnchor.constraint(equalTo: plusImage.heightAnchor),
            
        ])
    }
    
    private func addGesture() {
        let gesture:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapPizza))
        gesture.numberOfTapsRequired = 1
        plusImage.isUserInteractionEnabled = true
        plusImage.addGestureRecognizer(gesture)
    }

    @objc private func tapPizza() {
        delegate?.tapPlusButton()
    }
    
}


