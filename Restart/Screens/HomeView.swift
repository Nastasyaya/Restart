//
//  HomeView.swift
//  Restart
//
//  Created by Анастасия Кутняхова on 16.05.2024.
//

import SwiftUI

struct HomeView: View {
    // MARK: PROPERTIES
    
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = false
    
    @State private var isAnimating: Bool = false
    
    // MARK: BODY
    var body: some View {
        VStack(spacing: 20) {
            // MARK: - HEADER
            
            Spacer()
            
            ZStack {
                CircleGroupView(shapeColor: .gray, shapeOpacity: 0.1)
                
                Image("character-2")
                    .resizable()
                    .scaledToFit()
                    .padding()
                    .offset(y: isAnimating ? 30 : -30)
                    .animation(
                        Animation
                            .easeInOut(duration: 4)
                            .repeatForever(),
                        value: isAnimating
                    )
            }
            
            // MARK: - CENTER
            
            Text("The time that leads to mastery is depended of intensity of our focus")
                .font(.title3)
                .foregroundStyle(.secondary)
                .fontWeight(.light)
                .multilineTextAlignment(.center)
                .padding()
            
            // MARK: - FOOTER
            
            Spacer()
            
            Button(action: {
                withAnimation {
                    isOnboardingViewActive = true
                }
            }) {
                Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                    .imageScale(.large)
                
                Text("Restart")
                    .font(.system(.title3, design: .rounded))
                    .fontWeight(.bold)
            } //: BUTTON
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
            .controlSize(.large)
            
        } //: VSTACK
        .onAppear(perform: {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                isAnimating = true
            })
        })
    }
}
// MARK: PREVIEW
#Preview {
    HomeView()
}
