//
//  AddViewTitleCell.swift
//  Progress
//
//  Created by xcv on 05/12/2020.
//

import UIKit

class AddViewTitleCell: UITableViewCell {
    static let identifier = "AddViewTitleCell"

    @IBOutlet weak var name: UITextField!
    
    static func nib() -> UINib {
        return UINib(nibName: "AddViewTitleCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
