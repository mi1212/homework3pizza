//
//  LabelSwitchView.swift
//  UINavigationViewController
//
//  Created by Mikhail Chuparnov on 17.01.2023.
//

import UIKit

protocol LabelSwitchViewDelegate: AnyObject {
    func add(name: String)
    func remove(name: String)
}

final class LabelSwitchView: UIView {
    
    var delegate: LabelSwitchViewDelegate? 
    
    var name: String = ""
    
    private let label: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let switcher: UISwitch = {
        let switcher = UISwitch()
        switcher.onTintColor = .systemTeal
        switcher.translatesAutoresizingMaskIntoConstraints = false
        return switcher
    }()
    
    init(name: String) {
        super.init(frame: .zero)
        label.text = name
        self.name = name
        setupLayout()
        setupTarget()
    }
    
    @available (*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        addSubview(label)
        addSubview(switcher)
        
        let inset: CGFloat = 8
        
        NSLayoutConstraint.activate([
            switcher.topAnchor.constraint(equalTo: topAnchor, constant: inset),
            switcher.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -inset),
            switcher.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -inset),
        ])
        
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: inset),
            label.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    private func setupTarget() {
        switcher.addTarget(self, action: #selector(switched), for: .valueChanged)
    }
 
    @objc private func switched() {
        switch switcher.isOn {
        case true:
            delegate?.add(name: self.name)
        case false:
            delegate?.remove(name: self.name)
        }
    }
}
