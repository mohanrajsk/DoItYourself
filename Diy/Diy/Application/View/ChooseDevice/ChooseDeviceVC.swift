//
//  ChooseDeviceVC.swift
//  Diy
//
//  Created by Mohanraj S K on 18/02/22.
//

import UIKit

class ChooseDeviceVC: UIViewController {
    
    // MARK: Properties

    lazy var viewModel: ChooseDeviceVM = {
        return ChooseDeviceVM(delegate: self)
    }()

    // MARK: UIElements

    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var btnNext: UIButton!
    @IBOutlet weak var btnBLEPen: UIButton!
    @IBOutlet weak var btnBGMMeter: UIButton!

    // MARK: Lifecycle Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        reset()
        initialize()
    }

    override func viewDidLayoutSubviews() {
        buildUI()
    }

    // MARK: UIActions

    @IBAction func handleBGMSelection(_ sender: Any) {

        reset()
        viewModel.saveSelection(device: "BGM Meter")
        btnBGMMeter.setSelection(true)

    }

    @IBAction func handleBLESelection(_ sender: Any) {

        reset()
        viewModel.saveSelection(device: "BLE Pen")
        btnBLEPen.setSelection(true)

    }
    
    @IBAction func handleNextAction(_ sender: Any) {
        viewModel.save()
    }

    @IBAction func handleBackAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }

}

// MARK: Instance Methods

extension ChooseDeviceVC {

    private func initialize() {

        self.title = "Choose Device Type"
        configureCancelNavigationItem()
        viewModel.loadUserData()

    }

    private func buildUI() {

        btnBGMMeter.setAsRoundedCorner()
        btnBLEPen.setAsRoundedCorner()
        btnBack.setAsOutline()
        btnNext.setAsFilled()

    }

    private func reset() {
        btnBGMMeter.setSelection(false)
        btnBLEPen.setSelection(false)
    }

}

// MARK: UI - Delegates

extension ChooseDeviceVC: ChooseDeviceVMUIProtocol {

    func handleValidation(message: String) {
        UIHelper.shared.showAlert(message: message, viewController: self)
    }

    func navigateToNextScreen() {
        self.navigationController?.pushViewController(BLEDetectionVC.loadFromNib(), animated: true)
    }

    func setUserData(diyModel: DIYModel) {
        reset()
        if !diyModel.deviceType.isEmpty {
            if diyModel.deviceType == "BGM Meter" {
                btnBGMMeter.setSelection(true)
            } else {
                btnBLEPen.setSelection(true)
            }
        }
    }

}
