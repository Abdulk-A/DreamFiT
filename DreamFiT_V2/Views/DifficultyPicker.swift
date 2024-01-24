//
//  DifficultyPicker.swift
//  petForMe
//
//  Created by Abdullah Abdulkareem on 1/23/24.
//

import SwiftUI

struct DifficultyPicker: View {
    
    @Binding var difficulty: String
    
    var body: some View {
        Picker("Difficulty", selection: $difficulty){
            Text("beginner")
                .tag("beginner")
            Text("intermediate")
                .tag("intermediate")
            
            Text("expert")
                .tag("expert")
        }
        .pickerStyle(.segmented)
        
    }
}

#Preview {
    DifficultyPicker(difficulty: .constant("beginner"))
}
