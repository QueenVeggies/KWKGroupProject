//
//  ContentView.swift
//  KWKGroupProject
//
//  Created by Shreenidhi Kunta on 7/26/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var firstName: String = ""
    @State private var lastName = ""
    @State private var password = ""
    var body: some View {
        NavigationStack {
            ZStack{
                Color.teal.opacity(0.8)
                    .ignoresSafeArea()
                
                VStack (spacing: 22.0){

                    Text("Create new account")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .foregroundStyle(.white)
                        .bold()
                    
                    Text(" First Name:")
                        .foregroundStyle(.white)
                    
                    TextField("", text: $firstName)
                        .multilineTextAlignment(.center)
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .background(Color.white.opacity(0.4))
                        .cornerRadius(10.0)
                        .foregroundStyle(.white)
                        .shadow(color : .gray, radius : 4)
                    
                    
                    
                    Text(" Last Name:")
                        .foregroundStyle(.white)
                    

                    TextField("", text: $lastName)
                        .multilineTextAlignment(.center)
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .background(Color.white.opacity(0.4))
                        .cornerRadius(10.0)
                        .foregroundStyle(.white)
                        .shadow(color : .gray, radius : 4)
                    
                    Text(" Email:")
                        .foregroundStyle(.white)
                    
                    TextField("", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                        .multilineTextAlignment(.center)
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .background(Color.white.opacity(0.4))
                        .cornerRadius(10.0)
                        .foregroundStyle(.white)
                        .shadow(color : .gray, radius : 4)
                        .autocorrectionDisabled()
                        .textInputAutocapitalization(.never)
                    
                    Text(" Password:")
                        .foregroundStyle(.white)
                    
                    SecureField("", text: $password)
                        .multilineTextAlignment(.center)
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .background(Color.white.opacity(0.4))
                        .cornerRadius(10.0)
                        .foregroundStyle(.white)
                        .shadow(color : .gray, radius : 4)
                        .textInputAutocapitalization(.never)
                    
                    
                    
                    NavigationLink(destination: SecondView(firstName: self.$firstName))
                    {
                        Capsule()
                        .fill(Color.orange)
                        .frame(width: 200, height: 50)
                        .shadow(color : .gray, radius : 4)
                        .overlay(Text("Sign Up")
                            .bold()
                            .foregroundStyle(.white)
                        )
                                 
                    }
                    .navigationTitle("Home")
                    .navigationBarHidden(true)

                    
                    
                }
                .padding()
            }
        }
        
    }
}

#Preview {
    ContentView()
}
