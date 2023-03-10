import UIKit

class BaseIntroduction: BaseVC {
    
    internal lazy var userBackground = UIImageView().then {
        $0.backgroundColor = .red
        $0.image = UIImage(named: "성화비행기")
    }
    
    internal lazy var userProfile = UIImageView().then {
        $0.backgroundColor = .black
        $0.image = UIImage(named: "성화아이시크림")
        $0.layer.cornerRadius = 80.0
    }
    
    internal lazy var userName = UILabel().then {
        $0.text = "문성화"
        $0.font = .systemFont(ofSize: 30, weight: .bold)
        $0.numberOfLines = 1
        $0.textColor = .white
    }
    
    internal lazy var userIntroduction = UILabel().then {
        $0.text = "最後まで, 頑張ってね"
        $0.font = .systemFont(ofSize: 20, weight: .bold)
        $0.numberOfLines = 1
        $0.textColor = .white
    }
    
    internal lazy var chattingButton = UIButton().then {
        $0.backgroundColor = .gray
    }
    
    internal lazy var instagramButton = UIButton().then {
        let image = UIImage(named: "instagram-icon")
        $0.setBackgroundImage(image, for: UIControl.State.normal)
    }
    
    internal lazy var facebookButton = UIButton().then {
        let image = UIImage(named: "facebook-icon")
        $0.setBackgroundImage(image, for: UIControl.State.normal)
    }
    
    internal lazy var viewLine = UIButton().then {
        $0.backgroundColor = .separator
    }
    
    internal lazy var outButton = UIButton().then {
        $0.backgroundColor = .red
    }
    
    let contentStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.alignment = .center
        $0.distribution = .equalCentering
        $0.spacing = 50
    }
    
    override func touchEvent() {
        super.touchEvent()
        
        outButton.rx.tap
            .bind {
                print("나가기")
                self.dismiss(animated: true)
            }
        
        chattingButton.rx.tap
            .bind {
                print("채팅하러 가기")
            }
        
        instagramButton.rx.tap
            .bind {
                print("인스타 버튼 클릭")
            }
        
        facebookButton.rx.tap
            .bind {
                print("페이스북 버튼 클릭")
            }
    }
    
    override func layout() {
        view.addSubview(userBackground)
        view.addSubview(userProfile)
        view.addSubview(userName)
        view.addSubview(userIntroduction)
        view.addSubview(contentStackView)
        view.addSubview(viewLine)
        view.addSubview(outButton)
        
        userBackground.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        userProfile.snp.makeConstraints {
            $0.centerY.equalToSuperview().offset(100.0)
            $0.centerX.equalToSuperview()
            $0.height.width.equalTo(160.0)
        }
        
        userName.snp.makeConstraints {
            $0.top.equalTo(userProfile.snp.bottom).offset(20.0)
            $0.centerX.equalToSuperview()
        }
        
        userIntroduction.snp.makeConstraints {
            $0.top.equalTo(userName.snp.bottom).offset(10.0)
            $0.centerX.equalToSuperview()
        }
        
        viewLine.snp.makeConstraints {
            $0.height.equalTo(3.0)
            $0.width.equalToSuperview()
            $0.top.equalTo(userIntroduction.snp.bottom).offset(35.0)
        }
        
        [chattingButton, instagramButton, facebookButton].forEach {
            contentStackView.addArrangedSubview($0)
        }
        
        chattingButton.snp.makeConstraints {
            $0.width.height.equalTo(60.0)
        }
        
        instagramButton.snp.makeConstraints {
            $0.width.height.equalTo(chattingButton.snp.width)
        }
        
        facebookButton.snp.makeConstraints {
            $0.width.height.equalTo(instagramButton.snp.width)
        }
        
        contentStackView.snp.makeConstraints {
            $0.top.equalTo(viewLine.snp.bottom).offset(30.0)
            $0.centerX.equalToSuperview()
        }
        
        outButton.snp.makeConstraints {
            $0.width.height.equalTo(50.0)
            $0.top.equalToSuperview().offset(60.0)
            $0.leading.equalToSuperview().inset(30.0)
        }
    }
}
