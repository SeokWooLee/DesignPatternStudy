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

// MARK: - DecoratorPattern
public struct DecoratorPattern: DesignPattern {
    public static func startExample() {
        var ninja: Ninja = Naruto()
        printPower(ninja, episode: "에피소드 0")

        ninja = Sharingan(ninja: ninja)
        printPower(ninja, episode: "에피소드 1: 사륜안 기술 체득")

        ninja = Rasengan(ninja: ninja)
        printPower(ninja, episode: "에피소드 2: 나선환 기술 체득")

        ninja = ShadowCloneTechnique(ninja: ninja)
        printPower(ninja, episode: "에피소드 3: 환영분신술 체득")
    }

    private static func printPower(_ ninja: Ninja, episode: String) {
        print(
        """
        \(episode)
        \(ninja)
        파워: \(ninja.power)

        """
        )
    }
}
