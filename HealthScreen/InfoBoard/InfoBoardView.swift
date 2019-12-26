//
//  InfoBoardView.swift
//  HealthScreen
//
//  Created by Anton Fomkin on 23.12.2019.
//  Copyright © 2019 Anton Fomkin. All rights reserved.
//

import UIKit

final class InfoBoardView: UIView {
    
    var redraw : Bool = false {
        didSet {
            setNeedsDisplay()
        }
    }
    
    private enum LevelComponents: String {
        case little = "Недостаточно"
        case sufficiently = "Достаточно"
        case overmuch = "Слишком много"
    }
    
    private var targetComponents: String
    private var targetValue: Int
    private var currentValue: Int
    
    private lazy var nameLabelWidthValue = NSLayoutConstraint()
    private lazy var nameLabelTopValue = NSLayoutConstraint()
    private lazy var indicatorXPos: CGFloat = 0.0
    private lazy var indicatorYPos: CGFloat = 0.0
    private lazy var indicatorWidth: CGFloat = 0.0
    private lazy var widthIndicatorCurrentValue: CGFloat = 0.0
    private lazy var indicatorColor: UIColor = UIColor.systemBackground
    private var level: LevelComponents?
    private lazy var currentValueLabelLeft = NSLayoutConstraint()
    
    private(set) lazy var nameLabel: UILabel = {
        let addLabel = UILabel()
        addLabel.translatesAutoresizingMaskIntoConstraints = false
        addLabel.textColor = .black
        addLabel.text = targetComponents
        addLabel.font = UIFont.boldSystemFont(ofSize: 16)
        addLabel.numberOfLines = 0
        return addLabel
    }()
    
    private(set) lazy var target: UILabel = {
        let addLabel = UILabel()
        addLabel.translatesAutoresizingMaskIntoConstraints = false
        addLabel.textColor = .black
        addLabel.text = "Цель \(targetValue)%"
        addLabel.font = UIFont.boldSystemFont(ofSize: 12)
        addLabel.numberOfLines = 0
        return addLabel
    }()
    
    private(set) lazy var descriptionTarget: UILabel = {
        let descriptionTarget  = UILabel()
        descriptionTarget.translatesAutoresizingMaskIntoConstraints = false
        descriptionTarget.textColor = .black
        descriptionTarget.font = UIFont.boldSystemFont(ofSize: 12)
        descriptionTarget.numberOfLines = 0
        return descriptionTarget
    }()
    
    private(set) lazy var currentValueLabel: UILabel = {
        let currentValueLabel = UILabel()
        currentValueLabel.translatesAutoresizingMaskIntoConstraints = false
        currentValueLabel.textColor = .black
        currentValueLabel.text = "\(currentValue)%"
        currentValueLabel.font = UIFont.boldSystemFont(ofSize: 12)
        currentValueLabel.numberOfLines = 0
        return currentValueLabel
    }()
    
    
    init (targetComponents: String, targetValue: Int, currentValue: Int) {
        self.targetComponents = targetComponents
        self.targetValue = targetValue
        self.currentValue = currentValue
        super.init(frame: UIScreen.main.bounds)
        configureUIControls()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUIControls() {
        
        self.addSubview(self.nameLabel)
        self.addSubview(self.target)
        self.addSubview(self.descriptionTarget)
        self.addSubview(self.currentValueLabel)
        
            self.nameLabelTopValue = self.nameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 3.0)
            self.nameLabelTopValue.isActive = true
            self.nameLabelWidthValue = self.nameLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 5.0)
            self.nameLabelWidthValue.isActive = true
        
        
        NSLayoutConstraint.activate([
            self.target.topAnchor.constraint(equalTo: self.nameLabel.bottomAnchor, constant: 3.0),
            self.target.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 5.0)
        ])
        
        indicatorXPos = 100//getWidthText(text: nameLabel.text!, font: nameLabel.font) + nameLabelWidthValue.constant * 5
        
        
        
        switch currentValue {
        case targetValue:
            level = .sufficiently
            indicatorColor = UIColor.systemGreen
        case 0...targetValue:
            level = .little
            indicatorColor = UIColor.systemOrange
        case targetValue...100:
            level = .overmuch
            indicatorColor = UIColor.systemPink
        default:
            break
        }
        
        descriptionTarget.text = level?.rawValue
        descriptionTarget.textColor = indicatorColor
        
        NSLayoutConstraint.activate([
            self.descriptionTarget.topAnchor.constraint(equalTo: self.nameLabel.bottomAnchor, constant: 3.0),
            self.descriptionTarget.leftAnchor.constraint(equalTo: self.leftAnchor, constant: indicatorXPos)
        ])
        
    }
    
    
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        indicatorYPos = nameLabelTopValue.constant + getHeightText(text: nameLabel.text!, font: nameLabel.font)/2
        indicatorWidth = self.frame.width - indicatorXPos - nameLabelWidthValue.constant * 5
        widthIndicatorCurrentValue = ceil(indicatorWidth * (CGFloat(currentValue) / 100.0))
        
        
        
        self.currentValueLabel.topAnchor.constraint(equalTo: self.nameLabel.bottomAnchor, constant: 3.0).isActive = true
        
        currentValueLabelLeft.isActive = false
        currentValueLabelLeft = self.currentValueLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: (indicatorXPos + widthIndicatorCurrentValue))
        currentValueLabelLeft.isActive = true
        
        layer.cornerRadius = 10
        layer.masksToBounds = true
        
        guard let context = UIGraphicsGetCurrentContext() else { return }
        context.setFillColor(UIColor.lightGray.cgColor)
        context.fill(CGRect(x: indicatorXPos,
                            y: indicatorYPos,
                            width: indicatorWidth,
                            height: 3))
        
        
        
        context.setFillColor(indicatorColor.cgColor)
        context.fill(CGRect(x: indicatorXPos,
                            y: indicatorYPos,
                            width: widthIndicatorCurrentValue,
                            height: 3))
        
        
        context.setFillColor(indicatorColor.cgColor)
        context.fillEllipse(in: CGRect(x: indicatorXPos + widthIndicatorCurrentValue,
                                       y: indicatorYPos - 7,
                                       width: 15,
                                       height: 15))
        
        context.setFillColor(UIColor.systemBackground.cgColor)
        context.fillEllipse(in: CGRect(x: indicatorXPos + widthIndicatorCurrentValue + 2.5,
                                       y: indicatorYPos - 4.5,
                                       width: 10,
                                       height: 10))
        
    }
    
}

