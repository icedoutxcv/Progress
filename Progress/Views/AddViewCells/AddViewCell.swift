//
//  AddViewCell.swift
//  Progress
//
//  Created by xcv on 05/12/2020.
//

import UIKit

class AddViewCell: UITableViewCell {
    static let identifier = "AddViewCell"

    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var moreIcon: UIImageView!
    @IBOutlet weak var option: UILabel!
    
    static func nib() -> UINib {
        return UINib(nibName: "AddViewCell", bundle: nil)
    }
    
    public func configure(with model: CellModel) {
        self.icon.image = model.icon
        self.title.text = model.title
        self.option.text = model.subtitle
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
}
