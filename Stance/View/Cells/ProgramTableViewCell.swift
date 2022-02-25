//
//  ProgramTableViewCell.swift
//  Stance
//
//  Created by Sukumar Anup Sukumaran on 20/02/2022.
//

import UIKit

class ProgramTableViewCell: UITableViewCell {
    
    @IBOutlet weak var programLabel: UILabel!

    func config(_ programTitle: String) {
        programLabel.text = programTitle
    }
    
}
