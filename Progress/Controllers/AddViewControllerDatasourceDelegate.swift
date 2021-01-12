//
//  AddViewControllerDatasourceDelegate.swift
//  Progress
//
//  Created by xcv on 25/12/2020.
//

import Foundation
import UIKit

extension AddViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.models().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = self.model.models()[indexPath.row]
        
        switch model.type {
        case .title:
            let cell = tableView.dequeueReusableCell(withIdentifier: AddViewTitleCell.identifier, for: indexPath) as! AddViewTitleCell
            cell.name.delegate = self
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: AddViewCell.identifier, for: indexPath) as! AddViewCell
            cell.configure(with: model)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        let model = self.model.models()[indexPath.row]
    
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
        return 60
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        model.title.title = textField.text ?? ""
    }
}
