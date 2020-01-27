//
//  OldPriceView.swift
//  HealthScreen
//
//  Created by Anton Fomkin on 18.12.2019.
//  Copyright © 2019 Anton Fomkin. All rights reserved.
//
import UIKit
    
final class OldPriceView: UIView {
    
    private(set) lazy var oldPriceLabel: UILabel = {
        let oldPriceLabel = UILabel()
        oldPriceLabel.translatesAutoresizingMaskIntoConstraints = false
        oldPriceLabel.textColor = .gray
        oldPriceLabel.font = UIFont.boldSystemFont(ofSize: 14)
        oldPriceLabel.numberOfLines = 0
        return oldPriceLabel
    }()
       
    var redraw : Bool = false {
        didSet {
            setNeedsDisplay()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUIControls()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureUIControls()
    }
 
    private func configureUIControls() {
        
        self.addSubview(self.oldPriceLabel)
        NSLayoutConstraint.activate([
            self.oldPriceLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.oldPriceLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 3.0)
        ])
    }
    

    override func draw(_ rect: CGRect) {
        
        if self.redraw {
            let text = self.oldPriceLabel.text
            let font = UIFont.boldSystemFont(ofSize: 14)
            let width = ceil(text!.size(OfFont: font).width)
            
            guard let context = UIGraphicsGetCurrentContext() else { return }
            context.setStrokeColor(UIColor.systemPink.cgColor)
            context.move(to: CGPoint(x: 2, y: self.frame.height - self.frame.height/2.3))
            context.addLine(to: CGPoint(x: width + 4, y: self.frame.height/2.3))
            context.setLineWidth(2.0)
            context.closePath()
            context.strokePath()
        }
    }
}

