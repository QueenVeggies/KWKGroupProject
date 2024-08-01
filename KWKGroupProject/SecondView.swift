//
//  SecondView.swift
//  KWKGroupProject
//
//  Created by Shreenidhi Kunta on 7/30/24.
//



import SwiftUI

struct SecondView: View {

    @Binding var firstName: String
    
    var body: some View {
        NavigationStack {
            ZStack{
                Color.teal.opacity(0.8)
                    .ignoresSafeArea()
                VStack(spacing: 70.0){
                
                    VStack(spacing: 20.0) {
                        //Displays firstName from screen 1 as [user]
                        Text("Hello, \(String(firstName))")
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            .bold()
                            .foregroundStyle(.white)
                        
                        Text("Your Current Balance is: ")
                            .foregroundStyle(.white)
                            .font(.system(size: 20))
                        
                        Text("$200.00")
                            .foregroundStyle(.white)
                            .font(.system(size: 30))
                            .bold()
                            .opacity(1.0)
                        
                        Text("Your weekly budget:")
                            .foregroundStyle(.white)
                            .font(.system(size: 20))
                        
                        Text("$25.00")
                            .foregroundStyle(.white)
                            .font(.system(size: 30))
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            .bold()
                            .opacity(1.0)
                        
                    }
                    
                    VStack (spacing: 40) {
                        NavigationLink(destination: ThirdView())
                        {
                            Capsule()
                                .fill(.white)
                                .frame(width: 250, height: 70)
                                .shadow(color : .gray, radius : 4)
                                .overlay(Text("Budgeting Map")
                                    .font(.system(size: 20))
                                    .bold()
                                    .foregroundStyle(.orange)
                                )
                            
                        }
                        
                        NavigationLink(destination: FourthView())
                        {
                            Capsule()
                                .fill(.white)
                                .frame(width: 250, height: 70)
                                .shadow(color : .gray, radius : 4)
                                .overlay(Text("Savings Goals")
                                    .font(.system(size: 20))
                                    .bold()
                                    .foregroundStyle(.orange)
                                )
                            
                        }
                    }
                }
                .padding()
            }
        }
    }
}

#Preview {
    ContentView()
}
