import UIKit

class LoginViewController: UIViewController {

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "ministock"
        label.font = .systemFont(ofSize: 28, weight: .bold)
        label.textColor = .label
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var secondLabel: UILabel = {
        let label = UILabel()
        label.text = "환영합니다"
        label.font = .systemFont(ofSize: 23)
        label.textColor = UIColor(red: 0, green: 0.7, blue: 2, alpha: 1)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var faceidButton: UIButton = {
        let button = UIButton()
        button.setTitle("FaceID 로그인", for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 5
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
  
    private lazy var easyloginButton: UIButton = {
        let button = UIButton()
        button.setTitle("간편비밀번호 로그인", for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 5
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubview()
        setupMainLayout()
        self.view.backgroundColor = UIColor.white
    }
    
    func addSubview() {
        [titleLabel, secondLabel, easyloginButton, faceidButton]
        .forEach {
                view.addSubview($0)
        }
    }
    
    private func setupMainLayout() {


        titleLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 34).isActive = true

        secondLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        secondLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 0).isActive = true
        secondLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        secondLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16).isActive = true
        secondLabel.heightAnchor.constraint(equalToConstant: 34).isActive = true

        faceidButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        faceidButton.bottomAnchor.constraint(equalTo: easyloginButton.topAnchor, constant: -10).isActive = true
        faceidButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50).isActive = true
        faceidButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -5).isActive = true
        faceidButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        faceidButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7).isActive = true
        faceidButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)


        easyloginButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        easyloginButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16).isActive = true
        easyloginButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50).isActive = true
        easyloginButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -5).isActive = true
        easyloginButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        easyloginButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7).isActive = true
        easyloginButton.addTarget(self, action: #selector(didTapLoginButton), for: .touchUpInside)
    }
    
    @objc private func didTapButton() {
        let rootVC = HomeViewController()
        let navVC = UINavigationController(rootViewController: rootVC)
        navVC.modalPresentationStyle = .fullScreen
        present(navVC, animated: true)
    }

    @objc func didTapLoginButton() {
        
        // Todo - present(MainTabBarController)
        let MainTabVC = MainTabBarController()
        let navVC = UINavigationController(rootViewController: MainTabVC)
        navVC.modalPresentationStyle = .fullScreen
        present(navVC, animated: true)

    }
}
