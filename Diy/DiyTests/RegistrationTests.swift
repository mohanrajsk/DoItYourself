//
//  RegistrationTests.swift
//  DiyTests
//
//  Created by Mohanraj S K on 19/02/22.
//

@testable import Diy
import XCTest

class RegistrationTests: XCTestCase {

    var viewController: RegistrationVC!
    var viewModel: RegistrationVM!

    override class func setUp() {
        super.setUp()
    }

    override func setUp() {
        super.setUp()
        DefaultsManager.shared.diyModel = nil
        viewController = RegistrationVC.loadFromNib()
        viewController.loadViewIfNeeded()
        viewController.viewDidLoad()
        viewController.viewDidLayoutSubviews()
        viewController.viewWillAppear(true)
        viewModel = viewController.viewModel
    }

    func testSetUpUI() {
        XCTAssertNotNil(viewController.viewDidLayoutSubviews())
    }

    func testValidation() {
        XCTAssertNotNil(viewModel.save())
        viewModel.firstName.data = "John"
        XCTAssertNotNil(viewModel.save())
        viewModel.lastName.data = "Smith"
        XCTAssertNotNil(viewModel.save())
        viewModel.emailAddress.data = "test@gmail.com"
        XCTAssertNotNil(viewModel.save())
        viewModel.address.data = "Sample address for testing"
        XCTAssertNotNil(viewModel.save())
        viewModel.pinCode.data = "123456"
        XCTAssertNotNil(viewModel.save())

    }

    func testUIACtions() {

        viewModel.firstName.data = "John"
        viewModel.lastName.data = "Smith"
        viewModel.emailAddress.data = "test@gmail.com"
        viewModel.address.data = "Sample address for testing"

        viewController.btnNext?.sendActions(for: .touchUpInside)
        viewController.btnBack?.sendActions(for: .touchUpInside)

        // validation
        XCTAssertNotNil(viewModel.save())

        // save
        viewModel.pinCode.data = "123456"
        XCTAssertNotNil(viewModel.save())
        XCTAssertNotNil(viewModel.loadUserData())
        XCTAssertEqual(viewModel.firstName.data, viewController.txtFirstName.text)
        XCTAssertEqual(viewModel.lastName.data, viewController.txtLastName.text)
        XCTAssertEqual(viewModel.address.data, viewController.txtAddress.text)
        XCTAssertEqual(viewModel.pinCode.data, viewController.txtPincode.text)

    }

}
