//
//  ProductView.swift
//  UINavigationViewController
//
//  Created by Mikhail Chuparnov on 16.01.2023.
//

import UIKit

class ProductView: UIView {

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
    
    private let chectoutImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.image = UIImage(systemName: "cart")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    init(name: String) {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        setupProperts(name)
        setupLayout()
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
        self.addSubview(chectoutImage)
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
//            label.widthAnchor.constraint(equalTo: self.heightAnchor),
        ])
        
        NSLayoutConstraint.activate([
            chectoutImage.topAnchor.constraint(equalTo: self.topAnchor, constant: inset*4),
            chectoutImage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: inset*2),
            chectoutImage.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -inset*4),
            chectoutImage.widthAnchor.constraint(equalTo: self.heightAnchor),
            
        ])
    }
    
}
