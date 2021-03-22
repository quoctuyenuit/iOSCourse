//
//  ViewController.swift
//  TableViewDemo
//
//  Created by Quốc Tuyến on 3/22/21.
//

import UIKit


class ViewController: UIViewController {
    
    var tableView: UITableView? = nil
    var viewModel: NSArray? = nil
    let reuseIdentifier = "TestReuseIdentifier"

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        self.tableView = UITableView()
        self.tableView?.translatesAutoresizingMaskIntoConstraints = false
        self.tableView?.delegate = self
        self.tableView?.dataSource = self
        
        self.setupView()
        
        self.viewModel = [
            DMTableViewCellObject(image: UIImage(named: "avt"), title: "Day la title, Day la title, Day la title, Day la title, Day la title, Day la title, Day la title, Day la title", timestamp: "10h trước"),
            DMTableViewCellObject(image: UIImage(named: "avt"), title: "Day la title", timestamp: "10h trước"),
            DMTableViewCellObject(image: UIImage(named: "avt"), title: "Day la title", timestamp: "10h trước"),
            DMTableViewCellObject(image: UIImage(named: "avt"), title: "Day la title", timestamp: "10h trước"),
            DMTableViewCellObject(image: UIImage(named: "avt"), title: "Day la title", timestamp: "10h trước"),
            DMTableViewCellObject(image: UIImage(named: "avt"), title: "Day la title", timestamp: "10h trước"),
            DMTableViewCellObject(image: UIImage(named: "avt"), title: "Day la title", timestamp: "10h trước"),
        ]
    }
    
    func setupView() {
        if let tableView = self.tableView {
            self.view.addSubview(tableView)
            
            NSLayoutConstraint.activate([
                tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
                tableView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
                tableView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
                tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            ]);
        }
    }
}

extension ViewController: UITableViewDelegate , UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier)
        
        // If cell is nill ==> Init cell by init method
        if (cell == nil) {
            cell = DMTestTableViewCell.init(style: UITableViewCell.CellStyle.default, reuseIdentifier: reuseIdentifier)
        }
        
        if let dmCell = cell as? DMTestTableViewCell {
            let object = self.viewModel?.object(at: indexPath.row)
            dmCell.shouldUpdateCellWithObject(object: object as! DMTableViewCellObject)
            return dmCell
        }
        
        return cell ?? UITableViewCell()
    }
}

