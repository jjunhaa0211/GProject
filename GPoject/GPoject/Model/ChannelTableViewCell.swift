//
//  ChannelTableViewCell.swift
//  GPoject
//
//  Created by 박준하 on 2023/03/08.
//

import UIKit
import SnapKit
import Then

class ChannelTableViewCell: UITableViewCell {
    
    lazy var userImage = UIImageView().then {
        $0.backgroundColor = .black
        $0.layer.cornerRadius = 25.0
    }
    
    lazy var nameLabel = UILabel().then {
        $0.textColor = .black
        $0.text = "정적인 세끼"
        $0.font = .systemFont(ofSize: 15.0, weight: .thin)
    }
    
    lazy var explanationLabel = UILabel().then {
        $0.textColor = .gray
        $0.text = "👊"
        $0.font = .systemFont(ofSize: 13.0, weight: .thin)
    }
    
    lazy var detailButton = UIButton().then {
        $0.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        $0.isUserInteractionEnabled = false
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func configure() {
        contentView.addSubview(userImage)
        contentView.addSubview(nameLabel)
        contentView.addSubview(explanationLabel)
        contentView.addSubview(detailButton)
        
        userImage.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(24.0)
            $0.centerY.equalToSuperview()
            $0.trailing.lessThanOrEqualTo(detailButton).offset(-24)
            $0.height.width.equalTo(50.0)
        }
        
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(userImage.snp.top).offset(5.0)
            $0.leading.equalTo(userImage.snp.trailing).offset(10.0)
        }
        
        explanationLabel.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(5.0)
            $0.leading.equalTo(nameLabel.snp.leading)
        }
        
//        chatRoomLabel.snp.makeConstraints { make in
//            make.leading.equalToSuperview().offset(24)
//            make.centerY.equalToSuperview()
//            make.trailing.lessThanOrEqualTo(detailButton).offset(-24)
//        }
        
        detailButton.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        detailButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().offset(-24)
        }
    }
}
