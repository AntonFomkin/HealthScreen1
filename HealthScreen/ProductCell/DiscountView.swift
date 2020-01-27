//
//  DiscountView.swift
//  HealthScreen
//
//  Created by Anton Fomkin on 21.12.2019.
//  Copyright © 2019 Anton Fomkin. All rights reserved.
//

import UIKit

final class DiscountView: UIView {
    
    private var redraw : Bool = false {
        didSet {
            setNeedsDisplay()
        }
    }
    
    var colorModel: Bool? {
        didSet {
            switch self.colorModel {
            case true:
                discountLabel.textColor = .red
                backgroundColor = .systemBackground
                layer.borderColor = UIColor.systemPink.cgColor
                layer.borderWidth = 1
            case false:
                discountLabel.textColor = .white
                backgroundColor = .systemPink
            default:
                discountLabel.textColor = UIColor.clear
                backgroundColor = UIColor.clear
            }
        }
    }
    
    private(set) lazy var discountLabel: UILabel = {
        let discountLabel = UILabel()
        discountLabel.translatesAutoresizingMaskIntoConstraints = false
        discountLabel.textColor = .red
        discountLabel.font = UIFont.boldSystemFont(ofSize: 14)
        discountLabel.numberOfLines = 0
        return discountLabel
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUIControls()
        self.clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureUIControls()
        self.clipsToBounds = true
    }
    
    private func configureUIControls() {
        self.addSubview(self.discountLabel)
        NSLayoutConstraint.activate([
            self.discountLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.discountLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
        
        redraw.toggle()
        
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        layer.cornerRadius = 16
        layer.masksToBounds = true
    }
}
