//
//  UIViewController.swift
//  Clone_Starbucks
//
//  Created by 박다미 on 2023/06/29.
//

import Foundation
import UIKit
extension UIViewController {
    func changeTitleMode(fontSize: Int) {
        if let scrollView = self.view.subviews.first(where: { $0 is UIScrollView }) as? UIScrollView {
            self.navigationController?.navigationBar.prefersLargeTitles = true
            navigationController?.navigationBar.largeTitleTextAttributes = [
                NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: CGFloat(fontSize)) // 원하는 크기로 설정
                    ]
           
            if scrollView.contentOffset.y > 0 {
                navigationItem.largeTitleDisplayMode = .never
            } else {
                navigationItem.largeTitleDisplayMode = .always
            }
        }
    }
}
func formatNumberWithComma(_ number: Int) -> String {
    let numberFormatter = NumberFormatter()
    numberFormatter.groupingSeparator = ","
    numberFormatter.numberStyle = .decimal
    if let formattedNumber = numberFormatter.string(from: NSNumber(value: number)) {
        return formattedNumber
    }
    return "\(number)"
}
