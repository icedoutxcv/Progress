//
//  AddViewControllerDatasourceDelegate.swift
//  Progress
//
//  Created by xcv on 25/12/2020.
//

import Foundation
import UIKit

extension AddEditViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.objects().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = self.model.objects()[indexPath.row]
        
        switch model.type {
        case .title:
            let cell = tableView.dequeueReusableCell(withIdentifier: AddViewTitleCell.identifier, for: indexPath) as! AddViewTitleCell
            cell.delegate = self
            cell.configure(with: model)
            return cell
        case .colors, .types:
            let cell = tableView.dequeueReusableCell(withIdentifier: AddViewCell.identifier, for: indexPath) as! AddViewCell
            cell.configure(with: model)
            return cell
        case .textFields:
            let cell = tableView.dequeueReusableCell(withIdentifier: AddViewProgressCell.identifier, for: indexPath) as! AddViewProgressCell
            cell.delegate = self
            cell.configure(with: model)
            return cell
        case .notes:
            let cell = tableView.dequeueReusableCell(withIdentifier: AddViewNotesCell.identifier, for: indexPath) as! AddViewNotesCell
            cell.configure(model: model)
            cell.delegate = self
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        let model = self.model.objects()[indexPath.row]
    
        switch model.type {
        case .colors:
            view.endEditing(true)

            let optionViewController = OptionListTableViewController(type: .colors)
            optionViewController.optionsDelegate = self
            optionViewController.selectedOption = model.subtitle
            navigationController?.pushViewController(optionViewController, animated: true)
        case .types:
            view.endEditing(true)
            
            let optionViewController = OptionListTableViewController(type: .type)
            optionViewController.optionsDelegate = self
            optionViewController.selectedOption = model.subtitle
            navigationController?.pushViewController(optionViewController, animated: true)
        default:
            return
        }
    }
        
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        // MARK: Set 160 for NotesCell
        if indexPath.row == 4 {
            return 160
        }
        return 60
    }
}
