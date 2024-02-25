//
//  ChampionMainFavoriteListSectionHeader.swift
//  LOLInfoApp
//
//  Created by 정덕호 on 2024/02/25.
//

import UIKit

final class ChampionMainFavoriteListSectionHeader: UICollectionReusableView {
    
    // MARK: - Identifier
    
    static let identifier: String = "ChampionMainFavoriteListSectionHeader"
    
    // MARK: - Literal
    
    private enum Metric {
        static let separatorViewHeight: CGFloat = 8
        static let titleLabelLeading: CGFloat = 16
        static let titleLabelTopAndBottom: CGFloat = 15
    }
    
    private enum Text {
        static let titleLabel: String = "즐겨찾기한 챔피언"
    }
    
    private enum Color {
        static let separatorViewBackground: UIColor? = .Custom.separator.color
    }
    
    private enum Font {
        static let titleLabel: UIFont = .systemFont(ofSize: 25, weight: .bold)
    }
    
    // MARK: - Properties
    
    private let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = Color.separatorViewBackground
        return view
    }()

    private let titleLabel: UILabel = {
       let label = UILabel()
        label.text = Text.titleLabel
        label.font = Font.titleLabel
        return label
    }()
    
    // MARK: - LifeCycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Layout Function
    
    private func setLayout() {
        setLayoutSeparatorView()
        setLayoutTitleLabel()
    }
    
    private func setLayoutSeparatorView() {
        addSubview(separatorView)
        separatorView.snp.makeConstraints {
            $0.height.equalTo(Metric.separatorViewHeight)
            $0.top.leading.trailing.equalToSuperview()
        }
    }
    
    private func setLayoutTitleLabel() {
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(separatorView.snp.bottom).offset(Metric.titleLabelTopAndBottom)
            $0.leading.equalToSuperview().offset(Metric.titleLabelLeading)
            $0.bottom.equalToSuperview().inset(Metric.titleLabelTopAndBottom)
        }
    }
}
