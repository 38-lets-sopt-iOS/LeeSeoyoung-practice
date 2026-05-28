//
//  ItemCollectionViewCell.swift
//  SOPT38-practice
//
//  Created by Seoyoung Lee on 4/25/26.
//

import UIKit
import SnapKit
import Then

protocol ItemCollectionViewCellDelegate: AnyObject {
    func likeButtonDidTap(cell: ItemCollectionViewCell)
}

class ItemCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "ItemCollectionViewCell"
    
    weak var delegate: ItemCollectionViewCellDelegate?

    override init(frame: CGRect) {
        super.init(frame: .zero)
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let itemImageView = UIImageView().then {
        $0.image = UIImage.item5
    }
    
    private let itemLabel = UILabel().then {
        $0.text = "아이폰 13프로맥스"
        $0.font = UIFont.Pretendard.regular(size: 16)
        $0.textColor = .black
    }
    
    private let priceLabel = UILabel().then {
        $0.text = "1,200원"
        $0.font = UIFont.Pretendard.bold(size: 15)
        $0.textColor = UIColor.primaryOrange
    }
    
    let likeButton = UIButton().then {
        $0.setImage(UIImage.likeOff, for: .normal)
        $0.setImage(UIImage.likeOn, for: .selected)
        $0.addTarget(self, action: #selector(likeButtonDidTap), for: .touchUpInside)
    }
    
    private func setUI() {
        [itemImageView, itemLabel, priceLabel, likeButton].forEach{self.addSubview($0)}
    }
    
    private func setLayout() {
        itemImageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.left.right.equalToSuperview().inset(9)
            $0.bottom.equalToSuperview().inset(59)
        }
        itemLabel.snp.makeConstraints {
            $0.left.equalToSuperview().inset(13)
            $0.top.equalTo(itemImageView.snp.bottom).offset(6)
        }
        priceLabel.snp.makeConstraints {
            $0.left.equalToSuperview().inset(13)
            $0.top.equalTo(itemLabel.snp.bottom).offset(2)
        }
        likeButton.snp.makeConstraints {
            $0.trailing.bottom.equalTo(itemImageView).inset(8)
            $0.size.equalTo(16)
        }
    }
    
    @objc private func likeButtonDidTap() {
        delegate?.likeButtonDidTap(cell: self)
    }
}

extension ItemCollectionViewCell {
    func dataBind(_ itemData: ItemModel) {
        itemImageView.image = itemData.itemImg
        itemLabel.text = itemData.name
        priceLabel.text = itemData.price
        likeButton.isSelected = itemData.heartIsSelected
    }
}
