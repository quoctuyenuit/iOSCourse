//
//  DMTestTableViewCell.swift
//  TableViewDemo
//
//  Created by Quốc Tuyến on 3/22/21.
//

import UIKit

class DMTestTableViewCell: UITableViewCell {
    let imgView: UIImageView = UIImageView()
    let titleLabel: UILabel = UILabel()
    let timestampLabel: UILabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.initProperties()
        self.setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        self.imgView.image = nil
        self.titleLabel.text = ""
        self.timestampLabel.text = ""
    }
    
    func shouldUpdateCellWithObject(object : DMTableViewCellObject) {
        self.imgView.image = object.image
        self.titleLabel.text = object.title
        self.timestampLabel.text = object.timestamp
    }
    
    func initProperties() {
        self.imgView.translatesAutoresizingMaskIntoConstraints = false
        
//        self.titleLabel = UILabel()
        self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.titleLabel.textColor = UIColor.black
        self.titleLabel.numberOfLines = 0
        
        
        self.timestampLabel.translatesAutoresizingMaskIntoConstraints = false
        self.timestampLabel.textColor = UIColor.darkGray
    }
    
    func setupLayout() {
        self.contentView.addSubview(self.imgView)
        self.contentView.addSubview(self.titleLabel)
        self.contentView.addSubview(self.timestampLabel)
        
        NSLayoutConstraint.activate([
            self.imgView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8),
            self.imgView.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 16),
            self.imgView.widthAnchor.constraint(equalToConstant: 100),
            self.imgView.heightAnchor.constraint(equalToConstant: 60),
            self.imgView.bottomAnchor.constraint(lessThanOrEqualTo: self.contentView.bottomAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            self.titleLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8),
            self.titleLabel.leftAnchor.constraint(equalTo: self.imgView.rightAnchor, constant: 16),
            self.titleLabel.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            self.timestampLabel.leftAnchor.constraint(equalTo: self.imgView.rightAnchor, constant: 16),
            self.timestampLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 2),
            self.timestampLabel.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -16),
            self.timestampLabel.bottomAnchor.constraint(lessThanOrEqualTo: self.contentView.bottomAnchor, constant: -16)
        ])
    }

}
