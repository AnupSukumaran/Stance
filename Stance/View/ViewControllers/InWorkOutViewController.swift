//
//  InWorkOutViewController.swift
//  Stance
//
//  Created by Sukumar Anup Sukumaran on 24/02/2022.
//

import UIKit

class InWorkOutViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setNav()
    }
    
    @IBAction func btnAction(_ sender: Any) {
        self.navigationController?.pushViewController(.repCntViewCntr, animated: true)
    }

}

extension InWorkOutViewController {
    
    func setNav() {
        self.navigationController?.navigationBar.tintColor = .black
        self.navigationController?.navigationBar.topItem?.title = ""
        self.title = "Bench Press"
    }
}
