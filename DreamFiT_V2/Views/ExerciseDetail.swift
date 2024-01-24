//
//  ExerciseDetail.swift
//  petForMe
//
//  Created by Abdullah Abdulkareem on 1/24/24.
//

import SwiftUI

struct ExerciseDetail: View {
    
    var exercise: Exercise
    

    
    var body: some View {
        
        Text(exercise.name)
            .font(.title.bold())
            .padding(.bottom, 5)
        HStack{
            Text(exercise.difficulty)
                .foregroundStyle(exercise.colorForDifficulty)
                .bold()
            Text("-")
            Text(exercise.muscle)
            Text("-")
            Text(exercise.type)
        }
        .font(.headline)
        .foregroundStyle(.white.opacity(0.8))
        ScrollView {
            VStack{

                Divider()
                
                Text(exercise.instructions)
                    .font(.headline)
                    .padding(.bottom, 25)
                Divider()
                    .frame(minHeight: 2)
                    .overlay(.secondary)
                    .padding(.bottom, 10)
                HStack{
                    Text("Equipment:")
                        .bold()
                    Text(exercise.equipment)
                }
            }
            
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .preferredColorScheme(.dark)
            .padding()
        }
        .scrollBounceBehavior(.basedOnSize)
    }
}

#Preview {
    ExerciseDetail(exercise: Exercise.exampleData)
}
