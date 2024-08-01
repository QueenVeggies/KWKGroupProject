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
    
    
    var body: some View {
        ZStack {
            Color.teal.opacity(0.8)
                .ignoresSafeArea()
            VStack(spacing: 20.0){
                Text("Budgeting Map")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .bold()
                    .foregroundStyle(.white)
                
                Text("Your weekly budget:")
                    .foregroundStyle(.white)
                
                Text("$25.00")
                    .foregroundStyle(.white)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .bold()
                    .opacity(1.0)
                
                
                Text("Split your weekly budget into categories! Examples of categories - food, clothing, technology")
                    .font(.headline)
                    .bold()
                    .foregroundStyle(.white)
                    .tint(.orange)
                    .padding()
                
               
        
                
                VStack(spacing: 20.0) {
                    if (!category1On)
                    {
                        Button("+ Add a category")
                        {
                            category1On = true
                        }
                        .opacity(!category1On ? 1: 0)
                        .buttonStyle(.borderedProminent)
                        .tint(.orange)
                        .padding()
                        .multilineTextAlignment(.center)
                    }
                    else
                    {
                        HStack {
                            TextField("Enter category here", text: $category1)
                                .multilineTextAlignment(.center)
                            TextField("$", text: $value1)
                                .multilineTextAlignment(.center)
                        }
                        .padding()
                    }
                    if (!category2On)
                    {
                        Button("+ Add a category")
                        {
                            category2On = true
                        }
                        .opacity(!category2On ? 1: 0)
                        .buttonStyle(.borderedProminent)
                        .tint(.orange)
                        .padding()
                    }
                    
                    else
                    {
                        TextField("Enter category here", text: $category2)
                            .multilineTextAlignment(.center)
                        TextField("Enter amount of money", text: $value2)
                            .multilineTextAlignment(.center)
                    }
                    if (!category3On)
                    {
                        HStack {
                            Button("+ Add a category")
                            {
                                category3On = true
                            }
                            .opacity(!category3On ? 1: 0)
                            .buttonStyle(.borderedProminent)
                            .tint(.orange)
                            .padding()
                        }
                    }
                    else
                    {
                        TextField("Enter category here", text: $category3)
                            .multilineTextAlignment(.center)
                        TextField("Enter amount of money", text: $value3)
                            .multilineTextAlignment(.center)
                    }
                    
                }
            

               
               
                
               
            }
            
        }
    }
}

#Preview {
    ThirdView()
}
