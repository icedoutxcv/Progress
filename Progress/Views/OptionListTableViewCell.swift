//
//  OptionListTableViewCell.swift
//  Progress
//
//  Created by xcv on 05/12/2020.
//

import UIKit

class OptionListTableViewCell: UITableViewCell {
    static let identifier = "OptionListTableViewCell"

    @IBOutlet weak var name: UILabel!
    
    static func nib() -> UINib {
        return UINib(nibName: "OptionListTableViewCell", bundle: nil)
    }
    
    public func configure(with model: OptionCellModel) {
        self.name.text = model.title
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        accessoryType = selected ? .checkmark : .none
    }
    
    
}
