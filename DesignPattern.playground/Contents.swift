import Foundation

let trader = Trader(strategy: SomeTradeStrategy())
trader.trade()

trader.strategy = AnotherTradeStrategy()
trader.trade()

trader.strategy = RandomStrategy()

(1...10).forEach { _ in
    trader.trade()
}
