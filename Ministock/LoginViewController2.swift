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
        easyloginButton.addTarget(self, action: #selector(didTapLoginButton), for: .touchUpInside)
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
        let tabBarVC = UITabBarController()
        
        let vc1 = HomeViewController()
        let vc2 = ThirdViewController()
        let vc3 = FourthViewController()
        let vc4 = FifthViewController()
        
        vc1.title = "Home"
        vc2.title = "Second"
        vc3.title = "Third"
        vc4.title = "Fourth"
        
        tabBarVC.setViewControllers([vc1, vc2, vc3, vc4], animated: false)
        guard let items = tabBarVC.tabBar.items else {
            return
        }
        let images = ["house", "bell", "star", "gear"]
        let alarm = ["1", "3", "2", "1"]
        
        for x in 0..<items.count {
            items[x].badgeValue = alarm[x]
            items[x].image = UIImage(systemName: images[x])
        }
        
        tabBarVC.modalPresentationStyle = .fullScreen
        present(tabBarVC, animated: true)
    }
}

struct CustomData {
    var title: String
    var image: UIImage
}
 // 홈 화면
class HomeViewController: UIViewController, UICollectionViewDelegate {
    
    private lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = 5
        pageControl.backgroundColor = .systemGray2
        return pageControl
    }()
    
    private lazy var scrollView = UIScrollView()

    private lazy var scrollHomeView: UIScrollView = {
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
        pageControl.addTarget(self, action: #selector(pageControlDidChange(_:)), for: .valueChanged) // 클릭시 전환
        scrollView.delegate = self
        scrollView.backgroundColor = .red
        view.backgroundColor = .white
        addHomeSubView()
        setupHomeAutolayout()
    }
    // 클릭시 전환
    @objc private func pageControlDidChange(_ sender: UIPageControl) {
        let current = sender.currentPage
        scrollView.setContentOffset(CGPoint(x: CGFloat(current) * view.frame.size.width, y: 0), animated: true)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        pageControl.frame = CGRect(x: 10, y: view.frame.size.height-140, width: view.frame.size.width-20, height: 30)
        scrollView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height-150)
        
        if scrollView.subviews.count == 2 {
            configureScrollView()
        }
    }
    
    func addHomeSubView() {
        self.view.addSubview(scrollHomeView)
        self.view.addSubview(collectionTopimageView)
        view.addSubview(pageControl)
        view.addSubview(scrollView)
        scrollHomeView.addSubview(buttonOne)
        scrollHomeView.addSubview(buttonTwo)
    }

    private func setupHomeAutolayout() {
        scrollHomeView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        scrollHomeView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        scrollHomeView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        scrollHomeView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true

        buttonOne.leadingAnchor.constraint(equalTo: scrollHomeView.leadingAnchor, constant: 40).isActive = true
        buttonOne.topAnchor.constraint(equalTo: scrollHomeView.topAnchor, constant: 40).isActive = true
        
        buttonTwo.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        buttonTwo.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7).isActive = true
        buttonTwo.topAnchor.constraint(equalTo: scrollHomeView.topAnchor, constant: 1000).isActive = true
        buttonTwo.bottomAnchor.constraint(equalTo: scrollHomeView.bottomAnchor, constant: -40).isActive = true
        
        collectionTopimageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 16).isActive = true
        collectionTopimageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        collectionTopimageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        collectionTopimageView.heightAnchor.constraint(equalTo: collectionTopimageView.widthAnchor, multiplier: 0.7).isActive = true
        
        collectionTopimageView.delegate = self
        collectionTopimageView.dataSource = self
    }
    
    let data = [
        CustomData(title: "first", image: #imageLiteral(resourceName: "first")),
        CustomData(title: "second", image: #imageLiteral(resourceName: "second")),
        CustomData(title: "third", image: #imageLiteral(resourceName: "third")),
    ]
    
    fileprivate let collectionTopimageView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = .white
        cv.register(CustomCell.self, forCellWithReuseIdentifier: "cell")
        return cv
    }()
    // 스크롤시 화면 이동
    private func configureScrollView() {
        scrollView.contentSize = CGSize(width: view.frame.size.width+5, height: scrollView.frame.size.height)
        scrollView.isPagingEnabled = true
        let colors: [UIColor] = [
        .systemRed,
        .systemGray,
        .systemGreen,
        .systemOrange,
        .systemPurple
        ]
        for x in 0..<5 {
            let page = UIView(frame: CGRect(x: CGFloat(x)*view.frame.size.width, y: 0, width: view.frame.size.width, height: scrollView.frame.size.height))
            page.backgroundColor = colors[x]
            scrollView.addSubview(page)
        }
    }

}

// 홈탭 구분
class ThirdViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        title = "second"
    }
}

class FourthViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        title = "third"
    }
}

class FifthViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
        title = "fourth"
    }
}
// 스크롤시 바 상태 변화
extension HomeViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(floorf(Float(scrollView.contentOffset.x) / Float(scrollView.frame.width)))
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: collectionView.frame.width, height: collectionView.frame.width/2)
        }
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return data.count
        }
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? CustomCell
                cell?.data = self.data[indexPath.row]
                return cell ?? UICollectionViewCell()
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
        iv.contentMode = .scaleToFill
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
