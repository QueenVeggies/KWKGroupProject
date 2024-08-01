//
//  ThirdView.swift
//  KWKGroupProject
//
//  Created by Jewel Domingo on 7/31/24.
//

import SwiftUI

struct ThirdView: View {
    @State private var category1 = ""
    @State private var category2 = ""
    @State private var category3 = ""
    @State private var category1On = false
    @State private var category2On = false
    @State private var category3On = false
    @State private var value1 = ""
    @State private var value2 = ""
    @State private var value3 = ""
    @State private var totalBudget: Double = 25.00
    @State private var remainingBudget: Double = 25.00
    
    var body: some View {
        ZStack {
            Color.teal.opacity(0.8)
                .ignoresSafeArea()
            VStack(spacing: 20.0){
                HStack {
                    Text("Budgeting Map")
                        .font(.title)
                        .bold()
                        .foregroundStyle(.white)
                    
                    Image("budgeting map")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 60, height: 70)
                }
                Text("Your weekly budget:")
                    .font(.system(size: 20))
                    .bold()
                    .foregroundStyle(.white)
                
                Text("$\(totalBudget, specifier: "%.2f")")
                    .foregroundStyle(.white)
                    .font(.title)
                    .bold()
                    .opacity(1.0)
                
                Text("Remaining budget:")
                    .foregroundStyle(remainingBudget >= 0 ? .white : .red)
                    .font(.system(size: 20))
                    .bold()
                
                Text("$\(remainingBudget, specifier: "%.2f")")
                    .foregroundStyle(remainingBudget >= 0 ? .white : .red)
                    .font(.title)
                    .bold()
                    .opacity(1.0)
                
                Text("Split your weekly budget into categories! Examples of categories: food, clothing, technology")
                    .font(.headline)
                    .bold()
                    .foregroundStyle(.white)
                    .tint(.orange)
                    .multilineTextAlignment(.center)
                    .padding()
                
                VStack(spacing: 20.0) {
                    if !category1On {
                        Button("+ Add a category") {
                            category1On = true
                        }
                        .opacity(!category1On ? 1 : 0)
                        .buttonStyle(.borderedProminent)
                        .tint(.orange)
                        .padding()
                        .shadow(color : .gray, radius : 4)
                    } else {
                        HStack {
                            TextField("Enter category here", text: $category1)
                                .multilineTextAlignment(.center)
                                .background(Color.white.opacity(0.4))
                                .cornerRadius(7.0)
                                .foregroundStyle(.white)
                                .shadow(color : .gray, radius : 4)
                                .font(.system(size: 25))
                            
                            TextField("$", text: $value1)
                                .keyboardType(.decimalPad)
                                .multilineTextAlignment(.center)
                                .font(.system(size: 25))
                                .foregroundStyle(.white)
                                .bold()
                                .onChange(of: value1) { _ in
                                    calculateRemainingBudget()
                                }
                        }
                        .padding()
                    }
                    
                    if !category2On {
                        Button("+ Add a category") {
                            category2On = true
                        }
                        .opacity(!category2On ? 1 : 0)
                        .buttonStyle(.borderedProminent)
                        .tint(.orange)
                        .padding()
                        .shadow(color : .gray, radius : 4)
                    } else {
                        HStack {
                            TextField("Enter category here", text: $category2)
                                .multilineTextAlignment(.center)
                                .background(Color.white.opacity(0.4))
                                .cornerRadius(7.0)
                                .foregroundStyle(.white)
                                .shadow(color : .gray, radius : 4)
                                .font(.system(size: 25))
                            
                            TextField("$", text: $value2)
                                .keyboardType(.decimalPad)
                                .multilineTextAlignment(.center)
                                .foregroundStyle(.white)
                                .font(.system(size: 25))
                                .bold()
                                .onChange(of: value2) { _ in
                                    calculateRemainingBudget()
                                }
                        }
                        .padding()
                    }
                    
                    if !category3On {
                        Button("+ Add a category") {
                            category3On = true
                        }
                        .opacity(!category3On ? 1 : 0)
                        .buttonStyle(.borderedProminent)
                        .tint(.orange)
                        .shadow(color : .gray, radius : 4)
                        .padding()
                    } else {
                        HStack {
                            TextField("Enter category here", text: $category3)
                                .multilineTextAlignment(.center)
                                .background(Color.white.opacity(0.4))
                                .cornerRadius(7.0)
                                .foregroundStyle(.white)
                                .shadow(color : .gray, radius : 4)
                                .font(.system(size: 25))

                            
                            TextField("$", text: $value3)
                                .keyboardType(.decimalPad)
                                .multilineTextAlignment(.center)
                                .foregroundStyle(.white)
                                .font(.system(size: 25))
                                .bold()
                                .onChange(of: value3) { _ in
                                    calculateRemainingBudget()
                                }
                        }
                        .padding()
                    }
                }
            }
        }
    }
    
    private func calculateRemainingBudget() {
        let values = [value1, value2, value3]
        let totalValues = values.compactMap { Double($0) }.reduce(0, +)
        let previousRemainingBudget = remainingBudget
        remainingBudget = totalBudget - totalValues

        if remainingBudget >= 0 && previousRemainingBudget < 0 {
            // Budget returned to a positive state
        } else if remainingBudget < 0 && previousRemainingBudget >= 0 {
            // Budget went into a deficit
        }
    }
}

#Preview {
    ThirdView()
}
