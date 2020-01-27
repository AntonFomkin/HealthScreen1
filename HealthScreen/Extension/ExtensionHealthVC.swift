//
//  ExtensionHealthVC.swift
//  HealthScreen
//
//  Created by Anton Fomkin on 17.12.2019.
//  Copyright © 2019 Anton Fomkin. All rights reserved.
//

import UIKit

extension HealthVewController {
    
    func configureUIControls() {
        
        self.view.addSubview(scrollView)

        scrollView.contentSize = self.view.bounds.size
        scrollView.autoresizingMask = .flexibleHeight
        
        NSLayoutConstraint.activate([
            self.scrollView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 10.0),
            self.scrollView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0.0),
            self.scrollView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0.0),
            self.scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0.0),
        ])
     
        /* MonthsMenu*/
        let heightMonthsMenu: CGFloat = 27.0
        scrollView.addSubview(monthsMenu)
        
        NSLayoutConstraint.activate([
            self.monthsMenu.topAnchor.constraint(equalTo: self.scrollView.topAnchor, constant: 10.0),
            self.monthsMenu.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 5.0),
            self.monthsMenu.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -5.0),
            self.monthsMenu.heightAnchor.constraint(equalToConstant: heightMonthsMenu),
            self.monthsMenu.widthAnchor.constraint(equalToConstant: self.scrollView.contentSize.width - 10.0)
        ])
        
        
        /* End MonthsMenu*/
    
        
        /* DietChoices*/
        let heightDietChoicesView: CGFloat = 70.0
         
        self.dietChoices.addSubview(self.dietTitle)
        NSLayoutConstraint.activate([
            self.dietTitle.topAnchor.constraint(equalTo: self.dietChoices.topAnchor, constant: 5.0),
            self.dietTitle.leftAnchor.constraint(equalTo: self.dietChoices.leftAnchor, constant: 5.0),
        ])
        
        self.dietChoices.addSubview(self.dietName)
        NSLayoutConstraint.activate([
            self.dietName.bottomAnchor.constraint(equalTo: self.dietChoices.bottomAnchor, constant: -15.0),
            self.dietName.leftAnchor.constraint(equalTo: self.dietChoices.leftAnchor, constant: 5.0),
        ])
        self.dietChoices.addSubview(self.dietSelector)
        NSLayoutConstraint.activate([
            self.dietSelector.heightAnchor.constraint(equalToConstant: 20),
            self.dietSelector.widthAnchor.constraint(equalToConstant: 20),
            self.dietSelector.topAnchor.constraint(equalTo: dietChoices.topAnchor, constant: heightDietChoicesView / 2 - 10),
            self.dietSelector.rightAnchor.constraint(equalTo: self.dietChoices.rightAnchor, constant: -20.0)
        ])
       
        scrollView.addSubview(dietChoices)
        NSLayoutConstraint.activate([
            self.dietChoices.topAnchor.constraint(equalTo: self.monthsMenu.bottomAnchor, constant: 5.0),
            self.dietChoices.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 5.0),
            self.dietChoices.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -5.0),
            self.dietChoices.heightAnchor.constraint(equalToConstant: heightDietChoicesView),
            self.dietChoices.widthAnchor.constraint(equalToConstant: self.scrollView.contentSize.width - 10)
        ])

        /* End DietChoices*/
        
        /* Recommendation*/
        let heightRecommendationView: CGFloat = 60.0
       
        self.recommendation.addSubview(self.recomTitle)
        NSLayoutConstraint.activate([
            self.recomTitle.topAnchor.constraint(equalTo: recommendation.topAnchor, constant: 10),
            self.recomTitle.leftAnchor.constraint(equalTo: self.recommendation.leftAnchor, constant: 5.0)
        ])
        
        self.recommendation.addSubview(self.recomDescr)
        NSLayoutConstraint.activate([
             self.recomDescr.topAnchor.constraint(equalTo: recomTitle.bottomAnchor, constant: 5.0),
             self.recomDescr.leftAnchor.constraint(equalTo: self.recommendation.leftAnchor, constant: 5.0),
             self.recomDescr.bottomAnchor.constraint(equalTo: self.recommendation.bottomAnchor, constant: -10.0)
         ])
        
        scrollView.addSubview(recommendation)
        NSLayoutConstraint.activate([
            self.recommendation.topAnchor.constraint(equalTo: self.dietChoices.bottomAnchor, constant: 0.0),
            self.recommendation.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 5.0),
            self.recommendation.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -5.0),
            self.recommendation.heightAnchor.constraint(equalToConstant: heightRecommendationView),
            self.recommendation.widthAnchor.constraint(equalToConstant: self.scrollView.contentSize.width - 10)
        ])

        /* End Recommendation*/
        
        /* ProductChoices*/
        let heightProductChoices: CGFloat = 300.0
        scrollView.addSubview(productMenu)
        
        NSLayoutConstraint.activate([
            self.productMenu.topAnchor.constraint(equalTo: self.recommendation.bottomAnchor, constant: 0.0),
            self.productMenu.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 5.0),
            self.productMenu.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -5.0),
            self.productMenu.heightAnchor.constraint(equalToConstant: heightProductChoices),
            self.productMenu.widthAnchor.constraint(equalToConstant: self.scrollView.contentSize.width - 10.0)
        ])
        /* End ProductChoices*/
      
        scrollView.addSubview(self.infoLabel)
        NSLayoutConstraint.activate([
            self.infoLabel.topAnchor.constraint(equalTo: self.productMenu.bottomAnchor, constant: 10.0),
            self.infoLabel.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 10.0)
        ])
        
        let heightInfoBoardOne: CGFloat = 40.0
        scrollView.addSubview(self.infoBoardOne)
        NSLayoutConstraint.activate([
            self.infoBoardOne.topAnchor.constraint(equalTo: self.infoLabel.bottomAnchor, constant: 3.0),
            self.infoBoardOne.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 5.0),
            self.infoBoardOne.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -5.0),
            self.infoBoardOne.heightAnchor.constraint(equalToConstant: heightInfoBoardOne),
            self.infoBoardOne.widthAnchor.constraint(equalToConstant: self.scrollView.contentSize.width - 10)
        ])
        
        scrollView.addSubview(self.infoBoardTwo)
        NSLayoutConstraint.activate([
            self.infoBoardTwo.topAnchor.constraint(equalTo: self.infoBoardOne.bottomAnchor, constant: 3.0),
            self.infoBoardTwo.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 5.0),
            self.infoBoardTwo.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -5.0),
            self.infoBoardTwo.heightAnchor.constraint(equalToConstant: heightInfoBoardOne),
            self.infoBoardTwo.widthAnchor.constraint(equalToConstant: self.scrollView.contentSize.width - 10)
        ])
        
        scrollView.addSubview(self.infoBoardThree)
        NSLayoutConstraint.activate([
            self.infoBoardThree.topAnchor.constraint(equalTo: self.infoBoardTwo.bottomAnchor, constant: 3.0),
            self.infoBoardThree.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 5.0),
            self.infoBoardThree.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -5.0),
            self.infoBoardThree.heightAnchor.constraint(equalToConstant: heightInfoBoardOne),
            self.infoBoardThree.widthAnchor.constraint(equalToConstant: self.scrollView.contentSize.width - 10),
           // self.infoBoardThree.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor, constant: -10.0),
        ])
        
    }
}
