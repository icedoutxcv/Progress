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
        notesTextView.text = model.notes
        startTextField.text = model.start
        endTextField.text = model.end
        
        if model.unit.isEmpty {
            unitButton.setTitle(Units.items[0].name, for: .normal)
        } else {
            unitButton.setTitle(model.unit, for: .normal)
        }
       
    }
    
    @objc func deleteItem() {
        delegate.didTappedDeleteButton()
    }
    
    func setupViews() {
        backgroundColor = .systemGray6
        
    }
    
    func setupHierarchy() {
        addSubview(titleContainer)
        titleContainer.addSubview(titleLabel)
        
        addSubview(progressContainer)
        progressContainer.addArrangedSubview(startTextField)
        progressContainer.addArrangedSubview(endTextField)
        progressContainer.addArrangedSubview(unitButton)

        addSubview(deleteButton)
        
        addSubview(notesContainer)
        notesContainer.addSubview(notesTextView)
    }
    
    func setupLayout() {
            let margins = layoutMarginsGuide

        titleContainer.anchor(top: margins.topAnchor, left: margins.leftAnchor, bottom: progressContainer.topAnchor, right: margins.rightAnchor, paddingTop: 15, paddingLeft: 15, paddingBottom: 0, paddingRight: 15, width: 0, height: 125, enableInsets: false)
        titleLabel.anchor(top: titleContainer.topAnchor, left: titleContainer.leftAnchor, bottom: titleContainer.bottomAnchor, right: titleContainer.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, enableInsets: false)
        
        
        progressContainer.anchor(top: titleContainer.bottomAnchor, left: margins.leftAnchor, bottom: nil, right: margins.rightAnchor, paddingTop: 0, paddingLeft: 15, paddingBottom: 0, paddingRight: 15, width: 0, height: 35, enableInsets: false)
        
        deleteButton.topAnchor.constraint(equalTo: progressContainer.bottomAnchor, constant: 15).isActive = true
        deleteButton.anchor(top: nil, left: leftAnchor, bottom: notesContainer.topAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 15, paddingBottom: 0, paddingRight: 15, width: 0, height: 0, enableInsets: false)
        
        
        notesContainer.anchor(top: deleteButton.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, enableInsets: false)
        
        notesTextView.anchor(top: notesContainer.topAnchor, left: notesContainer.leftAnchor, bottom: notesContainer.bottomAnchor, right: notesContainer.rightAnchor, paddingTop: 15, paddingLeft: 15, paddingBottom: 15, paddingRight: 15, width: 0, height: 0, enableInsets: false)
        
        
        }
    
   
}

