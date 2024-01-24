//
//  MusclePicker.swift
//  petForMe
//
//  Created by Abdullah Abdulkareem on 1/23/24.
//

import SwiftUI

struct MusclePicker: View {
    
    @Binding var muscle: String
    var body: some View {
        
        TabView(selection: $muscle) {
            ForEach(MuscleGroup.allCases) { muscle in
                Text(muscle.noUnderScore)
                    .tag(muscle.name)
            }
        }
        .frame(maxHeight: 160)
        .font(.title.bold())
        .tabViewStyle(.page)
        
        
//        Picker("Muscle Group", selection: $muscle) {
//            ForEach(MuscleGroup.allCases) { muscle in
//                Text(muscle.noUnderScore)
//                    .tag(muscle.name)
//            }
//        }
//        .pickerStyle(.wheel)
    }
}

#Preview {
    MusclePicker(muscle: .constant("abdominals"))
}
