//
//  LineView.swift
//  HealthScreen
//
//  Created by Anton Fomkin on 09.12.2019.
//  Copyright © 2019 Anton Fomkin. All rights reserved.
//

import UIKit

final class LineView: UIView {
    
    let defaultColor: UIColor = .white
    let selectedColor: UIColor = .darkMint

    var redraw : Bool = false {
        didSet {
            setNeedsDisplay() 
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.clipsToBounds = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.clipsToBounds = true
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        self.layer.cornerRadius = 2.5
        
        var color = defaultColor
        if self.redraw == false {
            color = self.defaultColor
        } else  {
            color = self.selectedColor
        }

        guard let context = UIGraphicsGetCurrentContext() else { return }
        context.setFillColor(color.cgColor)
        context.fill(CGRect(x: 0, y: 0, width: self.frame.width, height: 3))
        
    }
}
