import UIKit
import SnapKit

class ChannelVC: BaseVC {
    lazy var channelTableView: UITableView = {
        let view = UITableView()
        view.register(ChannelTableViewCell.self, forCellReuseIdentifier: ChannelTableViewCell.className)
        view.delegate = self
        view.dataSource = self
        
        return view
    }()
    
    lazy var navLabel = UILabel().then {
        $0.textColor = UIColor.black
        $0.text = "친구들";
        $0.font = .systemFont(ofSize: 25.0, weight: .bold)
    }
    
    var channels = [Channel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        channelTableView.separatorStyle = .none
    }
    
    private func configure() {
        view.addSubview(channelTableView)
        channelTableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
//        navigationController?.navigationBar.prefersLargeTitles = true // nav 크게 하기
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: navLabel)
        self.navigationItem.leftItemsSupplementBackButton = true
//        title = "친구들"
        channels = getChannelMocks()
    }
    
}

extension ChannelVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ChannelTableViewCell.className, for: indexPath) as! ChannelTableViewCell
        
        cell.selectionStyle = .none
        if indexPath.row == 0 {
            cell.userImage.image = UIImage(named: "둥이")
            cell.nameLabel.text = "정적인 세끼"
        }
        else if indexPath.row == 1 {
            cell.userImage.image = UIImage(named: "성화아이시크림")
            cell.nameLabel.text = "문성화"
            cell.explanationLabel.text = "最後まで, 頑張ってね"
        } else if indexPath.row == 2 {
            cell.userImage.image = UIImage(named: "양")
            cell.nameLabel.text = "양지은"
            cell.explanationLabel.text = "V🚬V"
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let channel = channels[indexPath.row]
//
//        if indexPath.row == 0 {
//            let vc = APChatViewController()
//            navigationController?.pushViewController(vc, animated: true)
//        } else {
//            let viewController = ChatVC(channel: channel)
//            navigationController?.pushViewController(viewController, animated: true)
//        }
        
    }
}
