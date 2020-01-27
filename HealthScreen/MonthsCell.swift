//
//  MonthsCell.swift
//  HealthScreen
//
//  Created by Anton Fomkin on 09.12.2019.
//  Copyright © 2019 Anton Fomkin. All rights reserved.
//

import UIKit

final class MonthsCell: UICollectionViewCell {
    
    static let reuseID = "MonthsCell"
    var updateSelector: ( () -> () )?

    private(set) lazy var monthName: UILabel = {
        let monthName = UILabel()
        monthName.translatesAutoresizingMaskIntoConstraints = false
        monthName.textColor = UIColor.black.withAlphaComponent(0.3)
        monthName.font =  UIFont.fontSFProDisplayRegular16
        monthName.setCharacterSpacing(0.19)
        monthName.textAlignment = .center
        monthName.numberOfLines = 0
        return monthName
    }()
  
    private(set) lazy var monthSelector: LineView! = {
        let monthSelector = LineView()
        monthSelector.translatesAutoresizingMaskIntoConstraints = false
        return monthSelector
    }()
    
        
    override func awakeFromNib() {
        super.awakeFromNib()
        self.contentView.backgroundColor = monthSelector.defaultColor
        configureUIControls()
    }

    override func prepareForReuse() {
        monthName.textColor = UIColor.black.withAlphaComponent(0.3)
        monthName.text = nil
    }
    private func configureUIControls() {
        self.addSubview(self.monthName)
        self.addSubview(self.monthSelector)
               
        NSLayoutConstraint.activate([
            self.monthName.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 0.0),
            self.monthName.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 0.0),
            self.monthName.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: 0.0),
            self.monthName.heightAnchor.constraint(equalToConstant: 19),
            self.monthName.widthAnchor.constraint(equalToConstant: self.contentView.frame.width)
          //  self.monthName.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            self.monthSelector.topAnchor.constraint(equalTo: self.monthName.bottomAnchor, constant: 5.0),
            self.monthSelector.heightAnchor.constraint(equalToConstant: 3),
            self.monthSelector.widthAnchor.constraint(equalToConstant: self.contentView.frame.width),
            self.monthSelector.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 0.0),
            self.monthSelector.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: 0.0)
        ])
    }
    
}


