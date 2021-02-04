//
//  AddViewTitleCell.swift
//  Progress
//
//  Created by xcv on 05/12/2020.
//

import UIKit

protocol TitleCellDelegate {
    func didEndEditingTitle(text: String)
}

class AddViewTitleCell: UITableViewCell, UITextFieldDelegate, TitleCellDelegate {
    static let identifier = "AddViewTitleCell"

    @IBOutlet weak var name: UITextField!
    
    var delegate: TitleCellDelegate!
    
    static func nib() -> UINib {
        return UINib(nibName: "AddViewTitleCell", bundle: nil)
    }
    
    func configure(with model: CellModel) {
        name.text = model.title
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        name.delegate = self
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("end")
        delegate.didEndEditingTitle(text: textField.text ?? "")
    }
    
    func didEndEditingTitle(text: String) {
        print(text)
    }
}
