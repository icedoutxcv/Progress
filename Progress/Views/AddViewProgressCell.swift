//
//  AddViewProgressCell.swift
//  Progress
//
//  Created by KB on 23/01/2021.
//

import UIKit

class AddViewProgressCell: UITableViewCell {
    
    static let identifier = "AddViewProgressCell"
    
    @IBOutlet weak var startDateTextField: UITextField!

    @IBOutlet weak var endDateTextField: UITextField!
    
    
    @IBOutlet weak var unitButton: UIButton!
    
    static func nib() -> UINib {
        return UINib(nibName: "AddViewProgressCell", bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
