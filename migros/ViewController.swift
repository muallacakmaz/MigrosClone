//
//  ViewController.swift
//  migros
//
//  Created by Mualla on 27.02.2023.
//

import UIKit



class ViewController: UIViewController {
    
    
    var data = [MigrosData(sectionTypes: "Sebzeler", sebzeler: ["sogan","maydonoz","avakado","domates","brokoli"])]


    var collectionHeight : CGFloat = 0;
    
    
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        tableView.sectionHeaderTopPadding = 0
        
        tableView.frame = self.view.frame
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 200
        self.view.addSubview(tableView)
     
        
        
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }
    
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    //MARK: - Methods,
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0{
            return UITableView.automaticDimension
        }else{
            return collectionHeight
        }
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return data[section].sectionTypes
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0{ //ilk row
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
            
            cell.updateData(data: data);
            
            cell.collectionView.tag = indexPath.section
            self.view.setNeedsLayout();

        
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "recentlyViewedCollectionCell", for: indexPath) as! RecentlyViewedTableViewCell
            
            self.collectionHeight = cell.rvCollectionCell.contentSize.height;
            self.view.setNeedsLayout();

            print("gelen height size nedir \(self.collectionHeight)")
            
            return cell
        }
    }

    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = .white
    }
    
    
}

