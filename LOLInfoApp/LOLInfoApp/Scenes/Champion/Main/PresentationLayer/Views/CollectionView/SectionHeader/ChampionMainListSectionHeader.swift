//
//  ChampionMainListSectionHeader.swift
//  LOLInfoApp
//
//  Created by 정덕호 on 2024/02/25.
//

import UIKit

final class ChampionMainListSectionHeader: UICollectionReusableView {
    
    // MARK: - Identifier
    
    static let identifier: String = "ChampionMainListSectionHeader"
    
    // MARK: - Literal
    
    private enum Metric {
        static let separatorViewHeight: CGFloat = 8
        static let segmentedControlHeight: CGFloat = 30
        static let segmentedControlTopAndBottom: CGFloat = 15
        static let segmentedControlSide: CGFloat = 10
        static let segmentedMarksManIndex: Int = 4
        static let segmentedMarksManWidth: CGFloat = 80
    }
    
    private enum Text {
        static let segmentedControlFirstItem: String = "전체"
    }
    
    private enum Color {
        static let separatorView: UIColor? = .Custom.separator.color
    }
    
    // MARK: - Properties
    
    private let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = Color.separatorView
        return view
    }()
    
    private let segmentedControl: UISegmentedControl = {
        var items = [Text.segmentedControlFirstItem]
        ChampionMainListEntity.RoleGroup.allCases.forEach {
            items.append($0.rawValue)
        }
        let segmentedControl = UISegmentedControl(items: items)
        segmentedControl.setWidth(
            Metric.segmentedMarksManWidth, forSegmentAt: Metric.segmentedMarksManIndex
        )
        segmentedControl.selectedSegmentIndex = 0
        return segmentedControl
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
        setLayoutSegmentedControl()
    }
    
    private func setLayoutSeparatorView() {
        addSubview(separatorView)
        separatorView.snp.makeConstraints {
            $0.height.equalTo(Metric.separatorViewHeight)
            $0.top.leading.trailing.equalToSuperview()
        }
    }
    
    private func setLayoutSegmentedControl() {
        addSubview(segmentedControl)
        segmentedControl.snp.makeConstraints {
            $0.height.equalTo(Metric.segmentedControlHeight)
            $0.top.equalTo(separatorView.snp.bottom).offset(Metric.segmentedControlTopAndBottom)
            $0.bottom.equalToSuperview().inset(Metric.segmentedControlTopAndBottom)
            $0.leading.trailing.equalToSuperview().inset(Metric.segmentedControlSide)
        }
    }
}
