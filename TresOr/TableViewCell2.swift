//
//  TableViewCell2.swift
//  TresOr
//
//  Created by Celine Waldner on 07/01/2021.
//

import UIKit

class TableViewCell2: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var descri: UILabel!
    @IBOutlet weak var catego: UILabel!
    
    
}
