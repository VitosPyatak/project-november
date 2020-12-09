import SwiftUI

var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

struct CountdownView: View {
    @Binding var doneLoading: Bool

    @State private var counter = 0
    private let countTo = 20

    var body: some View {
        VStack {
            ZStack {
                ProgressTrackView()
                ProgressBar(counter: counter, countTo: countTo)
                Clock(counter: counter, countTo: countTo)
            }
        }.onReceive(timer, perform: incrementCounter)
    }

    private func incrementCounter(_: Timer.TimerPublisher.Output) {
        if counter < countTo {
            counter += 1
        } else {
            doneLoading = true
        }
    }
}
