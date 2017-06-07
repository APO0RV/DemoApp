//
//  AddTableViewCell.swift
//  DemoApp
//
//  Created by Apoorv Srivastava on 06/06/17.
//  Copyright © 2017 MGI. All rights reserved.
//

import UIKit

class AddTableViewCell: UITableViewCell {

    @IBOutlet weak var addButton: UIButton!
    
    var addButonTapped: ((UITableViewCell) -> Void)?
    var doneButonTapped: ((UITableViewCell) -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func addButonClicked(_ sender: Any) {
        addButonTapped?(self)
    }
    
    @IBAction func doneButonClicked(_ sender: Any) {
        doneButonTapped?(self)
    }
    
}
