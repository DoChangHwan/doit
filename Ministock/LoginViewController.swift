//
//  ViewController.swift
//  Ministock
//
//  Created by chang-hwan do on 10/02/2022.
//

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
        easyloginButton.addTarget(self, action: #selector(didTapSecondButton), for: .touchUpInside)

    }
    
    @objc private func didTapButton() {
        let rootVC = ThirdViewController()
        let navVC = UINavigationController(rootViewController: rootVC)
        navVC.modalPresentationStyle = .fullScreen
        present(navVC, animated: true)
    }
    
    @objc private func didTapSecondButton() {
        let rootVC = SecondViewController()
        let navVC = UINavigationController(rootViewController: rootVC)
        navVC.modalPresentationStyle = .fullScreen
        present(navVC, animated: true)
    }
}

class SecondViewController: UIViewController {
    
    private lazy var scrollView: UIScrollView = {
    let scrollView = UIScrollView()
    scrollView.backgroundColor = .white
    scrollView.translatesAutoresizingMaskIntoConstraints = false
    return scrollView

    }()
    
    private lazy var buttonOne: UIButton = {
        let button = UIButton()
        button.setTitle("hello", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.backgroundColor = .systemBackground
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
        }()

    private lazy var buttonTwo: UIButton = {
        let button = UIButton()
        button.setTitle("더보기", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.layer.borderWidth = 1
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
        }()

    override func viewDidLoad() {
        super.viewDidLoad()
        addSecondSubView()
        setupSecondAutolayout()

        title = "Welcome SecondViewController"
        view.backgroundColor = .systemBackground
    }

    func addSecondSubView() {
        self.view.addSubview(scrollView)
        scrollView.addSubview(buttonOne)
        scrollView.addSubview(buttonTwo)
    }

    private func setupSecondAutolayout() {
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true

        buttonOne.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 40).isActive = true
        buttonOne.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 40).isActive = true
        
        buttonTwo.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        buttonTwo.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7).isActive = true
        buttonTwo.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 1000).isActive = true
        buttonTwo.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -40).isActive = true

    }
}

struct CustomData {
    var title: String
    var image: UIImage
    var url: String
}

class ThirdViewController: UIViewController {
    
    let data = [
        CustomData(title: "first", image: #imageLiteral(resourceName: "first"), url: "maxcodes.io/course"),
        CustomData(title: "second", image: #imageLiteral(resourceName: "second"), url: "maxcodes.io/enroll"),
        CustomData(title: "third", image: #imageLiteral(resourceName: "third") , url: "maxcodes.io/courses"),
    ]
    fileprivate let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        return cv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addThirdSubView()
        setupThirdAutolayout()

        title = "Welcome ThirdViewController"
        collectionView.backgroundColor = .systemBackground
    }
    
    func addThirdSubView() {
        self.view.addSubview(collectionView)
    }
    
    private func setupThirdAutolayout() {
        
        collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        collectionView.heightAnchor.constraint(equalTo: collectionView.widthAnchor, multiplier: 0.6).isActive = true
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

extension ThirdViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: collectionView.frame.width/2.5, height: collectionView.frame.width/2)
        }
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return data.count
        }
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCell
                cell.data = self.data[indexPath.row]
                return cell
        }
}

class CustomCell: UICollectionViewCell {
    
    var data: CustomData? {
        didSet {
            guard let data = data else {return}
            bg.image = data.image
        }
    }
    
    fileprivate let bg: UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "first")
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 12
        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(bg)
        bg.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        bg.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        bg.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        bg.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
