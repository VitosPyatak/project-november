import Foundation

struct TimeConverterService {
    private static let minutesDivider = 60
    private static let zeroAppendingThreshold = 10

    static func convertToTimerDisplay(of firstNumber: Int, and secondNumber: Int) -> String {
        let currentSecondsTime = secondNumber - firstNumber
        let minutes = getMinutes(from: currentSecondsTime)
        let seconds = getMinuteSeconds(from: currentSecondsTime)
        return getSecondsAndMinutesDisplayString(minutes: minutes, seconds: seconds)
    }

    static func getMinutes(from seconds: Int) -> Int {
        Int(seconds / minutesDivider)
    }

    static func getMinuteSeconds(from seconds: Int) -> Int {
        seconds % minutesDivider
    }

    private static func getSecondsAndMinutesDisplayString(minutes: Int, seconds: Int) -> String {
        let finalSeconds = seconds < zeroAppendingThreshold ? "\(0)\(seconds)"  : String(seconds)
        return "\(minutes):\(finalSeconds)"
    }
}
