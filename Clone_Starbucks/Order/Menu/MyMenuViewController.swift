//
//  MyMenuViewController.swift
//  Clone_Starbucks
//
//  Created by 박다미 on 2023/06/30.
//

import UIKit
import SnapKit
class MyMenuViewController: UIViewController {
    
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
        view.backgroundColor = .red
        return view
    }()
    
    private lazy var bottomView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    private lazy var imageViewTop: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "order나만의메뉴위")
        return imageView
    }()
    private lazy var imageViewBottom: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "order나만의메뉴아래")
        return imageView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(topView)
        contentView.addSubview(bottomView)
        
        topView.addSubview(imageViewTop)
        bottomView.addSubview(imageViewBottom)
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalToSuperview()
           
        }
        
        topView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(topView.snp.width).multipliedBy(0.13)
        }
        
        bottomView.snp.makeConstraints { make in
            make.top.equalTo(topView.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        imageViewTop.snp.makeConstraints { make in
                   make.edges.equalToSuperview()
               }
        imageViewBottom.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(10)
            make.top.equalToSuperview()
            make.height.equalTo(imageViewBottom.snp.width).multipliedBy(1.2)
               }
       
    }
}


