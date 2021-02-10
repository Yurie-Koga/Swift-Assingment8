//
//  StandardAppCollectionViewCell.swift
//  Swift-Assignment8-Restaurants
//
//  Created by Uji Saori on 2021-02-09.
//

import UIKit

class StandardAppCollectionViewCell: UICollectionViewCell {
    
    static let reuseIdentifier = "StandardAppCollectionViewCell"
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.spacing = 8
        
        return stackView
    }()
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 15
        imageView.widthAnchor.constraint(equalToConstant: 160).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .label
        label.numberOfLines = 1
        
        return label
    }()
    
    let subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .secondaryLabel
        
        return label
    }()
    
    let labelStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 4
        stackView.distribution = .fillEqually
        
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        stackView.addArrangedSubview(imageView)
        labelStackView.addArrangedSubview(titleLabel)
        labelStackView.addArrangedSubview(subtitleLabel)
        stackView.addArrangedSubview(labelStackView)
        addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 8),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(_ app: App) {
        titleLabel.text = app.title
        subtitleLabel.text = app.subtitle
        imageView.backgroundColor = app.color
    }
}
