//
//  AddViewController.swift
//  Progress
//
//  Created by xcv on 05/12/2020.
//

import Foundation
import UIKit

protocol AddViewControllerDelegate {
    func didAddItem()
}

class AddViewController: UIViewController, OptionListDelegate, UITextFieldDelegate {
    let dataManager = DataManager()

    var tableView = UITableView()
    var model = FormModel()
    var delegate: AddViewControllerDelegate!

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    func setup() {
        navigationItem.title = "Add item"
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
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(save))
                
        tableView = UITableView(frame: view.frame, style: .plain)
        tableView.register(AddViewCell.nib(), forCellReuseIdentifier: AddViewCell.identifier)
        tableView.register(AddViewTitleCell.nib(), forCellReuseIdentifier: AddViewTitleCell.identifier)
        view = tableView
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    @objc func save() {
        view.endEditing(true)
        dataManager.addItem(name: model.title.title, type: model.types.subtitle, color: model.colors.subtitle)
        dismiss(animated: true) {
            self.delegate?.didAddItem()
        }
    }
    
    @objc func cancel() {
        dismiss(animated: true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
            
    func didSelectOption(type: OptionListType, option: OptionCellModel, row: Int) {
        switch type {
        case .colors:
            model.colors.subtitle = option.title
        case .type:
            model.types.subtitle = option.title
        }
        
        tableView.reloadData()
    }
}

