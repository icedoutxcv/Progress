//
//  ListTableViewController.swift
//  Progress
//
//  Created by xcv on 05/12/2020.
//

import UIKit

protocol OptionListDelegate {
    func didSelectOption(type: OptionListType, option: OptionCellModel, row: Int)
}

class OptionListTableViewController: UITableViewController {
    var model = OptionListModel()
    var type: OptionListType
    var selectedOption: String?
    var optionsDelegate: OptionListDelegate!

    var lastSelectedRow: IndexPath?
    var currentlySelectedRow: IndexPath?
    
    init(type: OptionListType = .colors) {
        self.type = type
        super.init(style: .plain)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        guard let selectedOption = selectedOption else { return }
        model.updateData(selectedOption: selectedOption, type: type)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       setup()
    }
    
    func setup() {
        tableView.register(OptionListTableViewCell.nib(), forCellReuseIdentifier: OptionListTableViewCell.identifier)
        tableView.allowsMultipleSelection = false
    }
    
}
