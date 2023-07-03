//
//  UIViewController.swift
//  Clone_Starbucks
//
//  Created by 박다미 on 2023/06/29.
//

import Foundation
import UIKit
extension UIViewController {
    func changeTitleMode() {
        if let scrollView = self.view.subviews.first(where: { $0 is UIScrollView }) as? UIScrollView {
            self.navigationController?.navigationBar.prefersLargeTitles = true
            print(scrollView.contentOffset.y)
           
            if scrollView.contentOffset.y > 0 {
                navigationItem.largeTitleDisplayMode = .never
            } else {
                navigationItem.largeTitleDisplayMode = .always
            }
        }
    }
}
