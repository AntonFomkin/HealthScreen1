//
//  AddProductControl.swift
//  HealthScreen
//
//  Created by Anton Fomkin on 21.12.2019.
//  Copyright © 2019 Anton Fomkin. All rights reserved.
//

import UIKit

final class AddProductControll: UIControl {
    
    private(set) lazy var addLabel: UILabel = {
        let addLabel = UILabel()
        addLabel.translatesAutoresizingMaskIntoConstraints = false
        addLabel.textColor = .white
        addLabel.text = "+"
        addLabel.font = UIFont.boldSystemFont(ofSize: 26)
        addLabel.numberOfLines = 0
        return addLabel
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUIControls()
        self.clipsToBounds = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureUIControls()
        self.clipsToBounds = true
    }
    
    
    private func configureUIControls() {
        self.backgroundColor = .orange
        self.addSubview(self.addLabel)
        NSLayoutConstraint.activate([
            self.addLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.addLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
        
        self.addTarget(self, action: #selector(self.addProductPressed), for: .touchUpInside)
    }
    
    @objc func addProductPressed() {
      self.sendActions(for: .valueChanged)
    }
    
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        self.layer.cornerRadius = self.layer.bounds.width / 2
    }
}
