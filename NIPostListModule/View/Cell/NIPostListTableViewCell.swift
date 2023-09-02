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
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var previewTextLabel: UILabel!
    @IBOutlet weak var likesLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var expandButton: UIButton!
    
    //MARK: - Properties -
    private var isExpanded = false
    static let identifier = "PostListCell"
    var cellUpdate: (() -> Void)!
    
    // MARK: - Life Cycle -
    
    // MARK: - Iternal -
    override func layoutSubviews() {
        super.layoutSubviews()
        
        setupExpandButton()
    }
    
    @IBAction func didTapExpandButton(_ sender: UIButton) {
        setButtonTitle()
        cellUpdate()
    }
    
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
    
    static func nib() -> UINib {
        return UINib(nibName: "NIPostListTableViewCell", bundle: nil)
    }

    func configure(update: @escaping () -> Void) {
        cellUpdate = update
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
}
