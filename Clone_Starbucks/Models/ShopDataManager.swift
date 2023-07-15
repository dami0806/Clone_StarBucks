//
//  ShopDataManager.swift
//  Clone_Starbucks
//
//  Created by 박다미 on 2023/07/09.
//

import Foundation
import UIKit

class ShopDataManager{
    private var shopDataArray: [ShopSection] = []
    
    func makeShopData() {
        shopDataArray = [
                ShopSection(headerTitle: nil, headerButtonTitle: nil, items: [
                    ShopItem(image: UIImage(named: "add1"), text: "Item 1"),
                    ShopItem(image: UIImage(named: "add1"), text: "Item 2"),
                    ShopItem(image: UIImage(named: "add1"), text: "Item 3"),
                    ShopItem(image: UIImage(named: "add1"), text: "Item 4"),
                    ShopItem(image: UIImage(named: "add1"), text: "Item 5"),
                    ShopItem(image: UIImage(named: "add1"), text: "Item 5")
                ]),
                ShopSection(headerTitle: "All Products", headerButtonTitle: UIImage(systemName: "chevron.right"), items: [
                    ShopItem(image: UIImage(named: "음료"), text: "케이크"),
                    ShopItem(image: UIImage(named: "음료"), text: "텀플러/보온병"),
                    ShopItem(image: UIImage(named: "음료"), text: "머그/컵"),
                    ShopItem(image: UIImage(named: "음료"), text: "라이프스타일"),
                    ShopItem(image: UIImage(named: "음료"), text: "티/커피용품"),
                    ShopItem(image: UIImage(named: "음료"), text: "세트"),
                    ShopItem(image: UIImage(named: "음료"), text: "스낵")
                 
                ]),
                ShopSection(headerTitle: "Mobile Gifts", headerButtonTitle: UIImage(systemName: "chevron.right"), items: [
                    ShopItem(image: UIImage(named: "giftitem"), text: "Item 1"),
                    ShopItem(image: UIImage(named: "giftcard"), text: "Item 2")
                ]),
                ShopSection(headerTitle: "Best Items", headerButtonTitle: UIImage(systemName: "chevron.right"), items: [
                    ShopItem(image: UIImage(named: "음료"), text: "Item 1"),
                    ShopItem(image: UIImage(named: "음료"), text: "Item 2"),
                    ShopItem(image: UIImage(named: "음료"), text: "Item 3"),
                    ShopItem(image: UIImage(named: "음료"), text: "Item 4")
                ]),
                ShopSection(headerTitle: "New Products", headerButtonTitle: UIImage(systemName: "chevron.right"), items: [
                    ShopItem(image: UIImage(named: "음료"), text: "Item 1"),
                    ShopItem(image: UIImage(named: "음료"), text: "Item 2"),
                    ShopItem(image: UIImage(named: "음료"), text: "Item 3"),
                    ShopItem(image: UIImage(named: "음료"), text: "Item 4")
                ])
            ]
    }
    
    func getShopData() -> [ShopSection] {
       
        
        return shopDataArray
    }
    
    
}

