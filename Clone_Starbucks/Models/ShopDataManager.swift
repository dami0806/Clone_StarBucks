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
    
    func makeCardsData() {
        shopDataArray = [
                ShopSection(headerTitle: nil, headerButtonTitle: nil, items: [
                    ShopItem(image: UIImage(named: "음료"), text: "Item 1"),
                    ShopItem(image: UIImage(named: "음료"), text: "Item 2"),
                    ShopItem(image: UIImage(named: "음료"), text: "Item 3"),
                    ShopItem(image: UIImage(named: "음료"), text: "Item 4"),
                    ShopItem(image: UIImage(named: "음료"), text: "Item 5")
                ]),
                ShopSection(headerTitle: "Section 1 Header", headerButtonTitle: "Button", items: [
                    ShopItem(image: UIImage(named: "음료"), text: "Item 1"),
                    ShopItem(image: UIImage(named: "음료"), text: "Item 2"),
                    ShopItem(image: UIImage(named: "음료"), text: "Item 3"),
                    ShopItem(image: UIImage(named: "음료"), text: "Item 4"),
                    ShopItem(image: UIImage(named: "음료"), text: "Item 5"),
                    ShopItem(image: UIImage(named: "음료"), text: "Item 6"),
                    ShopItem(image: UIImage(named: "음료"), text: "Item 7"),
                    ShopItem(image: UIImage(named: "음료"), text: "Item 8"),
                    ShopItem(image: UIImage(named: "음료"), text: "Item 9"),
                    ShopItem(image: UIImage(named: "음료"), text: "Item 10")
                ]),
                ShopSection(headerTitle: "Section 2 Header", headerButtonTitle: "Button", items: [
                    ShopItem(image: UIImage(named: "음료"), text: "Item 1"),
                    ShopItem(image: UIImage(named: "음료"), text: "Item 2")
                ]),
                ShopSection(headerTitle: "Section 3 Header", headerButtonTitle: "Button", items: [
                    ShopItem(image: UIImage(named: "음료"), text: "Item 1"),
                    ShopItem(image: UIImage(named: "음료"), text: "Item 2"),
                    ShopItem(image: UIImage(named: "음료"), text: "Item 3"),
                    ShopItem(image: UIImage(named: "음료"), text: "Item 4")
                ]),
                ShopSection(headerTitle: "Section 4 Header", headerButtonTitle: "Button", items: [
                    ShopItem(image: UIImage(named: "음료"), text: "Item 1"),
                    ShopItem(image: UIImage(named: "음료"), text: "Item 2"),
                    ShopItem(image: UIImage(named: "음료"), text: "Item 3"),
                    ShopItem(image: UIImage(named: "음료"), text: "Item 4")
                ])
            ]
    }
    
    func getShopData() -> [ShopSection] {
        // print(cardsDataArray)
        
        return shopDataArray
    }
    
    
}
