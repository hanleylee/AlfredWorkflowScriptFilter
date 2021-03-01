// TODO: the Mod class should be abstract
//
// can't do abstract classes in Swift. handle this with a Protocol?

class Mod: Codable {
    private var subtitle: String?
    private var arg: String?
    private var valid: Bool?
    private var icon: Icon?
    private var variables: [String: String]?

    init(subtitle: String? = nil, arg: String? = nil, valid: ItemValidity? = nil, icon: Icon? = nil) {
        self.subtitle = subtitle
        self.arg = arg

        switch valid {
        case .true:
            self.valid = true
        case .false:
            self.valid = false
        default:
            self.valid = nil
        }

        self.icon = icon
    }

    @discardableResult
    func icon(_ icon: Icon) -> Mod {
        self.icon = icon

        return self
    }
}

extension Mod: Equatable {
    static func == (lhs: Mod, rhs: Mod) -> Bool {
        lhs.subtitle == rhs.subtitle
            && lhs.arg == rhs.arg
            && lhs.valid == rhs.valid
            && lhs.icon == rhs.icon
    }
}

class Ctrl: Mod {}
class Cmd: Mod {}
class Alt: Mod {}
class Fn: Mod {}
class Shift: Mod {}