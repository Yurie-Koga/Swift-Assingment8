//
//  LineView.swift
//  Swift-Assignment8-Restaurants
//
//  Created by Uji Saori on 2021-02-09.
//

import UIKit

class LineView: UICollectionReusableView {
    
    static let reuseIdentifier = "LineView"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .lightGray
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setColor(_ color: UIColor) {
        backgroundColor = color
    }
    
}
