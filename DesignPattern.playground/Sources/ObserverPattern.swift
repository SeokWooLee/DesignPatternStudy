import Foundation

// MARK: - Interface: Subject
public protocol CommunitySubject {
    func register(_ observer: any CommunityObserver)
    func unregister(_ observer: any CommunityObserver)

    func notify()
}

// MARK: - Implementation: Subject
public final class OTTCommunity: CommunitySubject {
    private var observers: Set<AnyCommunityObserver> = .init()

    public init() {}

    public func register(_ observer: any CommunityObserver) {
        observers.insert(observer.eraseToAnyCommunityObserver())
    }

    public func unregister(_ observer: any CommunityObserver) {
        observers.remove(observer.eraseToAnyCommunityObserver())
    }

    public func notify() {
        observers.forEach { $0.didNotify() }
    }
}

// MARK: - Interface: Observer
public protocol CommunityObserver: Hashable {
    func didNotify()
}

// MARK: - Type Erasure
struct AnyCommunityObserver: CommunityObserver {
    private let communityObserver: any CommunityObserver

    init(communityObserver: some CommunityObserver) {
        self.communityObserver = communityObserver
    }

    func didNotify() {
        communityObserver.didNotify()
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(communityObserver)
    }

    static func == (lhs: AnyCommunityObserver, rhs: AnyCommunityObserver) -> Bool {
        (lhs.communityObserver as! AnyHashable) == (rhs.communityObserver as! AnyHashable)
    }
}

extension CommunityObserver {
    func eraseToAnyCommunityObserver() -> AnyCommunityObserver {
        AnyCommunityObserver(communityObserver: self)
    }
}

// MARK: - Implementation: Observer
public struct NetflixCommunityUser: CommunityObserver {
    public func didNotify() {
        print("Netflix 커뮤니티에 새로운 의견이 올라왔습니다.")
    }
}

// MARK: - Implementation: Observer
public struct DisneyPlusCommunityUser: CommunityObserver {
    public func didNotify() {
        print("Disney+ 커뮤니티에 새로운 의견이 올라왔습니다.")
    }
}
