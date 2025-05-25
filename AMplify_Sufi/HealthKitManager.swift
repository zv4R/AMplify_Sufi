//
//  Untitled.swift
//  AMplify_Sufi
//
//  Created by Sufi Arifin on 25/05/25.
//

import HealthKit

class HealthKitManager {
    let healthStore = HKHealthStore()
    
    func requestAuthorization(completion: @escaping (Bool, Error?) -> Void) {
        // Define the types of data you want to read.
        guard let stepCountType = HKQuantityType.quantityType(forIdentifier: .stepCount) else {
            fatalError("Step Count Type is not available!")
        }
        
        let typesToRead: Set<HKObjectType> = [stepCountType]
        
        healthStore.requestAuthorization(toShare: nil, read: typesToRead) { (success, error) in
            DispatchQueue.main.async {
                completion(success, error)
            }
        }
    }
    
    func fetchStepCount(forInterval interval: DateInterval, completion: @escaping (Int, Error?) -> Void) {
        guard let stepCountType = HKQuantityType.quantityType(forIdentifier: .stepCount) else {
            completion(0, NSError(domain: "HealthKitManager", code: 100, userInfo: [NSLocalizedDescriptionKey: "Step Count Type not available"]))
            return
        }
        
        let predicate = HKQuery.predicateForSamples(withStart: interval.start, end: interval.end, options: .strictStartDate)
        
        let query = HKStatisticsQuery(quantityType: stepCountType, quantitySamplePredicate: predicate, options: .cumulativeSum) { (_, statistics, error) in
            DispatchQueue.main.async {
                var totalSteps = 0
                if let quantity = statistics?.sumQuantity() {
                    totalSteps = Int(quantity.doubleValue(for: HKUnit.count()))
                }
                completion(totalSteps, error)
            }
        }
        
        healthStore.execute(query)
    }
    
    // Function to get today's steps
    func fetchTodayStepCount(completion: @escaping (Int, Error?) -> Void) {
        let now = Date()
        let startOfDay = Calendar.current.startOfDay(for: now)
        let interval = DateInterval(start: startOfDay, end: now)
        fetchStepCount(forInterval: interval, completion: completion)
    }
    
    // Helper to get start of day, considering time zone
    func startOfDay(for date: Date, calendar: Calendar) -> Date {
        calendar.startOfDay(for: date)
    }
}
