//
//  DIYSummaryVC.swift
//  Diy
//
//  Created by Mohanraj S K on 19/02/22.
//

import UIKit

class DIYSummaryVC: UIViewController {
    
    // MARK: Properties

    lazy var viewModel: DIYSummaryVM = {
        return DIYSummaryVM(delegate: self)
    }()

    // MARK: UIElements

    @IBOutlet weak var txtSelectedDevice: BindingTextField! {
        didSet { txtSelectedDevice.bind { self.viewModel.selectedDevice.data = $0 } }
    }
    
    @IBOutlet weak var txtSerialNumber: BindingTextField! {
        didSet { txtSerialNumber.bind { self.viewModel.deviceSerialNumber.data = $0 } }
    }
    
    
    @IBOutlet weak var txtDeviceVersion: BindingTextField! {
        didSet { txtDeviceVersion.bind { self.viewModel.deviceVersion.data = $0 } }
    }
    
    @IBOutlet weak var txtDeviceName: BindingTextField! {
        didSet { txtDeviceName.bind { self.viewModel.deviceName.data = $0 } }
    }

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
        viewModel.save()
    }

    @IBAction func handleBackAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

// MARK: Instance Methods

extension DIYSummaryVC {

    private func initialize() {

        self.title = "Device Summary"
        configureCancelNavigationItem()
        viewModel.loadUserData()
        
    }

    private func buildUI() {

        txtSelectedDevice.createBottomLine()
        txtSerialNumber.createBottomLine()
        txtDeviceVersion.createBottomLine()
        txtDeviceName.createBottomLine()
        btnNext.setAsFilled()
        btnBack.setAsOutline()

    }

}

// MARK: UI - Delegates

extension DIYSummaryVC: DIYSummaryVMUIProtocol {

    func handleValidation(message: String) {
        UIHelper.shared.showAlert(message: message, viewController: self)
    }

    func navigateToNextScreen() {
        self.navigationController?.pushViewController(SuccessVC.loadFromNib(), animated: true)
    }

    func popToDeviceSelection() {

        UIHelper.shared.showAlert(message: "Entered data did not match", viewController: self) {
            // intentionally unimplemented
        } onActionCallback: {

            for controller in self.navigationController!.viewControllers as Array {
                if controller.isKind(of: ChooseDeviceVC.self) {
                    DispatchQueue.main.async {
                        self.navigationController?.popToViewController(controller, animated: true)
                    }
                    break
                }
            }

        }
    }

    func setUserData(diyModel: DIYModel) {

        txtSelectedDevice.text = diyModel.deviceType
        txtSerialNumber.text = diyModel.deviceSerialNumber
        txtDeviceVersion.text = diyModel.deviceVersion
        txtDeviceName.text = diyModel.deviceName

    }

}

