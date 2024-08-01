//
//  FourthView.swift
//  KWKGroupProject
//
//  Created by Shreenidhi Kunta on 8/1/24.
//

import SwiftUI

struct FourthView: View {
    var body: some View {
        ZStack{
            Color.teal.opacity(0.8)
                .ignoresSafeArea()
            
            VStack {
                HStack{
                    Text("Savings Goals")
                        .font(.title)
                        .foregroundStyle(.white)
                        .bold()
                    
                    Image("money bag")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50, height: 70)
                }
            }

        }
        
    }
}

#Preview {
    FourthView()
}
