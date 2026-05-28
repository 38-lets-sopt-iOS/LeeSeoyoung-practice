//
//  ChatTableViewCell.swift
//  SOPT38-practice
//
//  Created by Seoyoung Lee on 4/25/26.
//

import UIKit
import SnapKit
import Then

class ChatTableViewCell: UITableViewCell {
    
    static let identifier = "ChatTableViewCell"

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let profileImageView = UIImageView().then {
        $0.image = UIImage.profile10
    }
    
    private let nameLabel = UILabel().then {
        $0.text = "요이키"
        $0.font = UIFont.Pretendard.bold(size: 15)
        $0.textColor = .black
    }
    
    private let locationLabel = UILabel().then {
        $0.text = "문정동"
        $0.font = UIFont.Pretendard.regular(size: 12)
        $0.textColor = UIColor.grey400
        
    }
    
    private let messageLabel = UILabel().then {
        $0.text = "확인했습니다 감사합니다 :)"
        $0.font = UIFont.Pretendard.regular(size: 14)
        $0.textColor = .black
    }
    
    private let messageImageView = UIImageView().then {
        $0.image = UIImage.product3
    }
    

    private func setUI() {
        [profileImageView, nameLabel, locationLabel, messageLabel, messageImageView].forEach{self.addSubview($0)}
    }
    
    private func setLayout() {
        profileImageView.snp.makeConstraints {
            $0.top.left.equalToSuperview().inset(16)
            $0.width.height.equalTo(40)
        }
        nameLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(16.5)
            $0.left.equalTo(profileImageView.snp.right).offset(16)
        }
        locationLabel.snp.makeConstraints {
            $0.left.equalTo(nameLabel.snp.right).offset(4)
            $0.centerY.equalTo(nameLabel.snp.centerY)
        }
        messageLabel.snp.makeConstraints {
            $0.left.equalTo(nameLabel.snp.left)
            $0.top.equalTo(nameLabel.snp.bottom).offset(4)
        }
        messageImageView.snp.makeConstraints {
            $0.width.height.equalTo(40)
            $0.right.top.equalToSuperview().inset(16)
        }
    }
}

extension ChatTableViewCell {
    func dataBind(_ chatData: ChatModel) {
        profileImageView.image = chatData.profileImg
        nameLabel.text = chatData.name
        locationLabel.text = chatData.place
        messageLabel.text = chatData.message
        messageImageView.image = chatData.itemImg
    }
}
