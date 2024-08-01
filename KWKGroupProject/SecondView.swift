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
                VStack(spacing: 20.0){
                    
                    //Needs to display firstName from screen 1 as [user]
                    Text("Hello, \(String(firstName))")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .bold()
                        .foregroundStyle(.white)
                    
                    Text("Your Current Balance is: ")
                        .foregroundStyle(.white)
                    
                    Text("$200.00")
                        .foregroundStyle(.white)
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .bold()
                        .opacity(1.0)
                    
                    Text("Your weekly budget:")
                        .foregroundStyle(.white)
                    
                    Text("$25.00")
                        .foregroundStyle(.white)
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .bold()
                        .opacity(1.0)
                    
                    
                    NavigationLink(destination: ThirdView())
                    {
                        Capsule()
                            .fill(.white)
                            .frame(width: 200, height: 50)
                            .shadow(color : .gray, radius : 4)
                            .overlay(Text("Budgeting Map")
                                .bold()
                                .foregroundStyle(.orange)
                            )
                                     
                    }
                    
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
