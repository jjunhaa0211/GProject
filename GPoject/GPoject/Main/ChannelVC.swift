import UIKit
import SnapKit

class ChannelVC: BaseViewController {
    lazy var channelTableView: UITableView = {
        let view = UITableView()
        view.register(ChannelTableViewCell.self, forCellReuseIdentifier: ChannelTableViewCell.className)
        view.delegate = self
        view.dataSource = self
        
        return view
    }()
    
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
        
        navigationController?.navigationBar.prefersLargeTitles = true // nav 크게 하기
        title = "채팅"
        channels = getChannelMocks()
    }
    
}

extension ChannelVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ChannelTableViewCell.className, for: indexPath) as! ChannelTableViewCell
        
        
        if indexPath.row == 0 {
            cell.userImage.image = UIImage(named: "둥이")
            cell.nameLabel.text = "정적인 세끼"
        } else {
            cell.userImage.image = UIImage(named: "노랑이")
            cell.nameLabel.text = "알 수 없음"
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let channel = channels[indexPath.row]
        
        if indexPath.row == 0 {
            let vc = APChatViewController()
            navigationController?.pushViewController(vc, animated: true)
        } else {
            let viewController = ChatVC(channel: channel)
            navigationController?.pushViewController(viewController, animated: true)
        }
    }
}
