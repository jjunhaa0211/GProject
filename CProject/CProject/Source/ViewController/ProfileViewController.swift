//
//  ProfileViewController.swift
//  CProject
//
//  Created by 박준하 on 2023/03/12.
//

import UIKit
import SnapKit
import Then

struct Badge {
    let title: String
    let imageName: String
}

class ProfileViewController: UIViewController {
    
    let badges = [
        Badge(title: "친구 10명", imageName: "badge1"),
        Badge(title: "친구 50명", imageName: "badge2"),
        Badge(title: "친구 100명", imageName: "badge3"),
        Badge(title: "1000점 달성", imageName: "badge4"),
        Badge(title: "5000점 달성", imageName: "badge5"),
        Badge(title: "10000점 달성", imageName: "badge6"),
        Badge(title: "십만점 달성", imageName: "badge7"),
        Badge(title: "이심만점 달성", imageName: "badge8"),
        Badge(title: "사십만점 달성", imageName: "badge9"),
        Badge(title: "육십만점 달성", imageName: "badge10")
    ]
    
    let profileImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.layer.cornerRadius = 50
        $0.layer.masksToBounds = true
        $0.backgroundColor = .white
        $0.image = UIImage(named: "profile_image")
    }
    
    let nameLabel = UILabel().then {
        $0.font = UIFont.boldSystemFont(ofSize: 20)
        $0.textAlignment = .center
        $0.textColor = .white
        $0.text = "박준하"
    }
    
    let bioLabel = UILabel().then {
        $0.numberOfLines = 0
        $0.textAlignment = .center
        $0.textColor = .white
        $0.text = "기분부터 파고드는 개발자"
    }
    
    let followButton = UIButton().then {
        $0.backgroundColor = .systemBlue
        $0.setTitle("Follow", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.layer.cornerRadius = 5
    }
    
    let friendsLabel = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 16)
        $0.textAlignment = .center
        $0.text = "친구들"
        $0.textColor = .white
    }
    
    let friendCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then {
        $0.scrollDirection = .horizontal
        $0.itemSize = CGSize(width: 50, height: 50)
        $0.minimumLineSpacing = 10
        $0.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }).then {
        $0.backgroundColor = .blue
        $0.register(FriendCell.self, forCellWithReuseIdentifier: "FriendCell")
    }
    
    let intimacyLabel = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 16)
        $0.textAlignment = .center
        $0.textColor = .white
        $0.text = "친밀도"
    }
    
    let intimacyProgressBar = UIProgressView().then {
        $0.progressTintColor = .systemBlue
        $0.trackTintColor = .lightGray
    }
    
    let badgeLabel = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 16)
        $0.textAlignment = .center
        $0.textColor = .white
        $0.text = "배지"
    }
    
    let badgeCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then {
        $0.scrollDirection = .horizontal
        $0.itemSize = CGSize(width: 50, height: 50)
        $0.minimumLineSpacing = 10
        $0.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }).then {
        $0.backgroundColor = .clear
        $0.register(BadgeCell.self, forCellWithReuseIdentifier: "BadgeCell")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        friendCollectionView.dataSource = self
        friendCollectionView.delegate = self

        badgeCollectionView.dataSource = self
        badgeCollectionView.delegate = self
        
        
        view.backgroundColor = .black
        
        view.addSubview(profileImageView)
        view.addSubview(nameLabel)
        view.addSubview(bioLabel)
        view.addSubview(followButton)
        view.addSubview(friendsLabel)
        view.addSubview(friendCollectionView)
        view.addSubview(intimacyLabel)
        view.addSubview(intimacyProgressBar)
        view.addSubview(badgeLabel)
        view.addSubview(badgeCollectionView)
        
        profileImageView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(50)
            $0.width.height.equalTo(100)
        }
        
        nameLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(profileImageView.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        
        bioLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(nameLabel.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        
        followButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(bioLabel.snp.bottom).offset(20)
            $0.width.equalTo(80)
            $0.height.equalTo(30)
        }
        
        friendsLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(followButton.snp.bottom).offset(30)
        }
        
        friendCollectionView.snp.makeConstraints {
            $0.top.equalTo(friendsLabel.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(70)
        }
        
        intimacyLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(friendCollectionView.snp.bottom).offset(20)
        }
        
        intimacyProgressBar.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(intimacyLabel.snp.bottom).offset(10)
            $0.width.equalTo(400)
            $0.height.equalTo(10)
        }
        
        badgeLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(intimacyProgressBar.snp.bottom).offset(20)
        }
        
        badgeCollectionView.snp.makeConstraints {
            $0.top.equalTo(badgeLabel.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(70)
        }
    }
}

class FriendCell: UICollectionViewCell {
    let friendImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.layer.cornerRadius = 25
        $0.layer.masksToBounds = true
        $0.backgroundColor = .white
        $0.image = UIImage(named: "friend_image")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(friendImageView)
        friendImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class BadgeCell: UICollectionViewCell {
    // badge cell 내부에 표시될 titleLabel과 imageView
    let titleLabel = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 12)
        $0.textColor = .white
        $0.textAlignment = .center
    }
    
    let imageView = UIImageView().then {
        $0.backgroundColor = .white
        $0.contentMode = .scaleAspectFit
        $0.clipsToBounds = true
    }
    
    // configure 메서드 추가
    func configure(badge: Badge) {
        titleLabel.text = badge.title
        imageView.image = UIImage(named: badge.imageName)
    }
    
    // 레이아웃을 설정하는 코드
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(titleLabel)
        contentView.addSubview(imageView)
        
        // titleLabel, imageView의 AutoLayout 설정
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(20)
        }
        
        imageView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(5)
            $0.centerX.equalToSuperview()
            $0.width.height.equalTo(30)
            $0.bottom.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ProfileViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == friendCollectionView {
            return 10 // 임시 데이터
        } else {
            return badges.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == friendCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FriendCell", for: indexPath) as! FriendCell
            // 셀 구성하기
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BadgeCell", for: indexPath) as! BadgeCell
            let badge = badges[indexPath.row]
            cell.imageView.image = UIImage(named: badge.imageName)
            cell.titleLabel.text = badge.title
            return cell
        }
    }
}

extension ProfileViewController: UICollectionViewDelegate {}

extension ProfileViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 50, height: 50)
    }
}
