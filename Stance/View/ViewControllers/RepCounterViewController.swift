//
//  RepCounterViewController.swift
//  Stance
//
//  Created by Sukumar Anup Sukumaran on 22/02/2022.
//

import UIKit

class RepCounterViewController: UIViewController {

    @IBOutlet weak var setCountLB: UILabel!
    @IBOutlet weak var repsCountLB: UILabel!
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
        repsCountLB.text = "\(viewModel.secs) Reps"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        creatingTimeLayout()
        viewModel.questTimer(isPaused: false)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        countLB.text = viewModel.resetMetrics()
    }
    
}


extension RepCounterViewController {
    
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
            guard let vc = self else {return}
            vc.navigationController?.pushViewController(.restViewCntrCall(setCount: vc.viewModel.setCnt, delegate: vc.viewModel), animated: true)
        }
        
        viewModel.setCountHandler = { [weak self] isSetLimit, setCnt in
            guard let vc = self else {return}
            guard isSetLimit else {
                vc.setCompletedAction()
                return
            }
            vc.setCountLB.text = "SET \(setCnt)"
        }
    }
    
    func setCompletedAction() {
        setCountLB.text = "SET DONE 👍"
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.navigationController?.popToRootViewController(animated: true)
        }
    }
    
}


