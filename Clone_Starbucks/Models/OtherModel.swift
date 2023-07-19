//
//  OtherModel.swift
//  Clone_Starbucks
//
//  Created by 박다미 on 2023/07/16.
//

import Foundation
import UIKit

struct OtherItem{
    let image: UIImage?
    let text: String
}
struct OtherSection{
    let headerTitle :String?
    let items: [OtherItem]
}
struct MembershipData {
    let imageName: String
    let mainLabelText: String
    let subLabelText: String
}
