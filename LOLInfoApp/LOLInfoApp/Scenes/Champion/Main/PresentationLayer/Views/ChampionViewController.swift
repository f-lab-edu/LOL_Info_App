//
//  ChampionMainViewController.swift
//  LOLInfoApp
//
//  Created by 정덕호 on 2024/02/05.
//

import SnapKit
import UIKit

final class ChampionMainViewController: UIViewController {
    
    enum DatasourceSection: Int {
        case favoriteList
        case mainList
    }
    
    enum DatasourceItem: Hashable {
        case favoriteList(Int)
        case mainList(Int)
    }
    
    typealias Item = ChampionMainViewController.DatasourceItem
    typealias Section = ChampionMainViewController.DatasourceSection
    typealias DataSource = (items: [Item], section: Section)
    
    // MARK: - Literal
    
    private enum Text {
        static let title: String = "챔피언"
        static let searchControllerPlaceholder: String = "챔피언 검색"
        static let searchControllerCacelButtonText: String = "취소"
    }
    
    private enum Color {
        static let background: UIColor? = .Custom.base.color
    }
    
    // MARK: - Properties
    
    private let searchController: UISearchController = {
        let controller = UISearchController()
        controller.searchBar.placeholder = Text.searchControllerPlaceholder
        controller.searchBar.setValue(
            Text.searchControllerCacelButtonText,
            forKey: "cancelButtonText"
        )
        return controller
    }()
    
    private let collectionView: UICollectionView = {
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: .init()
        )
        collectionView.register(
            ChampionMainFavoriteListCell.self,
            forCellWithReuseIdentifier: ChampionMainFavoriteListCell.identifier
        )
        collectionView.register(
            ChampionMainListCell.self,
            forCellWithReuseIdentifier: ChampionMainListCell.identifier
        )
        collectionView.register(
            ChampionMainFavoriteListSectionHeader.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: ChampionMainFavoriteListSectionHeader.identifier
        )
        collectionView.register(
            ChampionMainListSectionHeader.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: ChampionMainListSectionHeader.identifier
        )
        return collectionView
    }()
    
    private let indicatorView = UIActivityIndicatorView(style: .large)
    
    private var datasource: UICollectionViewDiffableDataSource<Section, Item>?
    private var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureInit()
        setLayout()
    }
    
    // MARK: - Configure Funtion
    
    private func configureInit() {
        configureViewController()
        configureNavigationController()
        configureCollectionView()
    }
    
    private func configureViewController() {
        view.backgroundColor = Color.background
        title = Text.title
    }
    
    private func configureNavigationController() {
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        navigationItem.searchController = searchController
    }
    
    private func configureCollectionView() {
        collectionView.backgroundColor = Color.background
        setDataSource()
        setSectionHeader()
        snapshot.appendSections([.favoriteList, .mainList])
    }
    
    private func setDataSource() {
        datasource = UICollectionViewDiffableDataSource<Section, Item>(
            collectionView: collectionView
        ) { (collectionView, indexPath, item) -> UICollectionViewCell? in
            switch item {
            case .favoriteList(_):
                let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: ChampionMainFavoriteListCell.identifier,
                    for: indexPath
                )
                return cell
            case .mainList(_):
                guard let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: ChampionMainListCell.identifier,
                    for: indexPath
                ) as? ChampionMainListCell else { return UICollectionViewCell() }
                return cell
            }
        }
    }
    
    private func setSectionHeader() {
        datasource?.supplementaryViewProvider = { collectionView, kind, indexPath in
            switch indexPath.section {
            case 0:
                let header = collectionView.dequeueReusableSupplementaryView(
                    ofKind: UICollectionView.elementKindSectionHeader,
                    withReuseIdentifier: ChampionMainFavoriteListSectionHeader.identifier,
                    for: indexPath
                )
                return header
            default:
                let header = collectionView.dequeueReusableSupplementaryView(
                    ofKind: UICollectionView.elementKindSectionHeader,
                    withReuseIdentifier: ChampionMainListSectionHeader.identifier,
                    for: indexPath
                )
                return header
            }
        }
    }
    
    // MARK: - Layout Function
    
    private func setLayout() {
        setLayoutCollectionView()
        setLayoutIndicatorView()
    }
    
    private func setLayoutCollectionView() {
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
        let layout = UICollectionViewCompositionalLayout { (section, _) in
            let layoutProvider = ChampionMainCollectionViewLayoutProvider()
            switch section {
            case 0:
                return layoutProvider.favoriteSectionLayout()
            default:
                return layoutProvider.mainListSectionLayout()
            }
        }
        collectionView.setCollectionViewLayout(layout, animated: true)
    }
    
    private func setLayoutIndicatorView() {
        view.addSubview(indicatorView)
        indicatorView.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
}

