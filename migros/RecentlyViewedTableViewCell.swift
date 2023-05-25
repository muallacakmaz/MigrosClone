//
//  RecentlyViewedTableViewCell.swift
//  migros
//
//  Created by Mualla on 12.03.2023.
//

import UIKit

class RecentlyViewedTableViewCell: UITableViewCell {

    @IBOutlet weak var rvCollectionCell: UICollectionView!
    
    
    var coksatanlar = [ UIImage(named: "coksatan"),
                        UIImage(named: "coksatan2"),
                        UIImage(named: "coksatan3"),
                        UIImage(named: "coksatan4"),
                        UIImage(named: "coksatan"),
                        UIImage(named: "coksatan2"),
                        UIImage(named: "coksatan3"),
                        UIImage(named: "coksatan4"),
                        UIImage(named: "coksatan"),
                        UIImage(named: "coksatan2"),
                        UIImage(named: "coksatan3"),
                        UIImage(named: "coksatan4"),
                        UIImage(named: "coksatan"),
                        UIImage(named: "coksatan2"),]
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        rvCollectionCell.delegate = self
        rvCollectionCell.dataSource = self
    }
    
  

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)


    }

}

extension RecentlyViewedTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "recentlyViewedCollectionCell", for: indexPath) as! RecentlyViewedCollectionCell
        
        cell.rvImages.image = coksatanlar[indexPath.row]
        cell.layer.borderColor = UIColor.orange.cgColor
        cell.layer.borderWidth = 4
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding: CGFloat = 25
        let collectionCellSize = collectionView.frame.size.width - padding
        
        return CGSize(width: collectionCellSize/2, height: collectionCellSize/2)
    }

}


class SelfSizingCollectionView: UICollectionView {
    
    override var contentSize: CGSize {
        didSet {
            invalidateIntrinsicContentSize()
        }
    }
    
    override func reloadData() {
        super.reloadData()
        self.invalidateIntrinsicContentSize()
    }

 

    override var intrinsicContentSize: CGSize {
        return contentSize
    }
}

