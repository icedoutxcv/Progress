//
//  ViewController.swift
//  Progress
//
//  Created by xcv on 21/11/2020.
//

import UIKit

class GalleryViewController: UIViewController {
    
    // MARK: Data
    let dataManager = DataManager()
    var model =  GalleryModel()

    // MARK: UI
    var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewController()
        setupTableView()
        updateData()
    }
    
    func setupViewController() {
        title = "Gallery"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(presentAddViewController))
    }
    
    func setupTableView() {
        tableView = UITableView(frame: view.frame, style: .plain)
        tableView.register(GalleryViewCell.nib(), forCellReuseIdentifier: GalleryViewCell.identifier)
        view = tableView
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }

    func updateData() {
        model.objects = dataManager.getObjects()
        
        UIView.transition(with: tableView, duration: 1.0, options: .transitionCrossDissolve , animations: {
            self.tableView.reloadData()
        })
    }
    
    @objc func presentAddViewController() {
        let navigationController = UINavigationController()
    
        let addViewController = AddEditViewController(type: .new, navTitle: .add)
        addViewController.modalTransitionStyle = .coverVertical
        addViewController.delegate = self
        
        navigationController.addChild(addViewController)

        self.present(navigationController, animated: true)
    }

        
}

extension GalleryViewController: AddEditViewControllerDelegate, ItemDetailsViewControllerDelegate  {
    func didAddItem() {
        updateData()
    }
    
    func didDeleteItem() {
        updateData()
    }
    
    func didLongPressItem(item: Item) {
        let refreshAlert = UIAlertController(title: "Deleting item", message: "", preferredStyle: UIAlertController.Style.alert)

        refreshAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
            self.dataManager.deleteObject(item: item)
            self.updateData()
        }))

        refreshAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action: UIAlertAction!) in
            self.dismiss(animated: true, completion: nil)
        }))

        present(refreshAlert, animated: true, completion: nil)
    
    }
    
    func didSelectItem(item: Item) {
        let navigationController = UINavigationController()
        
        let addEditViewController = AddEditViewController(type: .old, navTitle: .edit)
        addEditViewController.item = item
        addEditViewController.delegate = self
        
        navigationController.addChild(addEditViewController)
        self.present(navigationController, animated: true)
    }
}

