//
//  BaseIntro.swift
//  GPoject
//
//  Created by 박준하 on 2023/03/09.
//

import UIKit
import SnapKit
import Then
import RxCocoa
import RxRelay
import RxSwift

class BaseIntroduction: BaseVC {
    
    internal lazy var userBackground = UIImageView().then {
        $0.image = UIImage(named: "성화비행기")
    }
    
    internal lazy var outButton = UIButton().then {
        $0.backgroundColor = .red
        $0.rx.tap
            .bind {
                print("나가기 버튼 클릭")
            }
    }
    
    internal lazy var userImage = UIImageView().then {
        $0.backgroundColor = .black
        $0.layer.cornerRadius = 55.0
    }
    
    internal lazy var userName = UILabel().then {
        $0.text = "유저 이름"
        $0.textColor = .white
        $0.font = .systemFont(ofSize: 25.0, weight: .bold)
    }
    
    internal lazy var userIntroduction = UILabel().then {
        $0.text = "最後まで, 頑張ってね"
        $0.textColor = .white
        $0.font = .systemFont(ofSize: 15.0, weight: .bold)
    }
    
    internal lazy var chattingButton = UIButton().then {
        $0.backgroundColor = .yellow
    }
    
    internal lazy var instagramButton = UIButton().then {
        $0.backgroundColor = .blue
    }
    
    internal lazy var facebookButton = UIButton().then {
        $0.backgroundColor = .green
    }
    
    internal lazy var lineView = UIView().then {
        $0.backgroundColor = .separator
    }
    
    let contentStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.alignment = .center
        $0.distribution = .equalCentering
        $0.spacing = 60
    }

    
    override func layout() {
        super.layout()
        
        view.addSubview(userBackground)
        view.addSubview(outButton)
        view.addSubview(userImage)
        view.addSubview(userName)
        view.addSubview(userIntroduction)
        view.addSubview(contentStackView)
        view.addSubview(lineView)
        
        userBackground.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.height.width.equalToSuperview()
        }
        
        outButton.snp.makeConstraints {
            $0.height.width.equalTo(50.0)
            $0.top.equalTo(userBackground.snp.top).offset(40.0)
            $0.leading.equalTo(userBackground.snp.leading).inset(20.0)
        }
        
        userImage.snp.makeConstraints {
            $0.centerY.equalTo(userBackground.snp.centerY).offset(100.0)
            $0.centerX.equalTo(userBackground.snp.centerX)
            $0.height.width.equalTo(140.0)
        }
        
        userName.snp.makeConstraints {
            $0.top.equalTo(userImage.snp.bottom).offset(20.0)
            $0.centerX.equalToSuperview()
        }
        
        userIntroduction.snp.makeConstraints {
            $0.top.equalTo(userName.snp.bottom).offset(10.0)
            $0.centerX.equalToSuperview()
        }
        
        lineView.snp.makeConstraints {
            $0.height.equalTo(3.0)
            $0.width.equalToSuperview()
            $0.top.equalTo(userIntroduction.snp.bottom).offset(20.0)
        }
        
        [chattingButton, instagramButton, facebookButton].forEach {
            contentStackView.addArrangedSubview($0)
        }
        
        contentStackView.snp.makeConstraints {
            $0.top.equalTo(lineView.snp.bottom).offset(20.0)
            $0.centerX.equalToSuperview()
        }
        
        chattingButton.snp.makeConstraints {
            $0.height.width.equalTo(60.0)
        }
        
        instagramButton.snp.makeConstraints {
            $0.height.width.equalTo(chattingButton.snp.height)
        }
        
        facebookButton.snp.makeConstraints {
            $0.height.width.equalTo(instagramButton.snp.height)
        }
        
        [chattingButton, instagramButton, facebookButton].forEach {
            $0.titleLabel?.font = .systemFont(ofSize: 13)
            $0.setTitleColor(.white, for: .normal)
            $0.imageView?.tintColor = .black
        }
    }
    
    override func attribute() {
        super.attribute()
        
        view.backgroundColor = .red
    }
}
