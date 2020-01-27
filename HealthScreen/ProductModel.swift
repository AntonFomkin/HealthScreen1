//
//  ProductModel.swift
//  HealthScreen
//
//  Created by Anton Fomkin on 16.12.2019.
//  Copyright © 2019 Anton Fomkin. All rights reserved.
//

import UIKit

final class ProductModel {

    let isLiked: Bool = false
    let productImage: UIImage
    let productName: String
    let producerImage: UIImage
    let producer: String
    let oldPrice: Double?
    let newPrice: Double?
    let discount: Int?
    let discountColorModel: Bool?
    let lineColor: UIColor?
    
    init(productImage: UIImage,
         productName: String,
         producerImage: UIImage,
         producer: String,
         oldPrice: Double?,
         newPrice: Double?,
         discount: Int?,
         discountColorModel: Bool?,
         lineColor: UIColor) {
        
        self.productImage = productImage
        self.productName = productName
        self.producerImage = producerImage
        self.producer = producer
        self.oldPrice = oldPrice
        self.newPrice = newPrice
        self.discount = discount
        self.discountColorModel = discountColorModel
        self.lineColor = lineColor
    }
}
