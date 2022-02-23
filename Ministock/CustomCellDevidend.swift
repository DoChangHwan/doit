//
//  CustomCellDevidend.swift
//  Ministock
//
//  Created by dochanghwan on 2022/02/23.
//

import UIKit

class CustomCellDevidend: UICollectionViewCell {
    
    var dataDevidend: CustomDataDevidend? {
        didSet {
            guard let dataDevidend = dataDevidend else {return}
            bgDevidend.image = dataDevidend.image
        }
    }
    
    fileprivate let bgDevidend: UIImageView = {
        let viewDevidend = UIImageView()
        viewDevidend.image = #imageLiteral(resourceName: "testdevidend1")
        viewDevidend.translatesAutoresizingMaskIntoConstraints = false
        viewDevidend.contentMode = .scaleToFill
        viewDevidend.clipsToBounds = true
        viewDevidend.layer.cornerRadius = 12
        return viewDevidend
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(bgDevidend)
        bgDevidend.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        bgDevidend.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        bgDevidend.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        bgDevidend.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


    
