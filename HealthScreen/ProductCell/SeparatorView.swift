//
//  SeparatorView.swift
//  HealthScreen
//
//  Created by Anton Fomkin on 17.12.2019.
//  Copyright © 2019 Anton Fomkin. All rights reserved.
//

import UIKit

final class SeparatorView: UIView {
    
    private(set) lazy var image: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "arrows.png")
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addImage()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addImage()
    }
    
    private func addImage() {
        
        self.addSubview(self.image)
        NSLayoutConstraint.activate([
            self.image.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.image.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.image.heightAnchor.constraint(equalToConstant: 10.0),
            self.image.widthAnchor.constraint(equalToConstant: 10.0)
        ])
    }
    
    override func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else { return }
        context.setFillColor(UIColor.lightGray.cgColor)
        context.fill(CGRect(x: 0, y: self.frame.height/2, width: self.frame.width, height: 1))
    }
    
}
