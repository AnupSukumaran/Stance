//
//  RepCounterViewController.swift
//  Stance
//
//  Created by Sukumar Anup Sukumaran on 22/02/2022.
//

import UIKit

class RepCounterViewController: UIViewController {

    @IBOutlet weak var counterView: UIView!
    @IBOutlet weak var countLB: UILabel!
    
    
    var viewModel: RepCounterViewModel! {
        didSet {
            setHandlers()
        }
    }
    
    
    let shapelayer = CAShapeLayer()
    var point:CGFloat = 0
    var count = 0
    var questTimer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.topItem?.title = ""
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        creatingTimeLayout()
        viewModel.questTimer(isPaused: false)
    }
    
    func creatingTimeLayout() {
        counterView.layer.cornerRadius = counterView.frame.height/2
        let grayTrk = viewModel.graytrack(view: counterView, path: viewModel.getCurvedPath(view: counterView))
        let redTrk = viewModel.redTrack(view: counterView, path: viewModel.getCurvedPath(view: counterView))
        counterView.layer.addSublayer(grayTrk)
        counterView.layer.addSublayer(redTrk)
    }

}


extension RepCounterViewController {
    
    func setHandlers() {
        viewModel.timerHandler = { [weak self] str in
            self?.countLB.text = str
        }
    }
    
}
