//
//  WelcomeVC.swift
//  diy
//
//  Created by Mohanraj S K on 18/02/22.
//

import UIKit

class WelcomeVC: UIViewController {

    // MARK: UIElements

    @IBOutlet weak var btnNext: UIButton!

    // MARK: Lifecycle Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        buildUI()
    }


    // MARK: UIActions
    @IBAction func handleNextAction(_ sender: Any) {
        self.navigationController?.pushViewController(RegistrationVC.loadFromNib(), animated: true)
    }

}

// MARK: Instance Methods

extension WelcomeVC {

    private func buildUI() {
        btnNext.setAsFilled()
    }

}
