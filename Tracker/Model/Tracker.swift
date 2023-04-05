import UIKit

struct Tracker: Identifiable {
    let id: UUID
    let label: String
    let emoji: String
    let color: UIColor
    let schedule: [Weekday]?
    
    init(id: UUID = UUID(), label: String, emoji: String, color: UIColor, schedule: [Weekday]?) {
        self.id = id
        self.label = label
        self.emoji = emoji
        self.color = color
        self.schedule = schedule
    }
    
    init(traker: Tracker) {
        self.id = traker.id
        self.label = traker.label
        self.emoji = traker.emoji
        self.color = traker.color
        self.schedule = traker.schedule
    }
    
    init(data: Data) {
        guard let emoji = data.emoji, let color = data.colors else {fatalError()}
        
        self.id = UUID()
        self.label = data.label
        self.emoji = emoji
        self.color = color
        self.schedule = data.schedule
    }
    
    var data: Data {
        Data(label: label, emoji: emoji, colors: color, schedule: schedule)
    }
}

extension Tracker {
    struct Data {
        var label: String = ""
        var emoji: String? = nil
        var colors: UIColor? = nil
        var schedule: [Weekday]? = nil
    }
}

enum Weekday: String, CaseIterable, Comparable {
    case monday = "Понедельник"
    case tuesday = "Вторник"
    case wednesday = "Среда"
    case thursday = "Четверг"
    case friday = "Пятница"
    case saturday = "Суббота"
    case sunday = "Воскресенье"
    
    var shortFrom: String {
        switch self {
        case .monday: return "Пн"
        case .tuesday: return "Вт"
        case .wednesday: return "Ср"
        case .thursday: return "Чт"
        case .friday: return "Пт"
        case .saturday: return "Сб"
        case .sunday: return "Вс"
        }
    }
    
    static func < (lhs: Weekday, rhs: Weekday) -> Bool {
        guard
            let first = Self.allCases.firstIndex(of: lhs),
            let second = Self.allCases.firstIndex(of: rhs)
        else { return false }
        return first < second
    }
}
