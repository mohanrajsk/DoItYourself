//
//  ChooseDateVC.swift
//  Diy
//
//  Created by Mohanraj S K on 19/02/22.
//

import UIKit

class ChooseDateVC: UIViewController {

    // MARK: Properties

    var datePicker: UIDatePicker?

    lazy var viewModel: ChooseDateVM = {
        return ChooseDateVM(delegate: self)
    }()

    // MARK: UIElements

    @IBOutlet weak var txtDate: BindingTextField! {
        didSet { txtDate.bind { self.viewModel.selectedDate.data = $0 } }
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

extension ChooseDateVC {

    private func initialize() {

        self.title = "Choose Date"
        configureCancelNavigationItem()
        buildDatePicker()
        viewModel.loadUserData()

    }

    private func buildUI() {

        btnBack.setAsOutline()
        btnNext.setAsFilled()
        txtDate.setAsAppTextField()

    }

    func buildDatePicker() {
        datePicker = UIHelper.shared.addDatePicker(inputField: txtDate, mode: .date,
                                                   doneAction: #selector(done), cancelAction: #selector(cancel), forVC:self)
    }

    @objc func done() {
        txtDate.text = UIHelper.shared.convertDateToString((datePicker?.date)!, format: dateFormat)
        txtDate.resignFirstResponder()
    }

    @objc func cancel() {
        txtDate.resignFirstResponder()
    }
}

// MARK: UI - Delegates

extension ChooseDateVC: ChooseDateVMUIProtocol {

    func handleValidation(message: String) {
        UIHelper.shared.showAlert(message: message, viewController: self)
    }

    func navigateToNextScreen() {
        self.navigationController?.pushViewController(DIYSummaryVC.loadFromNib(), animated: true)
    }

    func setUserData(diyModel: DIYModel) {
        txtDate.text = diyModel.selectedDate
    }
}
