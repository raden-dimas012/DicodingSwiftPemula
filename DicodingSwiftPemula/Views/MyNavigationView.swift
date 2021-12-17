//
//  NavigationView.swift
//  DicodingSwiftPemula
//
//  Created by Raden Dimas on 21/09/21.
//

import SwiftUI
import Lottie

struct MyNavigationView: View {
    
    
    @AppStorage("darkModeEnabled") private var darkModeEnabled = false
    @AppStorage("systemThemeEnabled") private var systemThemeEnabled = false
    
    var body: some View {
        TabView {
            PokedexView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            Settings(darkModeEnabled: $darkModeEnabled, systemThemeEnabled: $systemThemeEnabled)
                .tabItem {
                    Image(systemName: "gearshape")
                    Text("Settings")
                }
            
            Profile()
                .tabItem {
                    Image(systemName: "person.circle")
                    Text("Profile")
                }
        }
        .onAppear{
            SystemThemeManager.shared.handleTheme(darkMode: darkModeEnabled, systemMode: systemThemeEnabled)
        }
    }
}

struct MyNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        MyNavigationView()
    }
}
