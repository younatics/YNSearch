//
//  YNSearchTests.swift
//  YNSearchTests
//
//  Deterministic unit tests for YNSearch's persistence layer (categories and
//  search histories, backed by UserDefaults) and its model. These run headlessly
//  on the simulator and pin the public store API that the search UI relies on.
//

import XCTest
@testable import YNSearch

@MainActor
final class YNSearchTests: XCTestCase {

    private let categoriesKey = "categories"
    private let historiesKey = "histories"

    override func setUp() {
        super.setUp()
        // Start each test from a clean store so assertions are deterministic.
        UserDefaults.standard.removeObject(forKey: categoriesKey)
        UserDefaults.standard.removeObject(forKey: historiesKey)
    }

    override func tearDown() {
        UserDefaults.standard.removeObject(forKey: categoriesKey)
        UserDefaults.standard.removeObject(forKey: historiesKey)
        super.tearDown()
    }

    func testCategoriesRoundTrip() {
        let search = YNSearch()
        XCTAssertNil(search.getCategories())

        search.setCategories(value: ["Food", "Travel", "Tech"])

        XCTAssertEqual(search.getCategories(), ["Food", "Travel", "Tech"])
    }

    func testAppendSearchHistoriesAccumulates() {
        let search = YNSearch()
        XCTAssertNil(search.getSearchHistories())

        search.appendSearchHistories(value: "swift")
        search.appendSearchHistories(value: "uikit")

        XCTAssertEqual(search.getSearchHistories(), ["swift", "uikit"])
    }

    func testDeleteSearchHistoriesRemovesByIndex() {
        let search = YNSearch()
        search.setSearchHistories(value: ["a", "b", "c"])

        search.deleteSearchHistories(index: 1)

        XCTAssertEqual(search.getSearchHistories(), ["a", "c"])
    }

    func testSharedInstanceIsStable() {
        XCTAssertTrue(YNSearch.shared === YNSearch.shared)
    }

    func testYNSearchModelStoresKey() {
        let model = YNSearchModel(key: "hello")
        XCTAssertEqual(model.key, "hello")
    }
}
