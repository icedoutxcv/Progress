//
//  ViewController.swift
//  Progress
//
//  Created by xcv on 21/11/2020.
//

import UIKit


class GalleryViewController: UIViewController, AddViewControllerDelegate, ItemDetailsViewControllerDelegate {
    let dataManager = DataManager()

    var tableView = UITableView()
    var model =  GalleryModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        updateData()
    }
    
    func setup() {
        title = "Gallery"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(presentAddViewController))
                
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
    
    func didAddItem() {
        updateData()
    }
    
    func didDeleteItem() {
        updateData()
    }
    
    func didSelectItem(item: Item) {
        let navigationController = UINavigationController()
        
        let addEditViewController = AddEditViewController(type: .old, navTitle: .edit)
        addEditViewController.item = item
        addEditViewController.delegate = self
        
        navigationController.addChild(addEditViewController)

        self.present(navigationController, animated: true)
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

