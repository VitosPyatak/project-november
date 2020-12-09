import SwiftUI

struct Clock: View {
    var counter: Int
    var countTo: Int

    var body: some View {
        VStack {
            Text(getDisplayTime())
                .font(.title2)
                .fontWeight(.black)
        }
    }

    private func getDisplayTime() -> String {
        TimeConverterService.convertToTimerDisplay(of: counter, and: countTo)
    }
}

struct ProgressTrackView: View {
    private let frameSize: CGFloat = 250
    private let progressTrackLineWidth: CGFloat = 15

    var body: some View {
        Circle()
            .fill(Color.clear)
            .frame(width: frameSize, height: frameSize, alignment: .center)
            .overlay(Circle().stroke(Color.black, lineWidth: progressTrackLineWidth))
    }
}

struct ProgressBar: View {
    var counter: Int
    var countTo: Int

    private let frameSize: CGFloat = 250
    private let circleTrimStart: CGFloat = 0
    private let circleTrimComplete: CGFloat = 1
    private let strokeStyleLineWidth: CGFloat = 15
    private let animationDuration: Double = 0.2

    var body: some View {
        Circle()
            .fill(Color.clear)
            .frame(width: frameSize, height: frameSize, alignment: .center)
            .overlay(
                Circle().trim(from: circleTrimStart, to: getProgress())
                    .stroke(style:
                        StrokeStyle(
                            lineWidth: strokeStyleLineWidth,
                            lineCap: .round,
                            lineJoin: .round
                    ))
                    .foregroundColor(getForegroundColor())
                    .animation(.easeInOut(duration: animationDuration))
            )
    }

    private func getProgress() -> CGFloat {
        CGFloat(counter) / CGFloat(countTo)
    }

    private func getForegroundColor() -> Color {
        getProgress() == circleTrimComplete ? .green : .orange
    }
}
