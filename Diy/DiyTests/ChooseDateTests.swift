//
//  ChooseDateTests.swift
//  DiyTests
//
//  Created by Mohanraj S K on 20/02/22.
//

@testable import Diy
import XCTest

class ChooseDateTests: XCTestCase {

    var viewController: ChooseDateVC!
    var viewModel: ChooseDateVM!

    override class func setUp() {
        super.setUp()
    }

    override func setUp() {
        super.setUp()
        DefaultsManager.shared.diyModel = nil
        viewController = ChooseDateVC.loadFromNib()
        viewController.loadViewIfNeeded()
        viewController.viewDidLoad()
        viewController.viewDidLayoutSubviews()
        viewController.viewWillAppear(true)
        viewModel = viewController.viewModel
    }

    func testSetUpUI() {
        XCTAssertNotNil(viewController.viewDidLayoutSubviews())
        XCTAssertNotNil(viewController.done())
        XCTAssertNotNil(viewController.cancel())
    }

    func testValidation() {
        XCTAssertNotNil(viewModel.save())
    }

    func testUIACtions() {

        let diyModel = DIYModel()
        diyModel.firstName = "John"
        DefaultsManager.shared.diyModel = diyModel

        viewModel.selectedDate.data = "2020-02-20"
        XCTAssertNotNil(viewModel.save())
        XCTAssertNotNil(viewModel.loadUserData())
        XCTAssertNotNil(viewController.btnNext?.sendActions(for: .touchUpInside))
        XCTAssertNotNil(viewController.btnBack?.sendActions(for: .touchUpInside))
        XCTAssertEqual(viewModel.selectedDate.data, viewController.txtDate.text)
    }

}
