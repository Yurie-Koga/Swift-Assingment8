//
//  ViewController.swift
//  Swift-Assignment8-Restaurants
//
//  Created by Uji Saori on 2021-02-09.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var collectionView: UICollectionView!
    
    // MARK: Section Definitions
    enum Section: Hashable {
        case promoted
        case promoted2
    }
    
    var dataSource: UICollectionViewDiffableDataSource<Section, Item>!
    var sections = [Section]()
    
    lazy var filteredItems: [Item] = Item.popularApps
//    var filteredItemsSnapshot: NSDiffableDataSourceSnapshot<Section, Item> {
//        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
//        snapshot.appendSections([.promoted2])
//        snapshot.appendItems(filteredItems, toSection: .promoted2)
//        return snapshot
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: Collection View Setup
        collectionView.collectionViewLayout = createLayout()
        collectionView.register(PromotedAppCollectionViewCell.self, forCellWithReuseIdentifier: PromotedAppCollectionViewCell.reuseIdentifier)
        collectionView.register(StandardAppCollectionViewCell.self, forCellWithReuseIdentifier: StandardAppCollectionViewCell.reuseIdentifier)
        
        configureDataSource()
        performQuery(with: nil)
        
    }
    
    func createLayout() -> UICollectionViewLayout {
        // based on the section, we need to return different layout objects
        let layout = UICollectionViewCompositionalLayout { (sectionIndex, layoutEnvironment) -> NSCollectionLayoutSection? in
            
            let section = self.sections[sectionIndex]
            switch section {
            case .promoted:     // kine categories
                let item = NSCollectionLayoutItem(
                    layoutSize: .init(
                        widthDimension: .fractionalWidth(1),
                        heightDimension: .fractionalWidth(1)
                    )
                )
                item.contentInsets = .init(top: 0, leading: 20, bottom: 0, trailing: 4)
                
                let group = NSCollectionLayoutGroup.horizontal(
                    layoutSize: .init(
                        widthDimension: .estimated(120),
                        heightDimension: .absolute(20)
                    ),
                    subitems: [item]
                )
                
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .continuous
                section.contentInsets = .init(top: 8, leading: 0, bottom: 20, trailing: 0)
                
                return section
                
            case .promoted2:    // restaurants
                let item = NSCollectionLayoutItem(
                    layoutSize: .init(
                        widthDimension: .fractionalWidth(1.0),
                        heightDimension: .fractionalHeight(1)
                    )
                )
                item.contentInsets = .init(top: 0, leading: 4, bottom: 10, trailing: 4)
                
                let group = NSCollectionLayoutGroup.horizontal(
                    layoutSize: .init(
                        widthDimension: .fractionalWidth(1),
                        heightDimension: .estimated(150)
                    ),
                    subitem: item,
                    count: 2
                )
                
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .none
                section.contentInsets = .init(top: 8, leading: 0, bottom: 20, trailing: 0)
                
                return section
            }
        }
        return layout
    }
    func configureDataSource() {
        dataSource = .init(collectionView: collectionView, cellProvider: { (collectionView, indexPath, item) -> UICollectionViewCell? in
            let section = self.sections[indexPath.section]
            switch section {
            case .promoted:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PromotedAppCollectionViewCell.reuseIdentifier, for: indexPath) as! PromotedAppCollectionViewCell
                cell.configureCell(item.app!)
                
                return cell
                
            case .promoted2:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StandardAppCollectionViewCell.reuseIdentifier, for: indexPath) as! StandardAppCollectionViewCell
                
                cell.configureCell(item.app!)
                
                return cell
            }
        })
    }
    
    func performQuery(with filter: String?) {
//        if filter != nil {
//            filteredItems += Item.popularApps2
//        }
//
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections([.promoted])
        snapshot.appendItems(Item.promotedApps, toSection: .promoted)
        snapshot.appendSections([.promoted2])
        snapshot.appendItems(filteredItems, toSection: .promoted2)

        sections = snapshot.sectionIdentifiers
        dataSource.apply(snapshot, animatingDifferences: true)
    }
    func filterData(button: UIButton) {
        let addFilter = (button.tag == 1) ? true : false
        print("will filter by \(button.titleLabel?.text) <\(addFilter)>")

//        filteredItems += Item.popularApps2
//        performQuery(with: (button.titleLabel?.text)!)
    }
}

//extension ViewController {
//    func configureDataSource() {
//        dataSource = .init(collectionView: myCollectionView, cellProvider: { (collectionView, indexPath, item) -> UICollectionViewCell? in
//            let section = self.sections[indexPath.section]
//            switch section {
//            case .promoted:
//                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PromotedAppCollectionViewCell.reuseIdentifier, for: indexPath) as! PromotedAppCollectionViewCell
//                cell.configureCell(item.app!)
//
//                return cell
//
//            case .promoted2:
//                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StandardAppCollectionViewCell.reuseIdentifier, for: indexPath) as! StandardAppCollectionViewCell
//
//                cell.configureCell(item.app!)
//
//                return cell
//            }
//        })
//    }
//
//    func performQuery(with filter: String?) {
////        if filter != nil {
////            filteredItems += Item.popularApps2
////        }
////
//        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
//        snapshot.appendSections([.promoted])
//        snapshot.appendItems(Item.promotedApps, toSection: .promoted)
//        snapshot.appendSections([.promoted2])
//        snapshot.appendItems(filteredItems, toSection: .promoted2)
//
//        sections = snapshot.sectionIdentifiers
//        dataSource.apply(snapshot, animatingDifferences: true)
//    }
//}

//extension ViewController {
//    func filterData(button: UIButton) {
////        let addFilter = (button.tag == 1) ? true : false
////        print("will filter by \(button.titleLabel?.text) <\(addFilter)>")
//
//        filteredItems += Item.popularApps2
////        configureDataSource()
//        performQuery(with: (button.titleLabel?.text)!)
//    }
//}
