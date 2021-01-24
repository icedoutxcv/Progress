//
//  ItemDetailsView.swift
//  Progress
//
//  Created by xcv on 27/12/2020.
//

import UIKit;

protocol ItemDetailsViewDelegate {
    func didTappedDeleteButton()
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
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 32)
        label.textAlignment = .center
        
        return label
    }()
    
    var notesContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        
        return view
    }()

    var notesTextView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.clipsToBounds = true
        
        textView.textAlignment = .natural
        textView.font = UIFont.systemFont(ofSize: 24)
        textView.textColor = UIColor.gray
        textView.backgroundColor = .clear

        return textView
    }()
    
    var progressContainer: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.distribution = .fillEqually
        view.spacing = 10
        
        return view
    }()
    
    var startTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "50"
        
        return textField
    }()
    
    var endTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "70"

        return textField
    }()
    
    var unitButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.clipsToBounds = true
        
        button.setTitle("minutes", for: .normal)
        button.backgroundColor = .systemGray
        
        button.layer.cornerRadius = 6
        
        return button
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
        titleLabel.text = "Notes"
        notesTextView.text = model.notes
        startTextField.text = model.start
        endTextField.text = model.end
        
        if model.unit.isEmpty {
            unitButton.setTitle(Units.items[0].name, for: .normal)
        } else {
            unitButton.setTitle(model.unit, for: .normal)
        }
        
//        if model.notes.isEmpty {
//            notesTextView.text = "Notes"
//        }
       
    }
    
    @objc func deleteItem() {
        delegate.didTappedDeleteButton()
    }
    
    func setupViews() {
        backgroundColor = .systemGray6
        
    }
    
    func setupHierarchy() {
        addSubview(progressContainer)
        progressContainer.addArrangedSubview(startTextField)
        progressContainer.addArrangedSubview(endTextField)
        progressContainer.addArrangedSubview(unitButton)
        
        addSubview(deleteButton)
        addSubview(spacerView)
    
        addSubview(titleContainer)
        titleContainer.addSubview(titleLabel)
        
//        addSubview(notesContainer)
        addSubview(notesTextView)
    }
    
    func setupLayout() {
        let margins = layoutMarginsGuide
        
        progressContainer.anchor(top: margins.topAnchor, left: margins.leftAnchor, bottom: nil, right: margins.rightAnchor, paddingTop: 30, paddingLeft: 15, paddingBottom: 0, paddingRight: 15, width: 0, height: 35, enableInsets: false)
        
        deleteButton.topAnchor.constraint(equalTo: progressContainer.bottomAnchor, constant: 15).isActive = true
        deleteButton.centerXAnchor.constraint(equalTo: progressContainer.centerXAnchor).isActive = true

        
        spacerView.topAnchor.constraint(equalTo: deleteButton.bottomAnchor, constant: 15).isActive = true
        spacerView.anchor(top: nil, left: leftAnchor, bottom: notesTextView.topAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 30, paddingRight: 0, width: 0, height: 1, enableInsets: false)
        
//        titleContainer.anchor(top: spacerView.bottomAnchor, left: margins.leftAnchor, bottom: notesContainer.topAnchor, right: margins.rightAnchor, paddingTop: 0, paddingLeft: 15, paddingBottom: 0, paddingRight: 15, width: 0, height: 125, enableInsets: false)
//        titleLabel.anchor(top: titleContainer.topAnchor, left: titleContainer.leftAnchor, bottom: titleContainer.bottomAnchor, right: titleContainer.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, enableInsets: false)
        
//        notesContainer.anchor(top: spacerView.bottomAnchor, left: leftAnchor, bottom: layoutMarginsGuide.bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, enableInsets: false)
        
        notesTextView.anchor(top: nil, left: margins.leftAnchor, bottom: margins.bottomAnchor, right: margins.rightAnchor, paddingTop: 30, paddingLeft: 15, paddingBottom: 260, paddingRight: 15, width: 0, height: 0, enableInsets: false)
        
        
    }
    
    
}

