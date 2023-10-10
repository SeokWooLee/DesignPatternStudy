import Foundation

// MARK: - Ninja
public protocol Ninja: CustomStringConvertible {
    var power: Int { get }
}

public class Naruto: Ninja {
    public var power: Int = 10
    public let description: String = "나루토"

    public init() {}
}

// MARK: - Decorator
protocol PowerDecorator: Ninja {
    var ninja: Ninja { get }
    var powerUpPoint: Int { get }
    var powerDescription: String { get }
}

// MARK: - Decorator: Default Implementation
extension PowerDecorator {
    public var power: Int { ninja.power + powerUpPoint }
    public var description: String { "\(ninja) / \(powerDescription)" }
}

// MARK: - Decorator: Concrete Implementation
public struct Sharingan: PowerDecorator {
    let ninja: Ninja
    let powerUpPoint: Int = 20
    let powerDescription: String = "사륜안 기술 체득"

    public init(ninja: Ninja) {
        self.ninja = ninja
    }
}

public struct Rasengan: PowerDecorator {
    let ninja: Ninja
    let powerUpPoint: Int = 30
    let powerDescription: String = "나선환 기술 체득"

    public init(ninja: Ninja) {
        self.ninja = ninja
    }
}

public struct ShadowCloneTechnique: PowerDecorator {
    let ninja: Ninja
    let powerUpPoint: Int = 50
    let powerDescription: String = "환영분신술 체득"

    public init(ninja: Ninja) {
        self.ninja = ninja
    }
}
