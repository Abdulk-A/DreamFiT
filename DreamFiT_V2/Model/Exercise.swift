//
//  Exercise.swift
//  petForMe
//
//  Created by Abdullah Abdulkareem on 1/23/24.
//

import SwiftUI


struct Workout: Codable {
    var id = UUID()
    var workout: [Exercise]
}

struct Exercise: Codable, Identifiable {
    var id = UUID()
    let name: String
    let type: String
    let muscle: String
    let equipment: String
    let difficulty: String
    let instructions: String

    private enum CodingKeys: String, CodingKey {
        case name
        case type
        case muscle
        case equipment
        case difficulty
        case instructions
    }
    
    var colorForDifficulty: Color {
        if self.difficulty == "beginner" {
            return .green
        } else if self.difficulty == "intermediate" {
            return .yellow
        }
           
        return .red
    }
}

extension Exercise {
    static var exampleData = Exercise(name: "Bench Press", type: "strength", muscle: "chest", equipment: "Bench, barbell, and weights", difficulty: "beginner", instructions: "load the appropriate weights. Lay down on the bench. place hands an equal distance from each other. Lower weight down and press up. If you can do 10 reps, go for 5... remember to save some reps for the other sets. Rest is important for growth!")
}
