//
//  DetailKindViewController.swift
//  Clone_Starbucks
//
//  Created by 박다미 on 2023/07/06.
//

import UIKit
import SnapKit
final class DetailKindViewController: UIViewController {
    
    
    // 전화면에서 Movie데이터를 전달 받기 위한 변수
    var drinksData: Drinks?
    var foodsData: Foods?
    var goodsData: Goods?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(foodsData)
        setupUI()
    }
    
    private func setupUI() {
        
    }
    
}
import SwiftUI
struct VCPreViewDetailKindViewController:PreviewProvider {
    static var previews: some View {
        DetailKindViewController().toPreview().previewDevice("iPhone 14 Pro")
        // 실행할 ViewController이름 구분해서 잘 지정하기
    }
}
struct VCPreViewDetailKindViewController2:PreviewProvider {
    static var previews: some View {
        DetailKindViewController().toPreview().previewDevice("iPhone 11")
        // 실행할 ViewController이름 구분해서 잘 지정하기
    }
}


