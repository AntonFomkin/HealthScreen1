//
//  ProductChoicesViewController.swift
//  HealthScreen
//
//  Created by Anton Fomkin on 16.12.2019.
//  Copyright © 2019 Anton Fomkin. All rights reserved.
//

import UIKit

final class ProductChoicesViewController: UIViewController {
    
    private var dataModel = HealthData()
    private lazy var currencySymbol:String = {
        let currencySymbol = self.getSymbol(forCurrencyCode: "RUB")
        return currencySymbol
    }()
    
    private func getSymbol(forCurrencyCode code: String) -> String {
        let locale = NSLocale(localeIdentifier: code)
        if locale.displayName(forKey: .currencySymbol, value: code) == code {
            let newlocale = NSLocale(localeIdentifier: code.dropLast() + "_ru")
            return newlocale.displayName(forKey: .currencySymbol, value: code)!
        }
        return locale.displayName(forKey: .currencySymbol, value: code)!
    }
}

extension ProductChoicesViewController: UICollectionViewDataSource {
    
    
     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
   
        return dataModel.productList.count
    }
    
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCell", for: indexPath) as! ProductCell
        configureCell(cell: cell, indexPath: indexPath)
        
        return cell
    }
 
    
    func configureCell(cell: ProductCell, indexPath: IndexPath) {
        
        DispatchQueue.main.async { [weak self] in

            cell.productImage.image = self?.dataModel.productList[indexPath.row].productImage
            cell.productName.text = self?.dataModel.productList[indexPath.row].productName
            cell.producerImage.image = self?.dataModel.productList[indexPath.row].producerImage
            cell.producerName.text = self?.dataModel.productList[indexPath.row].producer
            
            if self?.dataModel.productList[indexPath.row].oldPrice != nil {
                cell.oldPrice.oldPriceLabel.text = "\((self?.dataModel.productList[indexPath.row].oldPrice)!) \((self?.currencySymbol)!)"
                cell.oldPrice.redraw = true
            }
            
            cell.price.text = "\((self?.dataModel.productList[indexPath.row].newPrice)!) \((self?.currencySymbol)!)"
            cell.bottomLineColor = (self?.dataModel.productList[indexPath.row].lineColor)!
            
            if self?.dataModel.productList[indexPath.row].discount != nil {
                cell.discount.discountLabel.text = "\((self?.dataModel.productList[indexPath.row].discount)!) %"
                cell.discount.colorModel = self?.dataModel.productList[indexPath.row].discountColorModel
            }
            
            cell.redraw.toggle()
            cell.onShoppingBasketPressed = {
                print("ShoppingBasket Pressed")
            }
            
            cell.onAddProductPressed = {
                print("addProduct Pressed")
            }
            
            cell.onLikePressed = {
                print("Like Pressed")
            }
        }
    }
}



extension ProductChoicesViewController: UICollectionViewDelegate {

}

extension ProductChoicesViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.width / 2, height: collectionView.frame.height)
    }
    
}




