//
//  ItemDetailsView.swift
//  Progress
//
//  Created by xcv on 27/12/2020.
//

import UIKit;

protocol ItemDetailsViewDelegate {
    func didTappedDeleteButton()
    func didTappedEditButton()
}

class ItemDetailsView: UIView {
    var delegate: ItemDetailsViewDelegate!

    var titleContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        
        return view
    }()
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.clipsToBounds = true
        
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 34)
        label.textAlignment = .left
        
        return label
    }()

    var deleteButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.clipsToBounds = true
        
        button.setTitle("Delete", for: .normal)
        button.setTitleColor(.systemRed, for: .normal)
        button.setTitleColor(UIColor.init(white: 1, alpha: 0.3), for: .highlighted)
        button.addTarget(self, action: #selector(deleteItem), for: .touchUpInside)
        
        return button
    }()
    
    var modifyButtonContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        
        return view
    }()
    
    
    var modifyButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.clipsToBounds = true
        
        button.setTitle("Edit", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.setTitleColor(UIColor.init(white: 1, alpha: 0.3), for: .highlighted)
        button.addTarget(self, action: #selector(editItem), for: .touchUpInside)
        
        return button
    }()
    
    var spacerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.backgroundColor = .separator
        
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
     
    func configure(with model: Item) {
        titleLabel.text = model.name
//        notesTextView.text = model.notes
        
    }
    
    @objc func deleteItem() {
        delegate.didTappedDeleteButton()
    }
    
    @objc func editItem() {
        delegate.didTappedEditButton()
    }
    
    func setupViews() {
        backgroundColor = .systemGray6
        
    }
    
    func setupHierarchy() {
        addSubview(titleContainer)
        titleContainer.addSubview(titleLabel)
        
        addSubview(modifyButtonContainer)
        modifyButtonContainer.addSubview(modifyButton)

//        addSubview(spacerView)
    
//        addSubview(titleContainer)
//        titleContainer.addSubview(titleLabel)
//
//        addSubview(notesTextView)
    }
    
    func setupLayout() {
        let margins = layoutMarginsGuide
        
        titleContainer.topAnchor.constraint(equalTo: topAnchor, constant: 15).isActive = true
        titleContainer.leftAnchor.constraint(equalTo: leftAnchor, constant: 15).isActive = true
        titleContainer.rightAnchor.constraint(equalTo: rightAnchor, constant: 15).isActive = true
        titleContainer.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        titleLabel.topAnchor.constraint(equalTo: titleContainer.topAnchor).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: titleContainer.leftAnchor).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: titleContainer.rightAnchor).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: titleContainer.centerXAnchor).isActive = true

        
        

//        titleLabel.centerXAnchor.constraint(equalTo: titleContainer.centerXAnchor).isActive = true
        
        //
        modifyButtonContainer.topAnchor.constraint(equalTo: titleContainer.bottomAnchor).isActive = true
        modifyButtonContainer.rightAnchor.constraint(equalTo: rightAnchor, constant: 15).isActive = true
        modifyButtonContainer.leftAnchor.constraint(equalTo: leftAnchor, constant: 15).isActive = true
        modifyButtonContainer.heightAnchor.constraint(equalToConstant: 15).isActive = true
        
//        modifyButton.topAnchor.constraint(equalTo: modifyButtonContainer.bottomAnchor).isActive = true
//        modifyButton.rightAnchor.constraint(equalTo: modifyButtonContainer.rightAnchor, constant: 15).isActive = true
//        modifyButton.leftAnchor.constraint(equalTo: modifyButtonContainer.leftAnchor, constant: 15).isActive = true
//        modifyButton.bottomAnchor.constraint(equalTo: modifyButtonContainer.bottomAnchor, constant: 15).isActive = true

        
        




    }
    
    
}

