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
    
    private lazy var scrollHomeView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .systemBackground
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
//    private lazy var stackView: UIStackView(arrangedSubviews: [TopimageCollectionView, MenuScrollView])

    private lazy var stackView:UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [TopimageCollectionView, MenuScrollView])
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 10
        stackView.axis = .vertical
        return stackView
    }()

    // title 배너 collectionview 구현
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        addHomeSubView()
        setupHomeAutolayout()
    }
    
    func addHomeSubView() {
        view.addSubview(scrollHomeView)
        scrollHomeView.addSubview(stackView)
    }

    private func setupHomeAutolayout() {
        scrollHomeView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        scrollHomeView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        scrollHomeView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        scrollHomeView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
}


