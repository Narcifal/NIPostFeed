//
//  NIPostListTableViewCell.swift
//  NIPostFeed
//
//  Created by Denys Niestierov on 30.08.2023.
//

import UIKit

final class NIPostListTableViewCell: UITableViewCell {
    
    private struct Constant {
        static let expandButtonTitle = "Expand"
        static let collapseButtonTitle = "Collapse"
    }
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var previewTextLabel: UILabel!
    @IBOutlet private weak var likesLabel: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var expandButton: UIButton!
    
    //MARK: - Properties -
    static let identifier = "PostListCell"
    private var isExpanded = false
    var cellUpdate: (() -> Void)!
    
    // MARK: - Life Cycle -
    override func layoutSubviews() {
        super.layoutSubviews()
        
        setupExpandButton()
    }
    
    // MARK: - Iternal -
    var cellModel: NIPost? {
        didSet {
            if let cell = self.cellModel {
                self.titleLabel.text = cell.title
                self.previewTextLabel.text = cell.previewText
                self.likesLabel.text = String(cell.likesCount)
                self.dateLabel.text = cell.timeshamp.toDateString()
                self.isExpandButtonNeeded()
            }
        }
    }
    
    func configure(update: @escaping () -> Void) {
        cellUpdate = update
        cellUpdate()
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "NIPostListTableViewCell", bundle: nil)
    }
}

private extension NIPostListTableViewCell {
    
    func setupExpandButton() {
        expandButton.layer.cornerRadius = 15
        expandButton.layer.cornerCurve = .continuous
    }
    
    func isExpandButtonNeeded() {
        let isNeeded = previewTextLabel.maxNumberOfLines - 1 <= 2
        expandButton.isHidden = isNeeded
    }
    
    func setButtonTitle() {
        let buttonTitle = isExpanded ? Constant.expandButtonTitle : Constant.collapseButtonTitle
        isExpanded = buttonTitle == Constant.expandButtonTitle ? false : true
        expandButton.setTitle(buttonTitle, for: .normal)
        previewTextLabel.numberOfLines = isExpanded ? 0 : 2
    }
    
    @IBAction func didTapExpandButton(_ sender: UIButton) {
        setButtonTitle()
        cellUpdate()
    }
}
