import Foundation

public protocol DesignPattern {
    static func startExample()
}

// MARK: - StrategyPattern
public struct StrategyPattern: DesignPattern {
    public static func startExample() {
        let trader = Trader(strategy: SomeTradeStrategy())
        trader.trade()

        trader.strategy = AnotherTradeStrategy()
        trader.trade()

        trader.strategy = RandomStrategy()

        (1...10).forEach { _ in
            trader.trade()
        }
    }
}

// MARK: - ObserverPattern
public struct ObserverPattern: DesignPattern {
    public static func startExample() {
        let subject = OTTCommunity()
        let netflixCommunityUser = NetflixCommunityUser()
        let disneyPlusCommunityUser = DisneyPlusCommunityUser()

        // 1
        subject.register(netflixCommunityUser)
        subject.register(disneyPlusCommunityUser)

        subject.notify()

        // 2
        subject.unregister(netflixCommunityUser)
        subject.notify()
    }
}
