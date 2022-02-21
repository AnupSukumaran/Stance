//
//  SectionTableViewCell.swift
//  Stance
//
//  Created by Sukumar Anup Sukumaran on 21/02/2022.
//

import UIKit

class SectionTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var title1: UILabel!
    @IBOutlet weak var title2: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func config(sectionData: SectionData?) {
        guard let data = sectionData else {return}
        title1.text = data.sectionTitle
        let second = sectionData?.workoutMins == nil ? "" : " • \(data.workoutMins!)"
        title2.text = (data.numOfExcercises ?? "") + second
    }
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
