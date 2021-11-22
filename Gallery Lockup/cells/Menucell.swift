//
//  Menucell.swift
//  Gallery Lockup
//
//  Created by iMac on 13/11/21.
//

import UIKit

class Menucell: UITableViewCell {

    @IBOutlet var lbl: UILabel!
    @IBOutlet var img: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
