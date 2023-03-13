import UIKit
import Then
import SnapKit

@available(iOS 16.0, *)
class TapBarViewController: UITabBarController {
    private lazy var homeViewController: UINavigationController = {
        let viewController = ChannelVC()
        let tabBarItem = UITabBarItem(title: "친구들", image: UIImage(named: "Home_TapBar_Gray"), tag: 0)
        viewController.tabBarItem = tabBarItem
        let navigationView = UINavigationController(rootViewController: viewController)
        return navigationView
    }()
    
    private lazy var chattingViewController: UIViewController = {
        let viewController = ChattingViewController()
        let tabBarItem = UITabBarItem(title: "채팅", image: UIImage(named: "Recruitment_TabBar_Gray"), tag: 1)
        viewController.tabBarItem = tabBarItem
        let navigationView = UINavigationController(rootViewController: viewController)
        return navigationView
    }()
    
    private lazy var userViewController: UIViewController = {
        let viewController = ProfileViewController()
        let tabBarItem = UITabBarItem(title: "유저", image: UIImage(named: "User_TabBar_Gray"), tag: 2)
        viewController.tabBarItem = tabBarItem
        let navigationView = UINavigationController(rootViewController: viewController)
        return navigationView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewControllers = [homeViewController, // 0
                           chattingViewController, // 1,
                           userViewController] // 3
        configureTabBar()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        var tabFrame = self.tabBar.frame
        tabFrame.size.height = 90
        tabFrame.origin.y = self.view.frame.size.height - 90
        self.tabBar.frame = tabFrame
    }
}

extension UITabBarController {
    
    func configureTabBar() {
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.shadowColor = UIColor.clear
        appearance.backgroundColor = .white
        
        tabBar.standardAppearance = appearance
        
        if #available(iOS 15.0, *) {
            //tabbar 불투명도
            tabBar.scrollEdgeAppearance = tabBar.standardAppearance
        }
        
        self.tabBar.layer.cornerRadius = 8
        self.tabBar.layer.backgroundColor = UIColor.systemBackground.cgColor
//        self.tabBar.tintColor = .black
        tabBar.layer.masksToBounds = false
        tabBar.layer.shadowColor = UIColor.black.cgColor
        tabBar.layer.shadowOpacity = 0.3
        tabBar.layer.shadowOffset = CGSize(width: 0, height: 0)
        tabBar.layer.shadowRadius = 6
    }
}
