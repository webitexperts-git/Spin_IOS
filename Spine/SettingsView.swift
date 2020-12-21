//
//  SettingsView.swift
//  Spine
//
//  Created by apple on 17/12/20.
//

import SwiftUI


struct Weather: Identifiable {
    var id = UUID()
    var city: String
}

struct SettingsView: View {
    
    let modelData: [Weather] = [Weather(city: "Edit Profile"), Weather(city: "Account settings"), Weather(city: "Notifications"), Weather(city: "Language"), Weather(city: "Currency"), Weather(city: "Reminders"), Weather(city: "Dark mode"), Weather(city: "Welcome & Community Guidelines"), Weather(city: "Privacy Policy")]
    
    var body: some View {
        
//        ScrollView(.vertical){
       
        VStack(){
            List(self.modelData) { weather in
                   NavigationLink(destination: Text(weather.city).font(.largeTitle)) {
                           VStack {
                            Text(weather.city).font(.system(size: 14))
                            
                           }
                        }
              
                    }.navigationTitle("Settings")
           
                Rectangle()
                    .frame(width:300, height:80)
                    .overlay(
                        LinearGradient(gradient: Gradient(colors: [Color(red: 183 / 255, green: 152 / 255, blue: 136 / 255), Color(red: 215 / 255, green: 199 / 255, blue: 181 / 255)]), startPoint: .bottom, endPoint: .top).opacity(0.8).edgesIgnoringSafeArea(.all))
            
                Text("LOGOUT").padding()
           
                }
          
            }
        }
  
//}


struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
