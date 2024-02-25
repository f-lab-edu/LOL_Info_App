//
//  ChampionMainListCell.swift
//  LOLInfoApp
//
//  Created by 정덕호 on 2024/02/24.
//

import UIKit

final class ChampionMainFavoriteListCell: UICollectionViewCell {
    
    // MARK: - Identifier
    
    static let identifier = "ChampionMainFavoriteListCell"
    
    // MARK: - Literal
    
    private enum Metric {
        static let imageViewCornerRadius: CGFloat = 18.5
        static let imageViewSize: CGFloat = 50
        static let imageViewBoarder: CGFloat = 1
        static let imageViewBottom: CGFloat = 10
    }
    
    private enum Color {
        static let backgroundColor: UIColor? = .Custom.base.color
        static let imageViewBorder: UIColor? = .Custom.reverseBase.color
        static let imageViewBackground: UIColor? = .gray
    }
    
    private enum Font {
        static let nameLabel: UIFont = .systemFont(ofSize: 15, weight: .semibold)
    }
    
    // MARK: - Properties

    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.layer.borderWidth = Metric.imageViewBoarder
        imageView.layer.cornerRadius = Metric.imageViewCornerRadius
        imageView.layer.borderColor = Color.imageViewBorder?.cgColor
        imageView.backgroundColor = Color.imageViewBackground
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = Font.nameLabel
        label.textAlignment = .center
        return label
    }()
    
    // MARK: - LifeCycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureInit()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Configure Function
    
    private func configureInit() {
        contentView.backgroundColor = Color.backgroundColor
    }
    
    // MARK: - Layout Function
    
    private func setLayout() {
        setLayoutImageView()
        setLayoutNameLabel()
    }
    
    private func setLayoutImageView() {
        contentView.addSubview(imageView)
        imageView.snp.makeConstraints {
            $0.top.centerX.equalToSuperview()
            $0.width.height.equalTo(Metric.imageViewSize)
        }
    }
    
    private func setLayoutNameLabel() {
        contentView.addSubview(nameLabel)
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(Metric.imageViewBottom)
            $0.bottom.leading.trailing.equalToSuperview()
        }
    }

}
