//
//  SuccessVC.swift
//  Diy
//
//  Created by Mohanraj S K on 19/02/22.
//

import UIKit

class SuccessVC: UIViewController {
    
    // MARK: UIElements

    @IBOutlet weak var btnFinish: UIButton!

    // MARK: Lifecycle Methods

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidLayoutSubviews() {
        buildUI()
    }

    // MARK: UIActions

    @IBAction func handleFinishAction(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }

}

// MARK: Instance Methods

extension SuccessVC {

    private func buildUI() {
        btnFinish.setAsFilled()
        navigationItem.setHidesBackButton(true, animated: true)
    }

}
