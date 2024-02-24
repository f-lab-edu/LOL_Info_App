//
//  ChampionMainViewController.swift
//  LOLInfoApp
//
//  Created by 정덕호 on 2024/02/05.
//

import SnapKit
import UIKit

final class ChampionMainViewController: UIViewController {
    
    // MARK: - Properties
    
    private let searchController: UISearchController = {
        let controller = UISearchController()
        controller.searchBar.placeholder = "챔피언 검색"
        controller.searchBar.setValue("취소", forKey: "cancelButtonText")
        return controller
    }()

    private let collectionView: UICollectionView = {
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: .init()
        )
        return collectionView
    }()
    
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
        view.backgroundColor = .Custom.base.color
        title = "챔피언"
    }
    
    private func configureNavigationController() {
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        navigationItem.searchController = searchController
    }
    
    private func configureCollectionView() {
        collectionView.backgroundColor = .Custom.base.color
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

