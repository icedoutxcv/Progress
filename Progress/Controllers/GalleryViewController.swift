//
//  ViewController.swift
//  Progress
//
//  Created by xcv on 21/11/2020.
//

import UIKit


class GalleryViewController: UIViewController, AddViewControllerDelegate, ItemDetailsViewControllerDelegate, ItemActionDelegate {
    let dataManager = DataManager()

    var tableView = UITableView()
    var model =  GalleryModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
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
        
        updateData()
    }
    
    func updateData() {
        model.objects = dataManager.getObjects()
        tableView.reloadData()
    }
    
    
    func didAddItem() {
        updateData()
    }
    
    func didDeleteItem() {
        updateData()
    }
    
    func didSelectItem(item: Item) {
        let navigationController = UINavigationController()
    
        let itemDetailsViewController = ItemDetailsViewController(nibName: nil, bundle: nil)
        itemDetailsViewController.modalTransitionStyle = .coverVertical
        itemDetailsViewController.model = item
        itemDetailsViewController.delegate = self
        itemDetailsViewController.itemActionDelegate = self
        
        navigationController.addChild(itemDetailsViewController)

        self.present(navigationController, animated: true)
    }
        
    @objc func presentAddViewController() {
        let navigationController = UINavigationController()
    
        let addViewController = AddViewController(nibName: nil, bundle: nil)
        addViewController.modalTransitionStyle = .coverVertical
        addViewController.delegate = self
        
        navigationController.addChild(addViewController)

        self.present(navigationController, animated: true)
    }
}

