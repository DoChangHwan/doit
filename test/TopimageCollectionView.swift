//
//  TopimageViewController.swift
//  test3
//
//  Created by dochanghwan on 2022/02/23.
//
//
import UIKit

class TopimageCollectionView: UICollectionView {
    
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
       
        cv.delegate = self
        cv.dataSource = self
   
        return cv
    }()
    
    private lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = 3
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = .systemGray
        pageControl.currentPageIndicatorTintColor = .systemBlue
        pageControl.backgroundColor = .systemBackground
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        return pageControl
    }()
    
    
}
// title 배너 스크롤시 바 상태 변화
extension TopimageCollectionView: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(floorf(Float(collectionTopimageView.contentOffset.x) / Float(collectionTopimageView.frame.width)))
    }
}

// title 배너 설정
extension TopimageCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.width/2)
    }
}
extension TopimageCollectionView: UICollectionViewDataSource {
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return data.count
        }
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? CustomCell
                cell?.data = self.data[indexPath.row]
                return cell ?? UICollectionViewCell()
        }
}
