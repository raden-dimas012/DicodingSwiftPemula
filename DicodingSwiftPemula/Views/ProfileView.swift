//
//  Profile.swift
//  DicodingSwiftPemula
//
//  Created by Raden Dimas on 21/09/21.
//

import SwiftUI

struct Profile: View {
    
    let myData = myProfile
    
    var body: some View {
        
        NavigationView{
            VStack {
                Image(myData.image)
                    .resizable()
                    .frame(width: 170, height: 170)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 4))
                    .shadow(radius: 5)
                    .padding()
                
                Form{
                    Section(header: Text("Name")) {
                        HStack{
                            Image(systemName: "person.circle")
                            Text(myData.name)
                        }
                    }
                    Section(header: Text("Birth")) {
                        HStack {
                            Image(systemName: "calendar.circle")
                            Text(myData.birth)
                        }
                        
                    }
                    Section(header: Text("Email")) {
                        HStack {
                            Image(systemName: "envelope.circle")
                            Text(myData.email)
                        }
                        
                    }
                    Section(header: Text("Role")) {
                        HStack{
                            Image(systemName: "bag.fill")
                            Text(myData.role)
                        }
                        
                    }
                    Section{
                        Link(destination: URL(string: "https://github.com/raden-dimas012")!, label: {
                            Label("Follow me on Github",systemImage: "link")
                        })
                        
                    }
                    .foregroundColor(.blue)
                    .font(.system(size: 16,weight: .semibold))
                }
            }
            .navigationTitle("Profile")
        }.navigationViewStyle(StackNavigationViewStyle())
        
    }
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        Profile()
    }
}





