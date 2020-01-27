//
//  LikeControl.swift
//  HealthScreen
//
//  Created by Anton Fomkin on 21.12.2019.
//  Copyright © 2019 Anton Fomkin. All rights reserved.
//

import UIKit

final class LikeControl: UIControl {
   
    var isLiked: Bool = false
    
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
        DispatchQueue.main.async { [weak self] in
            self?.addTarget(self, action: #selector(self?.selectLike), for: .touchUpInside)
            self?.backgroundColor = UIColor.clear
            self?.layer.cornerRadius = min((self?.bounds.height)!, (self?.bounds.width)!) / 5
            self?.clipsToBounds = true
        }
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)

        // MARK: Рисуем сердечко
        let sideOne = rect.height * 0.4
        let sideTwo = rect.height * 0.3
        let arcRadius = sqrt(sideOne*sideOne + sideTwo*sideTwo)/2
        
        let path = UIBezierPath()
        
        path.addArc(withCenter: CGPoint(x: rect.height * 0.3, y: rect.height * 0.35), radius: arcRadius, startAngle: 135.degreesToRadians, endAngle: 315.degreesToRadians, clockwise: true)
        path.addArc(withCenter: CGPoint(x: rect.height * 0.7, y: rect.height * 0.35), radius: arcRadius, startAngle: 225.degreesToRadians, endAngle: 45.degreesToRadians, clockwise: true)
        path.addLine(to: CGPoint(x: rect.height * 0.5, y: rect.height * 0.95))
        
        path.close()
        
        UIColor.brown.setStroke()
        UIColor.brown.setFill()
        // MARK: Запуск анимации по условию
        if self.isLiked {
            
            UIColor.systemPink.setStroke()
            UIColor.systemPink.setFill()
            path.fill()
            let animation = CABasicAnimation(keyPath: #keyPath(CALayer.opacity))
            animation.beginTime = CACurrentMediaTime()
            animation.fromValue = 0.5
            animation.toValue = 0.2
            animation.duration = 0.5
            animation.autoreverses = true
            self.layer.add(animation, forKey: nil)
        } else {
            path.stroke()
        }
    }
    
    
    func deselectLike() {
        self.isLiked = false
        self.setNeedsDisplay()
    }

    //MARK: Обработка нажатия
    @objc private func selectLike() {
        self.isLiked.toggle()
        self.sendActions(for: .valueChanged)
        self.setNeedsDisplay()
    }
}






