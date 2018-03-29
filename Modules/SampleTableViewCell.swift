//
//  SampleTableViewCell.swift
//  Custom Demo
//
//  Created by Semantic on 29/03/18.
//  Copyright © 2018 Sandip Jadhav. All rights reserved.
//

import Foundation
import UIKit

let imageCache = NSCache<AnyObject, AnyObject>()


class SampleTableViewCell: UITableViewCell {
    @IBOutlet weak var imgview: UIImageView!
   
    @IBOutlet weak var bgview: UIView!
    @IBOutlet weak var lblname: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

