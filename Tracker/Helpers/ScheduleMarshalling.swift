import Foundation

final class ScheduleMarshalling {
    func stringFromArray(array: [String]) -> String {
        array.joined(separator: ",")
    }

    func arrayFromString(string: String) -> [String] {
        string.components(separatedBy: ",")
    }
}
