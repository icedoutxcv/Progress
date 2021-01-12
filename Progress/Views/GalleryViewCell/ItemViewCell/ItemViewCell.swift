//
//  CollectionViewCell.swift
//  Progress
//
//  Created by xcv on 28/11/2020.
//

import UIKit

class ItemViewCell: UICollectionViewCell {
    static let identifier = "ItemViewCell"

    @IBOutlet var frontView: UIView!
    @IBOutlet var title: UILabel!
    
    static func nib() -> UINib {
        return UINib(nibName: "ItemViewCell", bundle: nil)
    }
    
    public func configure(with model: Item) {
        let colorString = ItemColor.codedString(from: model.color)
        self.frontView.backgroundColor = UIColor.color(withCodedString: colorString)
        self.title.text = model.name
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.cornerRadius = 5
        layer.masksToBounds = true
    }
}
