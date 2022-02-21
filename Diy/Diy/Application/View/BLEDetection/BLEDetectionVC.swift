//
//  BLEDetectionVC.swift
//  Diy
//
//  Created by Mohanraj S K on 19/02/22.
//

import UIKit

class BLEDetectionVC: UIViewController {
    
    // MARK: Properties

    lazy var viewModel: BLEDetectionVM = {
        return BLEDetectionVM(delegate: self)
    }()

    // MARK: UIElements

    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var btnNext: UIButton!

    // MARK: Lifecycle Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }

    override func viewDidLayoutSubviews() {
        buildUI()
    }

    // MARK: UIActions

    @IBAction func handleNextAction(_ sender: Any) {
        viewModel.checkBLEEnabledAndMoveToNext()
    }

    @IBAction func handleBackAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }

    deinit {
        UIHelper.appDelegate.forceEnableBLE = false
    }

}

// MARK: Instance Methods

extension BLEDetectionVC {

    private func initialize() {

        self.title = "Enable Bluetooth"
        configureCancelNavigationItem()
        
    }

    private func buildUI() {

        btnBack.setAsOutline()
        btnNext.setAsFilled()

    }

}

// MARK: UI - Delegates

extension BLEDetectionVC: BLEDetectionVMUIProtocol {

    func handleValidation(message: String) {
        UIHelper.shared.showAlert(message: message, viewController: self)
    }

    func navigateToNextScreen() {
        self.navigationController?.pushViewController(ChooseDateVC.loadFromNib(), animated: true)
    }

}
