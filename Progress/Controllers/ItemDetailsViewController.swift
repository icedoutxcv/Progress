//
//  ItemDetailsViewController.swift
//  Progress
//
//  Created by xcv on 27/12/2020.
//

import UIKit

protocol ItemActionDelegate {
    func didDeleteItem()
}

class ItemDetailsViewController: UIViewController, UITextViewDelegate, ItemDetailsViewDelegate {
    let dataManager = DataManager()

    var detailsView = ItemDetailsView()
    var model: Item?
    
    var delegate: ItemDetailsViewControllerDelegate!
    var itemActionDelegate: ItemActionDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup() {
        navigationItem.title = "Notes"
        navigationController?.navigationBar.barStyle = .default
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = .systemBackground
        navigationController?.navigationBar.tintColor = UIColor { tc in
            switch tc.userInterfaceStyle {
            case .dark:
                return UIColor.white
            default:
                return UIColor.black
            }
        }
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancel))
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: nil, action: #selector(save))
        
        guard let model = model else { return }
     
        detailsView.configure(with: model)
    }
    
    override func loadView() {
        view = detailsView
        detailsView.notesTextView.delegate = self
        detailsView.notesTextView.becomeFirstResponder()
        detailsView.delegate = self
    }
    
    func didTappedDeleteButton() {
        delete()
    }

    @objc func save() {
        guard let model = model else { return }
        guard let notes = detailsView.notesTextView.text else { return }
        
        dataManager.editNote(item: model, notes: notes)
        dismiss(animated: true, completion: nil)
    }
    
    @objc func delete() {
        guard let model = model else { return }
        dataManager.deleteObject(item: model)
        itemActionDelegate.didDeleteItem()
        
        dismiss(animated: true, completion: nil)
    }
    
    @objc func cancel() {
        dismiss(animated: true, completion: nil)
    }

}
