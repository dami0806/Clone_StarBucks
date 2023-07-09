//
//  DetailMenuViewController.swift
//  Clone_Starbucks
//
//  Created by 박다미 on 2023/07/08.
//

import UIKit
import SnapKit
import Foundation

class DetailMenuViewController:UIViewController {
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = true
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var topView: UIView = {
        let view = UIView()
        view.backgroundColor = .brown
        return view
    }()
    
    private lazy var bottomView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(bottomView)
        view.addSubview(topView)
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(1200)
        }
        
        topView.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(400)
            
        }
        
        bottomView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(400)
            make.left.right.equalToSuperview()
            make.height.equalTo(800)
        }
    }
    
    
}
//스크롤



//뷰 - 이미지

//뷰 - 나머지 디테일
import SwiftUI
struct VCPreViewDetailMenuViewController:PreviewProvider {
    static var previews: some View {
        DetailMenuViewController().toPreview().previewDevice("iPhone 14 Pro")
        // 실행할 ViewController이름 구분해서 잘 지정하기
    }
}
struct VCPreViewDetailMenuViewController2:PreviewProvider {
    static var previews: some View {
        DetailMenuViewController().toPreview().previewDevice("iPhone 11")
        // 실행할 ViewController이름 구분해서 잘 지정하기
    }
}


