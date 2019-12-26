//
//  DietChoices.swift
//  HealthScreen
//
//  Created by Anton Fomkin on 15.12.2019.
//  Copyright © 2019 Anton Fomkin. All rights reserved.
//

import UIKit

final class DietChoices: UIView {

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        self.layer.cornerRadius = 10
        self.layer.backgroundColor = UIColor.lightGray.cgColor
        self.clipsToBounds = true
    }

}
