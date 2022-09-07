//
//  TVLisitingViewModelTest.swift
//  StarzplayChallengeTests
//
//  Created by Umair Irfan on 07/09/2022.
//

import Foundation
import XCTest
@testable import StarzplayChallenge

class TVShowsViewModelTest: XCTestCase {

    var sut: TVLisitingViewModelType!
    var repository: TVRepositoryType!
    
    override func setUpWithError() throws {
        repository = MockTVRepository()
        sut = TVLisitingViewModel(with: repository)
    }
    
    override func tearDownWithError() throws {
         repository = nil
         sut = nil
     }
    
    func test_view_model_creation_success() {
        sut.requestTVShows()
        XCTAssertEqual(sut.tableViewNumberOfRows(),sut.cellViewModels?.count)
    }
    
    func test_title_viewmodels() {
        let correctValues = "TV Shows"
        XCTAssertEqual(correctValues, sut.getScreenTitle())
    }

}
