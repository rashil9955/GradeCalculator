//
//  ContentView.swift
//  Grade Calculator
//
//  Created by Rashil Shibakoti on 12/21/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack(alignment: .center, spacing: 0.0) {
                Spacer()
                
                Text("GPA / Grade Calculator")
                    .font(.title)
                    .multilineTextAlignment(.center)
                    .padding()
                
                Spacer()
                
                // Navigation link to next page
                NavigationLink(destination: NextPageView()) {
                    Text("Start")
                        .font(.footnote)
                        .fontWeight(.light)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.trailing)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color(hue: 0.684, saturation: 0.23, brightness: 0.986))
                        .cornerRadius(80)
                        .padding(.horizontal)
                }
            }

        }
    }
}


#Preview {
    ContentView()
}
