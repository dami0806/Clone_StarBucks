//
//  HomeViewController.swift
//  Clone_Starbucks
//
//  Created by 박다미 on 2023/03/25.
//

import UIKit

class HomeViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var stickyView: UIView!
    
    @IBOutlet weak var mainImage: UIImageView!
    
    @IBOutlet weak var deliverButton: UIButton!
    
    
    // 처음 나올때
    var initialStickyViewYPosition: CGFloat = 300
    var previousScrollOffset: CGFloat = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        scrollView.delegate = self
        stickyView.frame.origin.y = initialStickyViewYPosition
       
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let yOffset = scrollView.contentOffset.y
        
        let newStickyViewYPosition = max(yOffset, initialStickyViewYPosition)
        let positionDifference = newStickyViewYPosition - initialStickyViewYPosition
        
        if stickyView.frame.origin.y != newStickyViewYPosition {
            stickyView.frame.origin.y = newStickyViewYPosition
            
         
            
            if yOffset > previousScrollOffset { // 내리기
                print("down")
                UIView.animate(withDuration: 0.3, delay: 0.0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.0, options: .curveEaseInOut, animations: {
                    self.deliverButton.transform = CGAffineTransform(scaleX: 1, y: 1.0)
                }, completion: nil)
                deliverButton.layer.cornerRadius = 20
                deliverButton.layer.masksToBounds = true
            } else if yOffset < previousScrollOffset { // 올리기
                print("up")
                UIView.animate(withDuration: 0.3, delay: 0.0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.0, options: .curveEaseInOut, animations: {
                    self.deliverButton.transform = CGAffineTransform(scaleX: 2.5, y: 1.0)
                    self.deliverButton.titleLabel?.text = "Delivers"
                }, completion: nil)
            }
            
            previousScrollOffset = yOffset
            
            let alphaValue = max(0, min(positionDifference / 100, 1.0))
            stickyView.layer.shadowColor = UIColor.gray.cgColor
            stickyView.layer.shadowOpacity = Float(alphaValue)
            stickyView.layer.shadowRadius = alphaValue*5
        }
        
        
        // 그림자를
        let alphaValue = max(0, min(positionDifference / 100, 1.0))
        
        stickyView.layer.shadowColor = UIColor.gray.cgColor
        stickyView.layer.shadowOpacity = Float(alphaValue)
        stickyView.layer.shadowRadius = alphaValue*5
        
    }
    func buttonSetting(){
        deliverButton.layer.cornerRadius = 20
        deliverButton.layer.masksToBounds = true
    }
    
    
    
    
}
