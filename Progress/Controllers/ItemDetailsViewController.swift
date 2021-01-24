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
        navigationItem.title = "Details"
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
        
        
      let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
      detailsView.addGestureRecognizer(tap)
        
        guard let model = model else { return }
     
        detailsView.configure(with: model)
    }
    
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        let scrollPoint : CGPoint = CGPoint.init(x:0, y: textView.frame.origin.y)
        self.detailsView.notesTextView.setContentOffset(scrollPoint, animated: true)
    }

    func textViewDidEndEditing(_ textView: UITextView) {
//        self.detailsView.notesTextView.setContentOffset(CGPoint.zero, animated: true)
    }
    
    
    
    override func loadView() {
        view = detailsView
        detailsView.notesTextView.delegate = self
        detailsView.notesTextView.becomeFirstResponder()
        detailsView.unitButton.addTarget(self, action: #selector(showOptions), for: .touchUpInside)
        detailsView.delegate = self
    }
    
    @objc func showOptions() {
        let ac = UIAlertController(title: "Units", message: "", preferredStyle: .alert)
        
        for unit in Units.items {
            ac.addAction(UIAlertAction(title: unit.name, style: .default, handler: { (ac) in
                self.detailsView.unitButton.setTitle(unit.name, for: .normal)
            }))
        }
        present(ac, animated: true)
    }
    
    func didTappedDeleteButton() {
        showConfimDeleteAlert()
    }

    @objc func save() {
        guard let model = model else { return }
        guard let notes = detailsView.notesTextView.text else { return }
        guard let startValue = detailsView.startTextField.text else { return }
        guard let endValue = detailsView.startTextField.text else { return }
        guard let unit = detailsView.unitButton.titleLabel?.text else { return }
        
        dataManager.edit(item: model, notes: notes, start: startValue, end: endValue, unit: unit)
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
     
    func showConfimDeleteAlert() {
        let alert = UIAlertController(title: "Delete", message: "Item will be deleted!", preferredStyle: UIAlertController.Style.alert)

        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
            self.delete()
        }))

        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action: UIAlertAction!) in
            alert.dismiss(animated: true, completion: nil)
        }))

        present(alert, animated: true, completion: nil)
    }

}
