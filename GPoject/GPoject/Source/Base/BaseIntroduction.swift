//
//  BaseIntroduction.swift
//  GPoject
//
//  Created by 박준하 on 2023/03/10.
//

import UIKit

class BaseIntroduction: BaseVC {
    
    internal lazy var userBackground = UIImageView().then {
        $0.backgroundColor = .red
    }
    
    override func layout() {
        view.addSubview(userBackground)
        
        userBackground.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
