//
//  ChampionMainFavoriteListCell.swift
//  LOLInfoApp
//
//  Created by 정덕호 on 2024/02/24.
//

import SnapKit
import UIKit


final class ChampionMainListCell: UICollectionViewCell {
    
    // MARK: - Identifier
    
    static let identifier = "ChampionMainListCell"
    
    // MARK: - Enum
    
    private enum Metric {
        static let imageViewCornerRadius: CGFloat = 18.5
        static let imageViewSize: CGFloat = 45
        static let imageViewBoarder: CGFloat = 1
        static let nameAndTitleLabelCenterY: CGFloat = -imageViewSize / 4
        static let nameAndTitleLabelLeading: CGFloat = 6
        static let roleLabelTop: CGFloat = 2
    }
    
    private enum Color {
        static let imageViewBorder = UIColor.Custom.reverseBase.color
        static let imageViewBackground = UIColor.gray
        static let roleLabelText = UIColor.systemGray
    }
    
    private enum Font {
        static let nameAndTitleLabel = UIFont.systemFont(ofSize: 15, weight: .semibold)
        static let roleLabel = UIFont.systemFont(ofSize: 14, weight: .medium)
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
    
    private let nameAndTitleLabel: UILabel = {
        let label = UILabel()
        label.font = Font.nameAndTitleLabel
        return label
    }()
    
    private let roleLabel: UILabel = {
        let label = UILabel()
        label.textColor = Color.roleLabelText
        label.font = Font.roleLabel
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
        contentView.backgroundColor = .Custom.base.color
    }
    
    // MARK: - Layout Function
    
    private func setLayout() {
        setLayoutImageView()
        setLayoutNameAndTitleLabel()
        setLayoutRoleLabel()
    }
    
    private func setLayoutImageView() {
        contentView.addSubview(imageView)
        imageView.snp.makeConstraints {
            $0.width.height.equalTo(Metric.imageViewSize)
            $0.centerY.leading.equalToSuperview()
        }
    }
    
    private func setLayoutNameAndTitleLabel() {
        contentView.addSubview(nameAndTitleLabel)
        nameAndTitleLabel.snp.makeConstraints {
            $0.centerY.equalTo(imageView).offset(
                Metric.nameAndTitleLabelCenterY
            )
            $0.leading.equalTo(imageView.snp.trailing).offset(
                Metric.nameAndTitleLabelLeading
            )
            $0.trailing.equalToSuperview()
        }
    }
    
    private func setLayoutRoleLabel() {
        contentView.addSubview(roleLabel)
        roleLabel.snp.makeConstraints {
            $0.top.equalTo(nameAndTitleLabel.snp.bottom).offset(
                Metric.roleLabelTop
            )
            $0.leading.trailing.equalTo(nameAndTitleLabel)
        }
    }
}
