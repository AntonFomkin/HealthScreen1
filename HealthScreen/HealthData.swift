//
//  HealthData.swift
//  HealthScreen
//
//  Created by Anton Fomkin on 12.12.2019.
//  Copyright © 2019 Anton Fomkin. All rights reserved.
//

import UIKit

final class HealthData {
    
    enum TypeOfDate: String {
        case long =  "yyyy-MM-dd HH:mm:ss"
        case short = "yyyy-MM-dd"
        case currentMonth = "MM"
        case monthsList = "LLLL"
    }
    
    var months: [String] = []
    let dietList: [String] = ["Средиземноморская","Скандинавская","Рыбная"]
    var productList: [ProductModel] = []
    var currentMonths: Int?
    var widthText: [CGFloat] = []
    let dateFormatter = DateFormatter()
    
    init() {
        

    productList.append(ProductModel(productImage: UIImage(named: "pizza.jpg")!, productName: "Пицца", producerImage: UIImage(named: "orange.png")!, producer: "Апельсин", oldPrice: 200000.12, newPrice: 189.21, discount: 24, discountColorModel: true, lineColor: UIColor.red))
    productList.append(ProductModel(productImage: UIImage(named: "roll.jpg")!, productName: "Роллы", producerImage: UIImage(named: "orange.png")!, producer: "Апельсин", oldPrice: 230.11, newPrice: 190.18, discount: 10, discountColorModel: false, lineColor: UIColor.purple))
    productList.append(ProductModel(productImage: UIImage(named: "salat.jpg")!, productName: "Салат", producerImage: UIImage(named: "orange.png")!, producer: "Апельсин", oldPrice: 250.65, newPrice: 237.43, discount: 17, discountColorModel: nil, lineColor: UIColor.brown))
  
        
        DispatchQueue.global().async { [weak self] in
            self?.dateFormatter.locale = Locale(identifier: "ru_RU")
            self?.currentMonths = Int(self!.getCurrentDate(dateFormat: .currentMonth))
            self?.getMonthsList(dateFormat: .monthsList)
            
            self?.widthText = []
            for (index,_) in self!.months.enumerated() {
                self?.widthText.append(getWidthText(text: self!.months[index], font: UIFont.boldSystemFont(ofSize: 21)))
            }
        }
    }
    
    private func getCurrentDate(dateFormat: TypeOfDate) -> String {
   
            let date = Date()
            self.dateFormatter.dateFormat = dateFormat.rawValue
            return dateFormatter.string(from: date)
    }
    
    private func getMonthsList(dateFormat: TypeOfDate) -> Void {

            self.dateFormatter.dateFormat = dateFormat.rawValue
            self.months = self.dateFormatter.standaloneMonthSymbols
            
            for (index,_) in self.months.enumerated() {
                self.months[index] = self.months[index].capitalized
            }
        
    }    
}
