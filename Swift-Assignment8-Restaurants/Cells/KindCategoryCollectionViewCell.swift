//
//  KindCategoryCollectionViewCell.swift
//  Swift-Assignment8-Restaurants
//
//  Created by Uji Saori on 2021-02-09.
//

import UIKit

class KindCategoryCollectionViewCell: UICollectionViewCell {
    static let reuseIdentifier = "KindCategoryCollectionViewCell"
    
    let nameBtn: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .blue
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(nameBtn)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(_ category: KindCategory) {
        nameBtn.setTitle(category.name, for: .normal)
    }
}
