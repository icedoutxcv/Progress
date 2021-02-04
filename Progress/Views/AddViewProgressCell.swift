//
//  AddViewProgressCell.swift
//  Progress
//
//  Created by KB on 23/01/2021.
//

import UIKit

protocol ProgressCellDelegate {
    func didTappedUnitButton()
    func didEnterStartValue(text: String)
    func didEnterEndValue(text: String)
}

class AddViewProgressCell: UITableViewCell, AddViewControllerDelegate, ProgressCellDelegate, UITextFieldDelegate {
    func didAddItem() {}
    
    var delegate: ProgressCellDelegate!
    
    static let identifier = "AddViewProgressCell"
    
    @IBOutlet weak var startDateTextField: UITextField!

    @IBOutlet weak var endDateTextField: UITextField!
    
    @IBOutlet weak var unitButton: UIButton!
    
    @IBAction func didTappedUnitButton(_ sender: UIButton) {
        delegate.didTappedUnitButton()
    }
    
    func configure(with model: CellModel) {
        startDateTextField.text = model.textFieldFirst
        endDateTextField.text = model.textFieldSecond
        unitButton.setTitle(model.subtitle, for: .normal)
    }

    static func nib() -> UINib {
        return UINib(nibName: "AddViewProgressCell", bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        startDateTextField.delegate = self
        endDateTextField.delegate = self

        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func didTappedUnitButton() {
//        delegate.di
    }

//
    func didEnterStartValue(text: String) {
        delegate.didEnterStartValue(text: startDateTextField.text ?? "")
    }

    func didEnterEndValue(text: String) {
        delegate.didEnterEndValue(text: endDateTextField.text ?? "")
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        didEnterStartValue(text: startDateTextField.text ?? "")
        didEnterEndValue(text: endDateTextField.text ?? "")

    }
    
    
    
    
}
