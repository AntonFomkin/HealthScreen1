//
//  ProductCell.swift
//  HealthScreen
//
//  Created by Anton Fomkin on 16.12.2019.
//  Copyright © 2019 Anton Fomkin. All rights reserved.
//

import UIKit

final class ProductCell: UICollectionViewCell {
    
    static let reuseID = "ProductCell"
    var onShoppingBasketPressed: ( () -> () )?
    var onAddProductPressed: ( () -> () )?
    var onLikePressed: ( () -> () )?
    
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var producerImage: UIImageView!
    @IBOutlet weak var producerName: UILabel!
    @IBOutlet weak var separator: UIView!
    @IBOutlet weak var oldPrice: OldPriceView!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var shoppingBasket: UIButton!
    @IBOutlet weak var addProduct: AddProductControll!
    @IBOutlet weak var like: LikeControl!
    @IBOutlet weak var discount: DiscountView!
    
    var bottomLineColor: UIColor = .white
    
    var redraw : Bool = false {
        didSet {
            setNeedsDisplay()
        }
    }
    
    @IBAction func shoppingBasketPressed(_ sender: Any) {
        onShoppingBasketPressed!()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.configureUIControls()
        addProduct.addTarget(self, action: #selector(addProductDidTapped), for: .valueChanged)
        like.addTarget(self, action: #selector(likeTapped), for: .valueChanged)
    }
    
    @objc func addProductDidTapped() {
        onAddProductPressed!()
    }
    
    @objc func likeTapped() {
        onLikePressed!()
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        productImage.layer.cornerRadius = min(productImage.bounds.height, productImage.bounds.width) / 7 
        guard let context = UIGraphicsGetCurrentContext() else { return }
        context.setFillColor(bottomLineColor.cgColor)
        context.fill(CGRect(x: 5, y: self.frame.height-3, width: self.frame.width-5, height: 2))
    }
    
    override func prepareForReuse() {
        [self.productName, self.producerName, self.price, self.discount.discountLabel].forEach { $0.text = nil }
        self.productImage.image = nil
        self.producerImage.image = nil
        self.oldPrice.redraw = false
        self.like.isLiked = false
    }
    
    
    private func configureUIControls() {
        productImage.translatesAutoresizingMaskIntoConstraints = false
        productName.translatesAutoresizingMaskIntoConstraints = false
        producerImage.translatesAutoresizingMaskIntoConstraints = false
        producerName.translatesAutoresizingMaskIntoConstraints = false
        separator.translatesAutoresizingMaskIntoConstraints = false
        oldPrice.translatesAutoresizingMaskIntoConstraints = false
        price.translatesAutoresizingMaskIntoConstraints = false
        shoppingBasket.translatesAutoresizingMaskIntoConstraints = false
        addProduct.translatesAutoresizingMaskIntoConstraints = false
        like.translatesAutoresizingMaskIntoConstraints = false
        discount.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.productImage.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 12.0),
            self.productImage.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 12.0),
            self.productImage.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -20.0),
            self.productImage.heightAnchor.constraint(equalToConstant: self.contentView.frame.height/3.0),
            self.productImage.widthAnchor.constraint(equalToConstant: self.contentView.frame.width - 24.0)
        ])
        
        NSLayoutConstraint.activate([
            self.like.heightAnchor.constraint(equalToConstant: 20.0),
            self.like.widthAnchor.constraint(equalToConstant: 20.0),
            self.like.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10.0),
            self.like.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -5.0)
        ])
        
        NSLayoutConstraint.activate([
            self.discount.heightAnchor.constraint(equalToConstant: 30.0),
            self.discount.widthAnchor.constraint(equalToConstant: 60.0),
            self.discount.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 0 ),
            self.discount.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 5)
        ])
        
        NSLayoutConstraint.activate([
            self.addProduct.heightAnchor.constraint(equalToConstant: 50.0),
            self.addProduct.widthAnchor.constraint(equalToConstant: 50.0),
            self.addProduct.topAnchor.constraint(equalTo: self.productImage.bottomAnchor, constant: -self.addProduct.frame.height/2),
            self.addProduct.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: 0)
        ])
        
        NSLayoutConstraint.activate([
            self.productName.topAnchor.constraint(equalTo: self.productImage.bottomAnchor, constant: 5.0),
            self.productName.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 12.0),
            self.productName.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -12.0)
        ])
        
        NSLayoutConstraint.activate([
            self.producerImage.topAnchor.constraint(equalTo: self.productName.bottomAnchor, constant: 15.0),
            self.producerImage.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 12.0),
            self.producerImage.heightAnchor.constraint(equalToConstant: 15),
            self.producerImage.widthAnchor.constraint(equalToConstant: 15)
            
        ])
        
        NSLayoutConstraint.activate([
            self.producerName.topAnchor.constraint(equalTo: self.productName.bottomAnchor, constant: 15.0),
            self.producerName.leftAnchor.constraint(equalTo: self.producerImage.leftAnchor, constant: 20.0),
            self.producerName.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -5.0)
        ])
        
        NSLayoutConstraint.activate([
            self.separator.topAnchor.constraint(equalTo: self.producerImage.bottomAnchor, constant: 0.0),
            self.separator.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 5.0),
            self.separator.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -5.0),
            self.separator.heightAnchor.constraint(equalToConstant: 10),
            self.separator.widthAnchor.constraint(equalToConstant: self.contentView.frame.width - 10)
        ])
        
        
        let oldPriceTopValue = self.oldPrice.topAnchor.constraint(equalTo: self.separator.bottomAnchor, constant: 5.0)
        oldPriceTopValue.isActive = true
        self.oldPrice.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 2.0).isActive = true
        self.oldPrice.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: 5.0).isActive = true
        let oldPriceHeightValue = self.oldPrice.heightAnchor.constraint(equalToConstant: 20.0)
        oldPriceHeightValue.isActive = true
        
        
        let priceTopValue = self.price.topAnchor.constraint(equalTo: self.oldPrice.bottomAnchor, constant: 5.0)
        priceTopValue.isActive = true
        self.price.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 5.0).isActive = true
        self.price.heightAnchor.constraint(equalToConstant: 30.0).isActive = true
        self.price.widthAnchor.constraint(equalToConstant: 150.0).isActive = true
        
        
        NSLayoutConstraint.activate([
            self.shoppingBasket.topAnchor.constraint(equalTo: self.separator.bottomAnchor, constant: oldPriceTopValue.constant + oldPriceHeightValue.constant + priceTopValue.constant),
            self.shoppingBasket.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -10.0),
            self.shoppingBasket.heightAnchor.constraint(equalToConstant: 30.0),
            self.shoppingBasket.widthAnchor.constraint(equalToConstant: 30.0)
        ])
    }
    
}


