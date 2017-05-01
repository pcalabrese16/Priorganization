//
//  TableCellVC.swift
//  To Do List
//
//  Created by Patrick Calabrese on 5/1/17.
//  Copyright © 2017 Patrick Calabrese. All rights reserved.
//

import UIKit

class TableCellVC: UITableViewCell {

    let theImage = UIImageView()
    let title = UILabel()
    let desc = UILabel()
    
    override func layoutSubviews() {
        theImage.frame = CGRect(x: 15, y: 5, width: 50, height: 50)
        theImage.contentMode = .scaleAspectFill
        theImage.clipsToBounds = true
        self.addSubview(theImage)
        title.frame = CGRect(x: 75, y: 0, width: self.frame.width - 90, height: self.frame.height / 2)
        title.font = UIFont.systemFont(ofSize: 15)
        title.textColor = UIColor.black
        self.addSubview(title)
        desc.frame = CGRect(x: 75, y: self.frame.height / 2, width: self.frame.width - 90, height: self.frame.height / 2)
        desc.font = UIFont.systemFont(ofSize: 12)
        desc.textColor = UIColor.darkGray
        self.addSubview(desc)
    }
    
    

}
