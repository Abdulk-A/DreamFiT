//
//  ContentView.swift
//  petForMe
//
//  Created by Abdullah Abdulkareem on 1/23/24.
//

import SwiftUI

let exampleArray: [String: String] = ["workout1": "cardio",
                                      "workout2": "strength",
                                      "workout3": "strength",
                                      "workout4": "strength",
                                      "workout5": "cardio",
                                      "workout6": "strength",
                                      "workout7": "cardio",
                                      "workout8": "strength",
                                      "workout9": "cardio",
                                      "workout10": "strength",
]


struct ContentView: View {
    
    @State private var difficulty = "beginner"
    @State private var muscle = "abdominals"
    
    @State private var exercises = [Exercise]()
    
    
    
    var body: some View {
        NavigationStack{
            
            VStack{
                DifficultyPicker(difficulty: $difficulty)
                Spacer()
                    .onChange(of: difficulty) {
                        Task {
                           do {
                               exercises = try await APIService().fetch(for: muscle, andFor: difficulty)
                           }
                           catch {
                               exercises = []
                           }
                       }
                    }
                List{
                    ForEach(exercises) { exercise in
                        
                        VStack(alignment: .leading){
                            
                            NavigationLink {
                                ExerciseDetail(exercise: exercise)
                            } label: {
                                Text(exercise.name)
                                    .font(.headline)
                                Text(exercise.type)
                                    .font(.caption)
                                    .foregroundStyle(.white.opacity(0.6))
                            }

                        }
                        
                    }
                }
                Spacer()
                MusclePicker(muscle: $muscle)
                    .onChange(of: muscle) {
                        Task {
                           do {
                               exercises = try await APIService().fetch(for: muscle, andFor: difficulty)
                           }
                           catch {
                               exercises = []
                           }
                       }
                    }
            }
            .padding()
            .navigationTitle("DreamFiT")
            .navigationBarTitleDisplayMode(.inline)
        }
        .preferredColorScheme(.dark)
        .onAppear(perform: {
             Task {
                do {
                    exercises = try await APIService().fetch(for: muscle, andFor: difficulty)
                }
                catch {
                    exercises = []
                }
            }
        })
    }
}

#Preview {
    ContentView()
}
