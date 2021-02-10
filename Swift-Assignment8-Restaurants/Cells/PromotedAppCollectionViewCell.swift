//
//  PromotedAppCollectionViewCell.swift
//  Swift-Assignment8-Restaurants
//
//  Created by Uji Saori on 2021-02-09.
//

import UIKit

class PromotedAppCollectionViewCell: UICollectionViewCell {
    static let reuseIdentifier = "PromotedAppCollectionViewCell"
    
    let headlineLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        label.textColor = UIColor.systemBlue
        label.setContentHuggingPriority(.required, for: .vertical)
        
        return label
    }()
    
    
    let nameBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        btn.backgroundColor = .white
        btn.setTitleColor(.systemBlue, for: .normal)
        btn.setContentHuggingPriority(.required, for: .vertical)
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        addSubview(nameBtn)
//        stackView.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            headlineLabel.topAnchor.constraint(equalTo: topAnchor),
//            headlineLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
//            headlineLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
//            headlineLabel.leadingAnchor.constraint(equalTo: leadingAnchor)
//        ])
        
        nameBtn.addTarget(self, action: #selector(btnTapped(_:)), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func btnTapped(_ sender: UIButton) {
        print("btn tapped: \(String(describing: sender.titleLabel?.text))")
        // switch selected mode: 1=selected, 0=not selected
        if sender.tag == 1 {
            sender.tag = 0
            sender.backgroundColor = .white
            sender.setTitleColor(.systemBlue, for: .normal)
        } else {
            sender.tag = 1
            sender.backgroundColor = .systemBlue
            sender.setTitleColor(.white, for: .normal)
        }
    
        let mainVC = ViewController()
        mainVC.filterData(button: sender)
    }
    
    func configureCell(_ app: App) {
        nameBtn.setTitle(app.promotedHeadline, for: .normal)
        nameBtn.tag = 0 // default = not selected
        headlineLabel.text = app.promotedHeadline?.uppercased()
    }
}
