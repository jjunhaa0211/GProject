//
//  SceneDelegate.swift
//  GPoject
//
//  Created by 박준하 on 2023/03/07.
//

import UIKit

@available(iOS 13.0, *)
class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.windowScene = windowScene
        
        let rootNavigationController = BaseNC(rootViewController: TapBarViewController())
        self.window?.rootViewController = rootNavigationController
        self.window?.makeKeyAndVisible()
    }
    
}
