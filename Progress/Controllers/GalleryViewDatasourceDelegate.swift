//
//  CollectionViewDataSource.swift
//  Progress
//
//  Created by xcv on 21/11/2020.
//

import Foundation
import UIKit

extension GalleryViewController:  UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return model.objects.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: GalleryViewCell.identifier, for: indexPath) as! GalleryViewCell
        let items = model.objects[indexPath.section].items
        cell.configure(with: items)
        cell.collectionView.reloadData()
        cell.delegate = self
        
        return cell
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "\(model.objects[section].sectionName.categoryName())"
    }
        
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 30))
        headerView.backgroundColor = .systemBackground
        
        let label = UILabel()
        label.frame = CGRect.init(x: 15, y: 10, width: headerView.frame.width-10, height: headerView.frame.height-10)
        label.font = UIFont(name: "Avenir-Book", size: 18)
        label.text = model.objects[section].sectionName.categoryName()
        
        label.textColor =  UIColor { tc in
            switch tc.userInterfaceStyle {
            case .dark:
                return UIColor.white
            default:
                return UIColor.black
            }
        }
        
        headerView.addSubview(label)
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
    
}

