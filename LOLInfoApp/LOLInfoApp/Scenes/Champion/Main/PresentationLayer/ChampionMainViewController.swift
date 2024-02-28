//
//  ChampionMainViewController.swift
//  LOLInfoApp
//
//  Created by 정덕호 on 2024/02/05.
//

import UIKit

import SnapKit

final class ChampionMainViewController: UIViewController {
    
    // MARK: - Literal
    
    private enum Text {
        static let navigationTitle: String = "챔피언"
        static let searchControllerPlaceholder: String = "챔피언 검색"
    }
    
    // MARK: - Properties
    
    private let searchController: UISearchController = {
        let controller = UISearchController()
        controller.searchBar.placeholder = Text.searchControllerPlaceholder
        return controller
    }()
    private let collectionView: UICollectionView = ChampionMainCollectionView()
    private let indicatorView = UIActivityIndicatorView(style: .large)
    
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
        view.backgroundColor = .baseColor
        title = Text.navigationTitle
    }
    
    private func configureNavigationController() {
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        navigationItem.searchController = searchController
    }
    
    private func configureCollectionView() {
        collectionView.backgroundColor = .baseColor
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
    }
    
    private func setLayoutIndicatorView() {
        view.addSubview(indicatorView)
        indicatorView.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
}


