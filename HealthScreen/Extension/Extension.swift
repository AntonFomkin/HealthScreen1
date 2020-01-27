//
//  Extension.swift
//  HealthScreen
//
//  Created by Anton Fomkin on 12.12.2019.
//  Copyright © 2019 Anton Fomkin. All rights reserved.
//

import UIKit

extension String {
    func size(OfFont font: UIFont) -> CGSize {
        return (self as NSString).size(withAttributes: [NSAttributedString.Key.font: font])
    }
}

extension Int {
    var degreesToRadians: CGFloat { return CGFloat(self) * .pi / 180 }
}

extension UILabel{
    func setCharacterSpacing(_ spacing: CGFloat){
        let attributedStr = NSMutableAttributedString(string: self.text ?? "")
        attributedStr.addAttribute(NSAttributedString.Key.kern, value: spacing, range: NSMakeRange(0, attributedStr.length))
        self.attributedText = attributedStr
    }
}


func getWidthText(text: String, font: UIFont) -> CGFloat {
    let text = text
    let font = font
    return ceil(text.size(OfFont: font).width)
}

func getHeightText(text: String, font: UIFont) -> CGFloat {
    let text = text
    let font = font
    return ceil(text.size(OfFont: font).height)
}
