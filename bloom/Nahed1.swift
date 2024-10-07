//
//  Untitled.swift
//  bloom
//
//  Created by Nahed Almutairi on 03/04/1446 AH.
//

import SwiftUI

import SwiftUI

struct Nahed1: View {
    var body: some View {
        NavigationStack {
            VStack {
              Image("onboarding")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 400)
                    .padding(.top, 150)
                
              Text("Discover your style!")
                    .font(.title2)
                    .multilineTextAlignment(.center)
                    .padding(.top, 30)
                
                Spacer()
                
            HStack {
                Spacer()
                    NavigationLink(destination: Renad1Nahed()) {
                        Image(systemName: "arrow.right.circle.fill")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .foregroundColor(.black)
                    }
                
                    .padding(.bottom, 30)
                    .padding(.trailing, 20)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(red: 245/255, green: 245/255, blue: 247/255))
        }
    }
}

#Preview {
    Nahed1()
}

