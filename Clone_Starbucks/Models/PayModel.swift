//
//  PayModel.swift
//  Clone_Starbucks
//
//  Created by 박다미 on 2023/06/29.
//

import Foundation
import UIKit
struct Drinks{
    let drinkImage: UIImage
    let drinkKo: String
    let drinkEn: String
    let detail: String
    let price: Int
    let ice: Bool
    
}
struct Cards{
    let cardImage:UIImage
    let cardName: String
    var point: Int
    var cardNum: String
    
}
struct Foods{
    let foodsImage: UIImage
    let foodsKo: String
    let foodsEn: String
    let detail: String
    let price: Int
  
    
}
struct Goods{
    let kindImage: UIImage
    let kindKo: String
    let kindEn: String

    
}
struct DetailGoods{
    let goodsImage: UIImage
    let goodsKo: String
    let goodsEn: String
    let detail: String
    let price: Int
}
