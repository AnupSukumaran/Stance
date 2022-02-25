//
//  ExcerciseTableViewCell.swift
//  Stance
//
//  Created by Sukumar Anup Sukumaran on 25/02/2022.
//

import UIKit

class ExcerciseTableViewCell: UITableViewCell {
    
    @IBOutlet weak var title1: UILabel!
    @IBOutlet weak var title2: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func config(model: MovementModel?) {
        title1.text = model?.excerciseTitle ?? "-"
        title2.text = "\(model?.numSets ?? "") \(model?.reps ?? "") \(model?.ibs ?? ""))"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
