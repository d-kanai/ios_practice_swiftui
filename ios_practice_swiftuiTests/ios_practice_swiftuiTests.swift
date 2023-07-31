import XCTest
@testable import ios_practice_swiftui

class ios_practice_swiftuiTests: XCTestCase {
    
    func testAllHit() throws {
        //given
        let sut = TodoFilter(items: ["clean room", "clean garden"])
        //when
        let actual = sut.filter(keyword: "clean")
        //then
        XCTAssertEqual(actual.count, 2)
    }
    
    func testFilterHit() throws {
        //given
        let sut = TodoFilter(items: ["clean room", "clean garden"])
        //when
        let actual = sut.filter(keyword: "garden")
        //then
        XCTAssertEqual(actual.count, 1)
    }
    
    func testAllHitWhenEmpty() throws {
        //given
        let sut = TodoFilter(items: ["clean room", "clean garden"])
        //when
        let actual = sut.filter(keyword: "")
        //then
        XCTAssertEqual(actual.count, 2)
    }
 
    
}
