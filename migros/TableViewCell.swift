//
//  TableViewCell.swift
//  migros
//
//  Created by Mualla on 27.02.2023.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    
    var data : [MigrosData]?

    
    @IBOutlet weak var collectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.delegate = self
        collectionView.dataSource = self
        
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
    func updateData(data: [MigrosData]?){
        self.data = data;
    }
}

extension TableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if data != nil{
            return data![collectionView.tag].sebzeler.count
        }else{
            return 0
        }
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        cell.images.image = UIImage(named: data![collectionView.tag].sebzeler[indexPath.row])
        return cell
    }
    

}
