//
//  FourthView.swift
//  KWKGroupProject
//
//  Created by Shreenidhi Kunta on 8/1/24.
//

import SwiftUI

struct SavingsGoal: Identifiable {
    let id = UUID()
    var name: String
    var targetAmount: Double
    var currentAmount: Double
}

struct FourthView: View {
    @State private var newGoalName = ""
    @State private var newGoalTargetAmount = ""
    @State private var savingsGoals: [SavingsGoal] = []
    @State private var editingGoal: SavingsGoal?
    @State private var newCurrentAmount = ""
    
    private func addNewGoal() {
        guard let targetAmount = Double(newGoalTargetAmount), !newGoalName.isEmpty else {
            // Handle invalid input
            return
        }
        let newGoal = SavingsGoal(name: newGoalName, targetAmount: targetAmount, currentAmount: 0)
        savingsGoals.append(newGoal)
        newGoalName = ""
        newGoalTargetAmount = ""
    }
    
    private func updateGoal() {
        guard let editingGoal = editingGoal,
              let newAmount = Double(newCurrentAmount) else {
            // Handle invalid input
            return
        }
        if let index = savingsGoals.firstIndex(where: { $0.id == editingGoal.id }) {
            savingsGoals[index].currentAmount = newAmount
            self.editingGoal = nil
            newCurrentAmount = ""
        }
    }
    
    private func progress(for goal: SavingsGoal) -> Double {
        return (goal.currentAmount / goal.targetAmount) * 100
    }

    var body: some View {
        ZStack {
            Color.teal.opacity(0.8)
                .ignoresSafeArea()
            
            VStack {
                HStack {
                    Text("Savings Goals")
                        .font(.title)
                        .foregroundStyle(.white)
                        .bold()
                    
                    Image("money bag")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50, height: 70)
                }
                .padding()
                
                Form {
                    Section(header: Text("Add New Goal")) {
                        TextField("Goal Name", text: $newGoalName)
                        TextField("Target Amount", text: $newGoalTargetAmount)
                            .keyboardType(.decimalPad)
                        Button(action: addNewGoal) {
                            Text("Add Goal")
                                .foregroundColor(.blue)
                        }
                    }
                    
                    Section(header: Text("Current Goals")) {
                        List(savingsGoals) { goal in
                            VStack(alignment: .leading) {
                                Text(goal.name)
                                    .font(.headline)
                                Text("Target: \(goal.targetAmount, specifier: "%.2f")")
                                Text("Current: \(goal.currentAmount, specifier: "%.2f")")
                                Text("Progress: \(progress(for: goal), specifier: "%.1f")%")
                                
                                Button(action: {
                                    editingGoal = goal
                                }) {
                                    Text("Edit")
                                        .foregroundColor(.blue)
                                }
                            }
                            .sheet(item: $editingGoal) { goal in
                                VStack {
                                    Text("Edit Goal: \(goal.name)")
                                        .font(.headline)
                                    
                                    TextField("New Current Amount", text: $newCurrentAmount)
                                        .keyboardType(.decimalPad)
                                    
                                    Button(action: updateGoal) {
                                        Text("Update")
                                            .foregroundColor(.blue)
                                    }
                                }
                                .padding()
                            }
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    FourthView()
}
