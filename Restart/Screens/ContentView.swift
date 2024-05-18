//
//  ContentView.swift
//  Restart
//
//  Created by Анастасия Кутняхова on 14.05.2024.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = true
    
    var body: some View {
        ZStack {
            if isOnboardingViewActive {
                OnboardingView()
            } else {
                HomeView()
            }
        } //: ZSTACK
    }
}

#Preview {
    ContentView()
}
