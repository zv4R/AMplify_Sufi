//
//  CoreMotionManager.swift
//  AMplify_Sufi
//
//  Created by Sufi Arifin on 25/05/25.
//

import CoreMotion

class PedometerManager: ObservableObject {
    private let pedometer = CMPedometer()
    @Published var currentSteps: Int = 0
    @Published var isPedometerAvailable: Bool = false

    init() {
        isPedometerAvailable = CMPedometer.isStepCountingAvailable()
    }

    func startLiveStepCounting() {
        guard isPedometerAvailable else {
            print("Pedometer not available on this device.")
            return
        }

        // Start updates from the current moment
        pedometer.startUpdates(from: Date()) { [weak self] (pedometerData, error) in
            DispatchQueue.main.async {
                if let data = pedometerData {
                    self?.currentSteps = data.numberOfSteps.intValue
                } else if let error = error {
                    print("Error getting pedometer data: \(error.localizedDescription)")
                }
            }
        }
    }

    func stopLiveStepCounting() {
        pedometer.stopUpdates()
    }
}
