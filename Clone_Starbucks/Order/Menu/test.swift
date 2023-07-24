//
//  test.swift
//  Clone_Starbucks
//
//  Created by 박다미 on 2023/07/24.
//
import UIKit
import UserNotifications
import SnapKit

class test: UIViewController {
    

        private lazy var button: UIButton = {
            let button = UIButton()
            button.setImage(UIImage(systemName: "bell"), for: .normal)
            button.tintColor = .systemBlue
            button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
            return button
        }()

        private var badgeNumber: Int = 0 {
            didSet {
                updateBadgeNumber()
            }
        }

        private lazy var badgeLabel: UILabel = {
            let label = UILabel()
            label.textColor = .black
            label.backgroundColor = .red
            label.textAlignment = .center
            label.layer.cornerRadius = 10
            label.clipsToBounds = true
            return label
        }()

        override func viewDidLoad() {
            super.viewDidLoad()
            view.backgroundColor = .white
            setupUI()
        }

        func setupUI() {
            view.addSubview(button)
            button.snp.makeConstraints { make in
                make.center.equalToSuperview()
                make.width.height.equalTo(40)
            }

            view.addSubview(badgeLabel)
            badgeLabel.snp.makeConstraints { make in
                make.centerX.equalTo(button.snp.trailing)
                make.centerY.equalTo(button.snp.top)
                make.width.equalTo(20)
                make.height.equalTo(20)
            }

            updateBadgeNumber()
        }

        func updateBadgeNumber() {
            badgeLabel.text = "\(badgeNumber)"
            badgeLabel.isHidden = badgeNumber == 0
        }

        func showNotification() {
            let content = UNMutableNotificationContent()
            content.title = "New Notification"
            content.body = "You have a new notification!"
            content.sound = .default

            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 0.1, repeats: false)
            let request = UNNotificationRequest(identifier: "notification", content: content, trigger: trigger)

            UNUserNotificationCenter.current().add(request) { error in
                if let error = error {
                    print("Error showing notification: \(error.localizedDescription)")
                }
            }
        }

        @objc func buttonTapped() {
            badgeNumber += 1
            showNotification()
        }
    }
