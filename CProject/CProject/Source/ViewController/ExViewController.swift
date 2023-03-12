//
//  ExViewController.swift
//  CProject
//
//  Created by 박준하 on 2023/03/12.
//

import UIKit
import Then
import SnapKit

class ExViewController: UIViewController {
    
    let progressView = UIProgressView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(progressView)
        progressView.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.width.equalToSuperview().inset(50)
        }
        
        let button = UIButton(type: .system)
        button.setTitle("Update Progress", for: .normal)
        button.addTarget(self, action: #selector(updateProgress), for: .touchUpInside)
        view.addSubview(button)
        button.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(progressView.snp.bottom).offset(50)
        }
    }

    @objc func updateProgress() {
        let newProgress = progressView.progress + 0.1
        progressView.setProgress(newProgress, animated: true)
    }
}
