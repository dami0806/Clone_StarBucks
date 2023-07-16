//
//  OtherDataManager.swift
//  Clone_Starbucks
//
//  Created by 박다미 on 2023/07/16.
//

import Foundation
import UIKit

class OtherDataManager{
    private var otherDataArray: [OtherSection] = []
    
    func makeOtherData() {
        otherDataArray = [
            OtherSection(headerTitle: nil, items: []), // 0번째 섹션
            OtherSection(headerTitle: "Pay", items: [
                OtherItem(image: UIImage(named: "add1"), text: "Item 1"),
                OtherItem(image: UIImage(named: "add1"), text: "Item 1"),
                OtherItem(image: UIImage(named: "add1"), text: "Item 1"),
                OtherItem(image: UIImage(named: "add1"), text: "Item 1")
                
            ]),
            OtherSection(headerTitle: "Order", items: [
                OtherItem(image: UIImage(named: "add1"), text: "Item 1"),
                OtherItem(image: UIImage(named: "add1"), text: "Item 1"),
                OtherItem(image: UIImage(named: "add1"), text: "Item 1")
            ]),
            OtherSection(headerTitle: "Shop", items: [
                OtherItem(image: UIImage(named: "add1"), text: "Item 1"),
                OtherItem(image: UIImage(named: "add1"), text: "Item 1"),
                OtherItem(image: UIImage(named: "add1"), text: "Item 1")
            ]),
            OtherSection(headerTitle: "Delivers", items: [
                OtherItem(image: UIImage(named: "add1"), text: "Item 1"),
                OtherItem(image: UIImage(named: "add1"), text: "Item 1"),
                OtherItem(image: UIImage(named: "add1"), text: "Item 1"),
                OtherItem(image: UIImage(named: "add1"), text: "Item 1"),
               
            ]),
            OtherSection(headerTitle: "고객지원", items: [
                OtherItem(image: UIImage(named: "add1"), text: "Item 1"),
                OtherItem(image: UIImage(named: "add1"), text: "Item 1"),
                OtherItem(image: UIImage(named: "add1"), text: "Item 1"),
                OtherItem(image: UIImage(named: "add1"), text: "Item 1"),
                OtherItem(image: UIImage(named: "add1"), text: "Item 1")
            ]),
            
            
            
        ] }
    
    func getOtherData() -> [OtherSection] {
        
        
        return otherDataArray
    }
}
