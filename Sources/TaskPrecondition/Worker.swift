public struct Worker {

    public init() {
    }

    public func compute(value: Int) async throws -> Int {
        return await withCheckedContinuation { continuation in
            compute(value: value) { result in
                continuation.resume(with: result)
            }
        }
    }

    public func compute(value: Int, resultHandler: @escaping (Result<Int, Never>) -> Void) {
        precondition(value.isOdd, "Value must be odd")
        resultHandler(.success(value * 2))
    }

}

extension Int {
    var isOdd: Bool {
        self % 2 == 1
    }
}
