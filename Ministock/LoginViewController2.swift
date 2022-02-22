//
//  HomeViewController.swift
//  Ministock
//
//  Created by chang-hwan do on 17/02/2022.
//

import UIKit

struct CustomData {
    var title: String
    var image: UIImage
}

 // 홈 화면                                                            
class HomeViewController: UIViewController, UICollectionViewDelegate {
    
    private lazy var scrollMenuView = UIScrollView()
    
    private lazy var scrollHomeView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .systemBackground
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    // title 배너 collectionview 구현
     let data = [
         CustomData(title: "first", image: #imageLiteral(resourceName: "first")),
         CustomData(title: "second", image: #imageLiteral(resourceName: "second")),
         CustomData(title: "third", image: #imageLiteral(resourceName: "third")),
     ]
         
     private lazy var collectionTopimageView: UICollectionView = {
         let layout = UICollectionViewFlowLayout()
         layout.scrollDirection = .horizontal
         let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
         cv.translatesAutoresizingMaskIntoConstraints = false
         cv.backgroundColor = .white
         cv.register(CustomCell.self, forCellWithReuseIdentifier: "cell")
         return cv
     }()
     
     // page 표시
     private lazy var pageControl: UIPageControl = {
         let pageControl = UIPageControl()
         pageControl.numberOfPages = 3
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = .gray
        pageControl.currentPageIndicatorTintColor = .blue
         pageControl.backgroundColor = .systemIndigo
        pageControl.translatesAutoresizingMaskIntoConstraints = false
         return pageControl
     }()
    
    private lazy var buttonMoreInfo: UIButton = {
        let button = UIButton()
        button.setTitle("더보기", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .systemBackground
        button.layer.borderWidth = 0.5
        button.layer.borderColor = UIColor.systemGray3.cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // 배당 주식 view
    private lazy var viewStockDevidend: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.1718102396, green: 0.478680253, blue: 0.7301161289, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
//    private lazy var labelStockDevidend: UILabel = {
//        let label = UILabel()
//        label.text = "은행 이자 부럽지 않은 배당"
//        label.font = .systemFont(ofSize: 20)
//        label.textColor = .white
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        addHomeSubView()
        setupHomeAutolayout()
    }
    
    func addHomeSubView() {
        view.addSubview(scrollHomeView)
        scrollHomeView.addSubview(collectionTopimageView)
        scrollHomeView.addSubview(pageControl)
        scrollHomeView.addSubview(scrollMenuView)
        scrollHomeView.addSubview(buttonMoreInfo)
        scrollHomeView.addSubview(viewStockDevidend)
        
        
    }

    private func setupHomeAutolayout() {
        scrollHomeView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        scrollHomeView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        scrollHomeView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        scrollHomeView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        collectionTopimageView.topAnchor.constraint(equalTo: scrollHomeView.topAnchor).isActive = true
        collectionTopimageView.leadingAnchor.constraint(equalTo: scrollHomeView.leadingAnchor).isActive = true
        collectionTopimageView.trailingAnchor.constraint(equalTo: scrollHomeView.trailingAnchor).isActive = true
        collectionTopimageView.widthAnchor.constraint(equalTo: scrollHomeView.widthAnchor).isActive = true
        collectionTopimageView.heightAnchor.constraint(equalTo: collectionTopimageView.widthAnchor, multiplier: 0.7).isActive = true
        
        pageControl.leadingAnchor.constraint(equalTo: scrollHomeView.leadingAnchor).isActive = true
        pageControl.heightAnchor.constraint(equalToConstant: 50).isActive = true
        pageControl.widthAnchor.constraint(equalToConstant: 300).isActive = true
        pageControl.topAnchor.constraint(equalTo: collectionTopimageView.bottomAnchor).isActive = true
        
        collectionTopimageView.delegate = self
        collectionTopimageView.dataSource = self
        
        pageControl.addTarget(self, action: #selector(pageControlDidChange(_:)), for: .valueChanged) // 클릭시 전환
        scrollMenuView.delegate = self
        
        viewStockDevidend.widthAnchor.constraint(equalTo: scrollHomeView.widthAnchor).isActive = true
        viewStockDevidend.heightAnchor.constraint(equalTo: scrollHomeView.heightAnchor, multiplier: 0.5).isActive = true
        viewStockDevidend.topAnchor.constraint(equalTo: buttonMoreInfo.bottomAnchor, constant: 16).isActive = true
        viewStockDevidend.bottomAnchor.constraint(equalTo: scrollHomeView.bottomAnchor, constant: -30).isActive = true
        
//        labelStockDevidend.topAnchor.constraint(equalTo: viewStockDevidend.topAnchor, constant: -10).isActive = true
//        labelStockDevidend.leadingAnchor.constraint(equalTo: viewStockDevidend.leadingAnchor, constant: 6).isActive = true
        
        buttonMoreInfo.centerXAnchor.constraint(equalTo: scrollHomeView.safeAreaLayoutGuide.centerXAnchor).isActive = true
        buttonMoreInfo.topAnchor.constraint(equalTo: scrollMenuView.bottomAnchor, constant: 10).isActive = true
        buttonMoreInfo.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.9).isActive = true
        buttonMoreInfo.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.1).isActive = true

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        //pageControl.frame = CGRect(x: 20, y: collectionTopimageView.frame.size.height+50, width: collectionTopimageView.frame.size.width/3, height: 30)
        scrollMenuView.frame = CGRect(x: 0, y: 250, width: view.frame.size.width, height: view.frame.size.height/2)
        
        if scrollMenuView.subviews.count == 2 {
            configureScrollMenuView()
        }
    }

// 클릭시 전환
    @objc private func pageControlDidChange(_ sender: UIPageControl) {
        let current = sender.currentPage
        collectionTopimageView.setContentOffset(CGPoint(x: CGFloat(current) * view.frame.size.width, y: 0), animated: true)
    }
    
// 스크롤시 화면 이동
    private func configureScrollMenuView() {
        scrollMenuView.contentSize = CGSize(width: view.frame.size.width*5, height: scrollMenuView.frame.size.height)
        scrollMenuView.isPagingEnabled = true
        let colors: [UIColor] = [
        .systemRed,
        .systemGray,
        .systemGreen,
        .systemOrange,
        .systemPurple
        ]
        for x in 0..<5 {
            let page = UIView(frame: CGRect(x: CGFloat(x)*view.frame.size.width, y: 0, width: view.frame.size.width, height: view.frame.size.height))
            page.backgroundColor = colors[x]
            scrollMenuView.addSubview(page)
        }
    }

}

// title 배너 스크롤시 바 상태 변화
extension HomeViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(floorf(Float(collectionTopimageView.contentOffset.x) / Float(collectionTopimageView.frame.width)))
    }
}

// title 배너 설정
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

// title 배너 custom collectionview
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

//class MenuBarScrollView: UIScrollView {
//
//    private lazy var stackView: UIStackView = {
//        let sv = UIStackView()
//        sv.spacing = 20
//        return sv
//    }()
//
//    private lazy var barView: UIView = {
//        let view = UIView()
//        view.backgroundColor = .red
//        return view
//    }()
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        setupStackViews()
//        setupStackLayout()
//    }
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    private func setupStackViews() {
//        addSubview(stackView)
//        addSubview(barView)
//    }
//    private func setupStackLayout() {
//        stackView.topAnchor.constraint(equalTo: superview.topAnchor)
//
//    }
//}
