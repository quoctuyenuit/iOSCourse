//
//  ViewController.swift
//  TableViewDemo
//
//  Created by Quốc Tuyến on 3/22/21.
//

import UIKit


class ViewController: UIViewController {
    
    var tableView: UITableView? = nil
    let viewModel: DMViewModel = DMViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        self.tableView = UITableView()
        self.tableView?.translatesAutoresizingMaskIntoConstraints = false
        self.tableView?.delegate = self
        self.tableView?.dataSource = self
        
        self.setupView()
        
        DMTableViewCreator.buildProfileCellObjectWithViewModel(viewModel: self.viewModel)
        DMTableViewCreator.buildBasicCellObjectWithViewModel(viewModel: self.viewModel)
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
        return self.viewModel.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.numberOfRow(in: section)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellObject: DMCellObject = self.viewModel.object(row: indexPath.row, section: indexPath.section) as! DMCellObject
        /// generate reuse identifier from object's class name
        let reuseIdentifier = NSStringFromClass(type(of: cellObject))
        
        var cell: UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier)
        
        if (cell == nil) {
            /// Cast cellClass as UITableViewCell type to use UITableViewCell's initialization method
            if let cellClass = cellObject.cellClass as? UITableViewCell.Type {
                cell = cellClass.init(style:UITableViewCell.CellStyle.default, reuseIdentifier: reuseIdentifier)
            }
        }
        
        /// Cast cell as UITableViewCell which conform DMTableViewCellProtocol
        if let dmCell = cell as? (UITableViewCell & DMTableViewCellProtocol) {
            dmCell.shouldUpdateWithObject(object: cellObject)
        } else {
            assert(false, "Cell not conform protocol DMTableViewCellProtocol")
        }
        
        return cell ?? UITableViewCell()
    }
}

