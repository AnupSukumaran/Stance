//
//  RestViewController.swift
//  Stance
//
//  Created by Sukumar Anup Sukumaran on 24/02/2022.
//

import UIKit

class RestViewController: UIViewController {
    
    @IBOutlet weak var counterView: UIView!
    @IBOutlet weak var countLB: UILabel!
    
    var viewModel: RepCounterViewModel! {
        didSet {
            setHandlers()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.topItem?.title = ""
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        creatingTimeLayout()
        viewModel.questTimer(isPaused: false)
    }

}

extension RestViewController {
    
    func creatingTimeLayout() {
        counterView.layer.cornerRadius = counterView.frame.height/2
        let grayTrk = viewModel.graytrack(view: counterView, path: viewModel.getCurvedPath(view: counterView))
        let redTrk = viewModel.redTrack(view: counterView, path: viewModel.getCurvedPath(view: counterView))
        counterView.layer.addSublayer(grayTrk)
        counterView.layer.addSublayer(redTrk)
    }
    
    func setHandlers() {
        viewModel.timerHandler = { [weak self] str in
            self?.countLB.text = str
        }
        
        viewModel.restHandler = { [weak self]  in
            self?.navigationController?.popViewController(animated: true)
            self?.viewModel.delegate?.setCount()
        }

    }
    
}
