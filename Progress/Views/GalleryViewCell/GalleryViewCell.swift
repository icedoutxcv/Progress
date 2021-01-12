//
//  GalleryTableViewCell.swift
//  Progress
//
//  Created by xcv on 28/11/2020.
//

import UIKit

protocol ItemDetailsViewControllerDelegate {
    func didSelectItem(item: Item)
}

class GalleryViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout  {
    static let identifier = "GalleryViewCell"

    @IBOutlet var collectionView: UICollectionView!
    
    var models = [Item]()
    var delegate: ItemDetailsViewControllerDelegate!

    static func nib() -> UINib {
        return UINib(nibName: "GalleryViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.register(ItemViewCell.nib(), forCellWithReuseIdentifier: ItemViewCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.contentInset = UIEdgeInsets.init(top: 0, left: 15, bottom: 0, right: 15)
        
        layoutSubviews()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        
        let margins = UIEdgeInsets(top: 15, left: 0, bottom: 15, right: 0)
        contentView.frame = contentView.frame.inset(by: margins)
    }
    
    func configure(with items: [Item]) {
        self.models = items
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return models.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ItemViewCell.identifier, for: indexPath) as! ItemViewCell
        cell.configure(with: models[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 2.5 , height: collectionView.frame.height - (collectionView.safeAreaInsets.top + collectionView.safeAreaInsets.bottom))
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.delegate?.didSelectItem(item: models[indexPath.row])
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
