import XCTest
import Hela
@testable import TaskPrecondition

final class WorkerTests: XCTestCase {

    func testWorkerWithOddNumberWithClosure() throws {
        let exp = expectation(description: #function)
        let value = 1
        let worker = Worker()
        try XCTAssertNoThrowFatalError {
            worker.compute(value: value) { result in
                let output = (try? result.get()) ?? -1
                XCTAssertEqual(output, value * 2)
                exp.fulfill()
            }
        }
        wait(for: [exp], timeout: 1.0)
    }

    func testWorkerWithOddNumberWithAsync() throws {
        let exp = expectation(description: #function)
        let value = 1
        let worker = Worker()
        try XCTAssertNoThrowFatalError {
            Task.detached {
                let result = try await worker.compute(value: value)
                XCTAssertEqual(result, value * 2)
                exp.fulfill()
            }
        }
        wait(for: [exp], timeout: 1.0)
    }

    func testWorkerWithEvenNumberWithClosure() throws {
        let value = 2
        let worker = Worker()
        try XCTAssertThrowFatalError {
            worker.compute(value: value) { result in
                let output = (try? result.get()) ?? -1
                XCTAssertEqual(output, value * 2)
            }
        }
    }

    func testWorkerWithEvenNumberWithAsync() throws {
        let value = 2
        let worker = Worker()
        try XCTAssertThrowFatalError {
            Task.detached {
                let result = try await worker.compute(value: value)
                XCTAssertEqual(result, value * 2)
            }
        }
    }
}
