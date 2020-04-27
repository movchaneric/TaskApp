//
//  listCell.swift
//  TaskApp
//
//  Created by eric on 4/21/20.
//  Copyright © 2020 ericm. All rights reserved.
//

import UIKit

class listCell: UITableViewCell {

    @IBOutlet weak var title:UILabel!
    @IBOutlet weak var subTitle:UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
