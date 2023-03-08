//
//  BaseNavigationController.swift
//  GPoject
//
//  Created by 박준하 on 2023/03/08.
//

import UIKit

class BaseNavigationController: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBarStyle()
    }
    
    private func setupNavigationBarStyle() {
        let mainColor = UIColor.label
        navigationBar.tintColor = mainColor
        navigationBar.prefersLargeTitles = true
        navigationBar.titleTextAttributes = [.foregroundColor: mainColor]
    }
}
