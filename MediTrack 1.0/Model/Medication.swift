//
//  Medication.swift
//  MediTrack 1.0
//
//  Created by Angelique Abacajan on 11/22/19.
//  Copyright © 2019 Angelique Abacajan. All rights reserved.
//

import Foundation

struct Medication: Equatable {
    
    static func == (lhs: Medication, rhs: Medication) -> Bool {
        return true
    }
    
    var name: String
    var dosage: String
    var dosageType: String?
    var totalDosage: String?
    var prescription: Bool
    var frequency: Frequency
    
    init(name: String, dosage: String, dosageType: String?, totalDosage: String = "", prescription: Bool = false, frequency: Frequency) {
        self.name = name
        self.dosage = dosage
        self.totalDosage = totalDosage
        self.dosageType = dosageType
        self.prescription = prescription
        self.frequency = frequency
    }
    
    
}

enum Frequency: String, Codable, CaseIterable {
    case onceADay = "Once a day"
    case twiceADay = "Twice a day"
    case daily = "Daily"
    case everyOtherDay = "Every other day"
    case weekly = "Weekly"
    case monthly = "Monthly"
    
    var howOften: String {
        return self.rawValue
    }
    
    static var frequencies: [String] {
        return [Frequency.onceADay.rawValue, Frequency.twiceADay.rawValue, Frequency.daily.rawValue, Frequency.everyOtherDay.rawValue, Frequency.weekly.rawValue, Frequency.monthly.rawValue]
    }
}
