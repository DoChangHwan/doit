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
    
    private lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = 5
        pageControl.backgroundColor = .systemGray2
        return pageControl
    }()
    
    private lazy var scrollView = UIScrollView()

    private lazy var scrollHomeView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .systemBackground
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
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
        view.backgroundColor = .systemBackground
        
        addHomeSubView()
        setupHomeAutolayout()
    }
    
    func addHomeSubView() {
        self.view.addSubview(scrollHomeView)
        self.view.addSubview(collectionTopimageView)
        view.addSubview(pageControl)
        view.addSubview(scrollView)
        scrollHomeView.addSubview(buttonTwo)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        pageControl.frame = CGRect(x: 10, y: view.frame.size.height-140, width: view.frame.size.width-20, height: 30)
        scrollView.frame = CGRect(x: 0, y: 250, width: view.frame.size.width, height: view.frame.size.height/2)
        
        if scrollView.subviews.count == 2 {
            configureScrollView()
        }
    }

    private func setupHomeAutolayout() {
        scrollHomeView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        scrollHomeView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        scrollHomeView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        scrollHomeView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true

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
        
        pageControl.addTarget(self, action: #selector(pageControlDidChange(_:)), for: .valueChanged) // 클릭시 전환
        
        scrollView.delegate = self

    }
    
// title 배너 collectionview 구현
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

// 클릭시 전환
    @objc private func pageControlDidChange(_ sender: UIPageControl) {
        let current = sender.currentPage
        scrollView.setContentOffset(CGPoint(x: CGFloat(current) * view.frame.size.width, y: 0), animated: true)
    }
    
// 스크롤시 화면 이동
    private func configureScrollView() {
        scrollView.contentSize = CGSize(width: view.frame.size.width*5, height: scrollView.frame.size.height)
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
