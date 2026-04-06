//
//  WelcomeController.swift
//  SOPT38-practice
//
//  Created by Seoyoung Lee on 4/7/26.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    private var userId: String?
    
    private let welcomImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 112, y: 87, width: 150, height: 150))
        imageView.image = UIImage(named: "welcome")
        return imageView
    }()
    
    private let welcomeLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 115, y: 295, width: 145, height: 60))
        label.text = "???님\n반가워요!"
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 25)
        label.numberOfLines = 2
        label.adjustsFontSizeToFitWidth = true // 텍스트가 UILabel 너비 초과할 때 폰트 크기 줄여 맞춤
        label.minimumScaleFactor = 0.5 // 폰트 크기 50%까지 줄일 수 있음
        return label
    }()
    
    private let mainButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 20, y: 426, width: 335, height: 57))
        button.backgroundColor = UIColor(red: 255/255, green: 111/255, blue: 15/255, alpha: 1)
        button.setTitle("메인으로", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 18)
        button.layer.cornerRadius = 3
        return button
    }()

    private let backToLoginButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 20, y: 498, width: 335, height: 57))
        button.backgroundColor = UIColor(red: 221/255, green: 222/255, blue: 227/255, alpha: 1)
        button.setTitle("다시 로그인", for: .normal)
        button.setTitleColor(.gray, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 18)
        button.layer.cornerRadius = 3
        button.addTarget(self, action: #selector(backToLoginTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setLayout()
    }
    
    func setLabelText(id: String?) {
        self.userId = id
        welcomeLabel.text = "\(id ?? "")님\n반가워요!"
    }
    
    private func setLayout() {
        [welcomImageView, welcomeLabel, mainButton, backToLoginButton].forEach{self.view.addSubview($0)}
    }

    @objc
    private func backToLoginTapped() {
        if self.navigationController == nil {
            self.dismiss(animated: true)
        } else {
            self.navigationController?.popViewController(animated: true)
        }
    }
}
