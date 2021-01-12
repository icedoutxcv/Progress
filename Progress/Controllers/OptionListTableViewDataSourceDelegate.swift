//
//  OptionListTableViewDataSourceDelegate.swift
//  Progress
//
//  Created by xcv on 25/12/2020.
//

import Foundation
import UIKit

extension OptionListTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.options(option: type).count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: OptionListTableViewCell.identifier, for: indexPath) as! OptionListTableViewCell
        cell.configure(with: model.options(option: type)[indexPath.row])
        
        let selectedIndexes = model.options(option: type)[indexPath.row]
        
        if selectedIndexes.isSelected == true {
            cell.setSelected(true, animated: true)
        } else {
            cell.setSelected(false, animated: true)
        }
        
        if cell.name.text == selectedOption {
            cell.setSelected(true, animated: false)
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let indexPath = tableView.indexPathForSelectedRow {
            tableView.deselectRow(at: indexPath, animated: true)
        }
        
        lastSelectedRow = currentlySelectedRow
        currentlySelectedRow = indexPath
        
        if let previousCell = tableView.cellForRow(at: IndexPath(row: lastSelectedRow?.row ?? 0, section: indexPath.section)) {
            previousCell.setSelected(false, animated: true)
        }
        
        if let cell = tableView.cellForRow(at: indexPath) {
            if cell.accessoryType == .none {
                cell.setSelected(true, animated: true)
            } else {
                cell.setSelected(false, animated: true)
            }
        }
        
        guard let currentlySelectedRow = currentlySelectedRow?.row else { return }
        let valueForcurrentlySelectedRow = model.options(option: type)[currentlySelectedRow].title
        
        optionsDelegate?.didSelectOption(type: type, option: OptionCellModel(title: valueForcurrentlySelectedRow), row: indexPath.row)
        selectedOption = valueForcurrentlySelectedRow
        
        model.updateData(selectedOption: selectedOption ?? "other", type: type)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}

