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
        
        addSubview(deleteButton)
        
        addSubview(notesContainer)
        notesContainer.addSubview(notesTextView)
    }
    
    func setupLayout() {
            let margins = layoutMarginsGuide

        titleContainer.anchor(top: margins.topAnchor, left: margins.leftAnchor, bottom: deleteButton.topAnchor, right: margins.rightAnchor, paddingTop: 15, paddingLeft: 15, paddingBottom: 0, paddingRight: 15, width: 0, height: 125, enableInsets: false)
        titleLabel.anchor(top: titleContainer.topAnchor, left: titleContainer.leftAnchor, bottom: titleContainer.bottomAnchor, right: titleContainer.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, enableInsets: false)
        
        deleteButton.anchor(top: titleContainer.bottomAnchor, left: leftAnchor, bottom: notesContainer.topAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 15, paddingBottom: 0, paddingRight: 15, width: 0, height: 0, enableInsets: false)
        
        notesContainer.anchor(top: deleteButton.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, enableInsets: false)
        
        notesTextView.anchor(top: notesContainer.topAnchor, left: notesContainer.leftAnchor, bottom: notesContainer.bottomAnchor, right: notesContainer.rightAnchor, paddingTop: 15, paddingLeft: 15, paddingBottom: 15, paddingRight: 15, width: 0, height: 0, enableInsets: false)
        
        
        }
}
