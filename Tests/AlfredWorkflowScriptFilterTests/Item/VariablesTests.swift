@testable import AlfredWorkflowScriptFilter
import XCTest

class ItemVariablesTest: XCTestCase {
    private var item: Item?

    override func setUp() {
        super.setUp()

        item = Item(title: "keep moving")
    }
}

extension ItemVariablesTest {
    func test_that_there_may_be_no_variable() throws {
        let expectedOutput = """
        {
            "title": "keep moving"
        }
        """

        XCTAssertEqual(
            item,
            try JSONHelper().itemObject(from: expectedOutput)
        )
    }

    func test_that_there_may_be_one_variable() throws {
        item?.variables(
            Variable.create(name: "direction", value: "left")
        )

        let expectedOutput = """
        {
            "title": "keep moving",
            "variables": {
                "direction": "left"
            }
        }
        """

        XCTAssertEqual(
            item,
            try JSONHelper().itemObject(from: expectedOutput)
        )
    }

    func test_that_there_may_be_multiple_variables() throws {
        item?.variables(
            Variable.create(name: "race", value: "hooman")
        )
        item?.variables(
            Variable.create(name: "color", value: "absolutely"))

        let expectedOutput = """
        {
            "title": "keep moving",
            "variables": {
                "race": "hooman",
                "color": "absolutely"
            }
        }
        """

        XCTAssertEqual(
            item,
            try JSONHelper().itemObject(from: expectedOutput)
        )
    }
}
