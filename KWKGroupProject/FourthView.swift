//
//  FourthView.swift
//  KWKGroupProject
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
    @State private var newGoalCost = ""
    @State private var savingsGoals: [SavingsGoal] = []
    @State private var editingGoal: SavingsGoal?
    @State private var newCurrentAmount = ""
    
    private func addNewGoal() {
        guard let cost = Double(newGoalCost), !newGoalName.isEmpty else {
            // Handle invalid input
            return
        }
        let newGoal = SavingsGoal(name: newGoalName, targetAmount: cost, currentAmount: 0)
        savingsGoals.append(newGoal)
        newGoalName = ""
        newGoalCost = ""
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
                    Section(header: Text("Add New Goal")
                        .foregroundStyle(.white).font(.system(size: 16))) {
                        TextField("Goal Name", text: $newGoalName)
                            .textFieldStyle(PlainTextFieldStyle()) // Remove border
                            .textInputAutocapitalization(.none) // Disable automatic capitalization
                            .foregroundColor(.orange)
                            .bold()
                        TextField("Cost", text: $newGoalCost)
                            .keyboardType(.decimalPad)
                            .textFieldStyle(PlainTextFieldStyle()) // Remove border
                            .foregroundColor(.orange)
                        Button(action: addNewGoal) {
                            Text("Add Goal")
                                .foregroundColor(.blue)
                        }
                    }

                    
                    Section(header: Text("Current Goals")
                        .foregroundStyle(.white).font(.system(size: 16))) {
                        List(savingsGoals) { goal in
                            VStack(alignment: .leading) {
                                Text(goal.name)
                                    .font(.headline)
                                    .foregroundColor(.orange)
                                    
                                Text("Cost: \(goal.targetAmount, specifier: "%.2f")")
                                    .foregroundColor(.orange)
                                Text("Current: \(goal.currentAmount, specifier: "%.2f")")
                                    .frame(maxWidth: .infinity, alignment: .leading) // Left-justify the text
                                    .foregroundColor(.orange)
                                Text("Progress: \(progress(for: goal), specifier: "%.1f")%")
                                    .foregroundColor(.orange)
                                
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
                                        .foregroundColor(.orange)
                                    
                                    TextField("Current Amount", text: $newCurrentAmount)
                                        .keyboardType(.decimalPad)
                                        .padding()
                                        .textFieldStyle(RoundedBorderTextFieldStyle()) // Add border
                                        .foregroundColor(.orange)
                                    
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
                .scrollContentBackground(.hidden)
            }
        }
    }
}

#Preview {
    FourthView()
}
