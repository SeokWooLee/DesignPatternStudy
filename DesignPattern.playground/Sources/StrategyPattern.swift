import Foundation

// MARK: - Trader
public class Trader {
    public var strategy: TradeStrategy

    private var result = 1.0

    public init(strategy: TradeStrategy) {
        self.strategy = strategy
    }

    public func trade() {
        result *= strategy.trade()
        print("수익률:", result)
    }
}

// MARK: - TradeStrategy
public protocol TradeStrategy {
    func trade() -> Double
}

public struct SomeTradeStrategy: TradeStrategy {
    public init() {}

    public func trade() -> Double {
        return 1.1
    }
}

public struct AnotherTradeStrategy: TradeStrategy {
    public init() {}

    public func trade() -> Double {
        return 0.9
    }
}

public struct RandomStrategy: TradeStrategy {
    public init() {}

    public func trade() -> Double {
        return Double.random(in: 0.0 ..< 1.3)
    }
}
