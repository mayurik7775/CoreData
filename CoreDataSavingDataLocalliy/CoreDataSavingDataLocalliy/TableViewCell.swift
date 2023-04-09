//
//  TableViewCell.swift
//  CoreDataSavingDataLocalliy
//
//  Created by Mac on 12/04/23.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var namelbl: UILabel!
    @IBOutlet weak var addresslbl: UILabel!
    @IBOutlet weak var citylbl: UILabel!
    @IBOutlet weak var mobaillbl: UILabel!
    
    var student : Student!{
        didSet{
            namelbl.text = student.name
            addresslbl.text = student.address
            citylbl.text = student.city
            mobaillbl.text = student.mobail
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
