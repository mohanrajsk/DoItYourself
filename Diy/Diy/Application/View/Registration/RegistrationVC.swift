//
//  RegistrationVC.swift
//  diy
//
//  Created by Mohanraj S K on 18/02/22.
//

import UIKit

class RegistrationVC: UIViewController {

    // MARK: Properties

    lazy var viewModel: RegistrationVM = {
        return RegistrationVM(delegate: self)
    }()

    // MARK: UIElements

    @IBOutlet weak var txtFirstName: BindingTextField! {
        didSet { txtFirstName.bind { self.viewModel.firstName.data = $0 } }
    }

    @IBOutlet weak var txtLastName: BindingTextField! {
        didSet { txtLastName.bind { self.viewModel.lastName.data = $0 } }
    }

    @IBOutlet weak var txtEmailAddress: BindingTextField! {
        didSet { txtEmailAddress.bind { self.viewModel.emailAddress.data = $0 } }
    }

    @IBOutlet weak var txtAddress: BindingTextView! {
        didSet { txtAddress.bind { self.viewModel.address.data = $0 } }
    }

    @IBOutlet weak var txtPincode: BindingTextField! {
        didSet { txtPincode.bind { self.viewModel.pinCode.data = $0 } }
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

extension RegistrationVC {

    private func initialize() {

        self.title = "Registration"
        configureCancelNavigationItem()
        viewModel.loadUserData()

    }

    private func buildUI() {

        txtFirstName.createBottomLine()
        txtLastName.createBottomLine()
        txtAddress.createBottomLine()
        txtEmailAddress.createBottomLine()
        txtPincode.createBottomLine()
        btnNext.setAsFilled()
        btnBack.setAsOutline()

    }

}

// MARK: UI - Delegates

extension RegistrationVC: RegistrationVMUIProtocol {

    func handleValidation(message: String) {
        UIHelper.shared.showAlert(message: message, viewController: self)
    }

    func navigateToNextScreen() {
        self.navigationController?.pushViewController(ChooseDeviceVC.loadFromNib(), animated: true)
    }

    func setUserData(diyModel: DIYModel) {

        txtFirstName.text = diyModel.firstName
        txtLastName.text = diyModel.lastName
        txtEmailAddress.text = diyModel.emailAddress
        txtAddress.text = diyModel.address
        txtPincode.text = diyModel.pinCode

    }
}
