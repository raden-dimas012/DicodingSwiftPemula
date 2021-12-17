//
//  Setttings.swift
//  DicodingSwiftPemula
//
//  Created by Raden Dimas on 21/09/21.
//

import SwiftUI

struct Settings: View {
    
    @Binding var darkModeEnabled: Bool
    @Binding var systemThemeEnabled: Bool
    var body: some View {
        NavigationView{
            Form {
                Section(header: Text("Display"), footer: Text("System Settings will override Dark mode and use the current device theme")) {
                    
                    Toggle(isOn: $darkModeEnabled, label: {
                        Image(systemName: "moon.circle")
                        Text("Dark Mode")
                        
                    }).onChange(of: darkModeEnabled, perform: { _ in
                        SystemThemeManager.shared.handleTheme(darkMode: darkModeEnabled, systemMode: systemThemeEnabled)
                    })
                    
                    Toggle(isOn: $systemThemeEnabled, label: {
                        Image(systemName: "gear")
                        Text("Use System Settings")
                    }).onChange(of: darkModeEnabled, perform: { _ in
                        SystemThemeManager.shared.handleTheme(darkMode: darkModeEnabled, systemMode: systemThemeEnabled)
                    })
                }
            }
            .navigationTitle("Settings")
        }.navigationViewStyle(StackNavigationViewStyle())
        
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings(darkModeEnabled: .constant(false), systemThemeEnabled: .constant(false))
    }
}
