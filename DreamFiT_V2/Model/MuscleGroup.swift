//
//  MuscleGroup.swift
//  petForMe
//
//  Created by Abdullah Abdulkareem on 1/23/24.
//

import Foundation

enum MuscleGroup: String, Identifiable, CaseIterable {
    
    case abdominals
    case abductors
    case biceps
    case calves
    case chest
    case forearms
    case glutes
    case hamstrings
    case lats
    case lower_back
    case middle_back
    case neck
    case quadriceps
    case traps
    case triceps
    
    
    var name: String {
        self.rawValue
    }
    
    var id: String {
        name
    }
    
    var noUnderScore: String {
        if name == "middle_back" {
            return "middle back"
        } else if name == "lower_back" {
            return "lower back"
        }
        
        return name
    }
}
