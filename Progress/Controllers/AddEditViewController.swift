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

class AddEditViewController: UIViewController, AddViewControllerDelegate, TitleCellDelegate, OptionListDelegate, ProgressCellDelegate, NotesCellDelegate  {

    let dataManager = DataManager()

    var tableView = UITableView()
    
    var model = FormModel()
    lazy var item = Item(context: dataManager.context)
    
    var type: FormType
    var delegate: AddViewControllerDelegate!
    var navTitle: Title
    
    init(type: FormType, navTitle: Title) {
        self.type = type
        self.navTitle = navTitle
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        configure()
    }
    
    func setup() {
        
        switch navTitle {
            case .add:
                navigationItem.title = "Add"
            case .edit:
                navigationItem.title = "Edit"
        }
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
        tableView.register(AddViewProgressCell.nib(), forCellReuseIdentifier: AddViewProgressCell.identifier)
        tableView.register(AddViewNotesCell.nib(), forCellReuseIdentifier: AddViewNotesCell.identifier)
        
        view = tableView
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    
    func configure() {
        if type == .old {
            model.title.title = item.name
            model.colors.subtitle = item.color
            model.types.subtitle = item.type
            model.progress.textFieldFirst = item.start
            model.progress.textFieldSecond = item.end
            model.progress.subtitle = item.unit
            model.notes.text = item.notes
        }
    }
    
    @objc func save() {
        view.endEditing(true)
        
        switch type {
            case .new:
                dataManager.addItem(name: model.title.title, type: model.types.subtitle, color: model.colors.subtitle, start: model.progress.textFieldSecond, end: model.progress.textFieldSecond, unit: model.progress.subtitle, notes: model.notes.text)
            case .old:
                dataManager.editItem(item: item, name: model.title.title, type: model.types.subtitle, color: model.colors.subtitle, start: model.progress.textFieldSecond, end: model.progress.textFieldSecond, unit: model.progress.subtitle, notes: model.notes.text)
        }
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
    
    func didAddItem() {
        delegate.didAddItem()
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
     
    func didEndEditingTitle(text: String) {
        model.title.title = text
    }
    
    
    func didEndedWritingNote(text: String) {
        model.notes.text = text
    }
    
    
    func didTappedUnitButton() {
        self.showOptions()
    }
    
    func didEnterStartValue(text: String) {
        model.progress.textFieldFirst = text
    }
    
    func didEnterEndValue(text: String) {
        model.progress.textFieldSecond = text
    }
    
    @objc func showOptions() {
        let ac = UIAlertController(title: "Units", message: "", preferredStyle: .alert)
        
        for unit in Units.items {
            ac.addAction(UIAlertAction(title: unit.name, style: .default, handler: { (ac) in
                self.model.progress.subtitle = unit.name
                self.tableView.reloadData()
            }))
        }
        present(ac, animated: true)
    }
}

