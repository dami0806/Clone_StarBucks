//
//  ShopModel.swift
//  Clone_Starbucks
//
//  Created by 박다미 on 2023/07/09.
//

import Foundation
import UIKit

struct ShopItem{
    let image: UIImage?
    let text: String
}
struct ShopSection{
    let headerTitle :String?
    let headerButtonTitle:UIImage?
    let items: [ShopItem]
}
