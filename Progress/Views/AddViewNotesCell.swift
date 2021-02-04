//
//  AddViewNotesCell.swift
//  Progress
//
//  Created by xcv on 25/01/2021.
//

import UIKit


protocol NotesCellDelegate {
    func didEndedWritingNote(text: String)
}

class AddViewNotesCell: UITableViewCell, NotesCellDelegate, UITextViewDelegate {
    func didEndedWritingNote(text: String) {
        delegate.didEndedWritingNote(text: notes.text)

    }
    
    var delegate: NotesCellDelegate!
    
    func didAddItem() {}
    
    static let identifier = "AddViewNotesCell"

    
    @IBOutlet weak var notes: UITextView!
    
    static func nib() -> UINib {
        return UINib(nibName: "AddViewNotesCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        notes.delegate = self
    }
    
    func setupViews() {
        notes.backgroundColor =  UIColor { tc in
            switch tc.userInterfaceStyle {
            case .dark:
                return UIColor.white
            default:
                return UIColor.black
            }
        }
    }
    
    func configure(model: CellModel) {
        self.notes.text = model.text
    }
    
    func textViewDidChange(_ textView: UITextView) {
        didEndedWritingNote(text: textView.text)
    }
    
}
