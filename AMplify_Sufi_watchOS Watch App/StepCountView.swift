//
//  StepCountView.swift
//  AMplify_Sufi_watchOS Watch App
//
//  Created by Sufi Arifin on 15/05/25.
//

import SwiftUI

struct StepCountView: View {
    @State private var currentDate = Date()
    @State private var timerSeconds: TimeInterval = 300 // Initial 5 minutes in seconds
    @State private var steps: Int = 150
    let stepGoal: Int = 750

    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd"
        return formatter
    }()

    let timeFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter
    }()

    var timerComponents: (minutes: Int, seconds: Int, milliseconds: Int) {
        let minutes = Int(timerSeconds) / 60
        let seconds = Int(timerSeconds) % 60
        let milliseconds = Int((timerSeconds - floor(timerSeconds)) * 100)
        return (minutes, seconds, milliseconds)
    }

    var progress: Double {
        guard stepGoal > 0 else { return 0 }
        return Double(steps) / Double(stepGoal)
    }

    var body: some View {
        VStack {
            HStack {
                Text(dateFormatter.string(from: currentDate).uppercased())
                    .font(.caption)
                    .foregroundColor(.gray)
                Spacer()
                Text(timeFormatter.string(from: currentDate))
                    .font(.caption)
            }
            .padding(.horizontal)
            .padding(.vertical, 1)
            .padding(.top, 1)

            HStack {
                Image(systemName: "timer")
                    .font(.caption2)
                    .foregroundColor(.gray)
                Text("TIMER : \(String(format: "%02d:%02d.%02d", timerComponents.minutes, timerComponents.seconds, timerComponents.milliseconds))")
                    .font(.caption2)
            }
            .padding(.vertical, 5)
            .padding(.bottom, 5)

            ZStack {
                // Background Circular Track
                Circle()
                    .stroke(lineWidth: 25)
                    .frame(width: 100, height: 100)
                    .opacity(0.3)
                    .foregroundColor(Color.gray)

                // Foreground Progress Track
                Circle()
                    .trim(from: 0.0, to: CGFloat(progress))
                    .stroke(style: StrokeStyle(lineWidth: 20, lineCap: .round))
                    .foregroundColor(Color.orange)
                    .rotationEffect(Angle(degrees: -90)) // Start from the top

                Text("\(steps)")
                    .font(.system(size: 35, weight: .semibold, design: .rounded))
            }
            .padding(.bottom, 15)

            VStack(alignment: .center) {
                Text("Goals : \(stepGoal)")
                    .font(.caption)
                    .foregroundColor(.white)
                Text("Steps : \(steps)")
                    .font(.caption)
                    .foregroundColor(.orange)
            }
            .frame(width: 100, alignment: .center)
        }
        .padding()
        .edgesIgnoringSafeArea(.all)
        .background(Color(red: 0/255, green: 89/255, blue: 86/255))
        .onReceive(timer) { input in
            currentDate = input
            if timerSeconds > 0 {
                timerSeconds -= 1
            }
        }
    }
}

struct StepCountView_Previews: PreviewProvider {
    static var previews: some View {
        StepCountView()
    }
}
