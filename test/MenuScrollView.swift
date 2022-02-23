//
//  Menu.swift
//  test3
//
//  Created by dochanghwan on 2022/02/23.
//

import UIKit

class MenuScorllView: UIScrollView {
    
   private lazy var scrollMenuView = UIScrollView()
//   scrollMenuView.delegate = self
    
   override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        scrollMenuView.frame = CGRect(x: 0, y: 250, width: view.frame.size.width, height: view.frame.size.height/2)
        
        if scrollMenuView.subviews.count == 2 {
            configureScrollMenuView()
        }
 
    }
    
    private func configureScrollMenuView() {
        scrollMenuView.contentSize = CGSize(width: view.frame.size.width*5, height: scrollMenuView.frame.size.height)
        scrollMenuView.isPagingEnabled = true
        let colors: [UIColor] = [
        .systemGray4,
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
