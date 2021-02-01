//
//  ContentView.swift
//  Spine
//
//  Created by apple on 05/11/20.
//

import SwiftUI

struct ContentView: View {
    @State private var hasTitle = true
    var body: some View {
      
        NavigationView{
            ZStack{
                Image("back")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                    .overlay(
                        LinearGradient(gradient: Gradient(colors: [Color(red: 183 / 255, green: 152 / 255, blue: 136 / 255), Color(red: 215 / 255, green: 199 / 255, blue: 181 / 255)]), startPoint: .bottom, endPoint: .top).opacity(0.8).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    )
                
                VStack (spacing:10){
                    Text("SPINE").font(.largeTitle).foregroundColor(Color.white)
                    Text("The Spiritual Network").font(.subheadline).foregroundColor(Color.white).padding(.bottom, 10).padding(.bottom, 100)
                    Text("Connect with people with your intrests.").font(.subheadline).foregroundColor(Color.white)
                    Text("Anytime.Anywhere.").font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.white)
                    
                    NavigationLink(destination: Registration()){
                        Text("REGISTER")
                            .frame(minWidth: 0, maxWidth: 200, minHeight: 0, maxHeight: 40)
                            .foregroundColor(Color(red: 237 / 255, green: 215 / 255, blue: 183 / 255))
                            .background(Color.white)
                            .cornerRadius(18)
                            .shadow(radius: 18)
                            .padding()
                        
                    }.navigationBarTitle(self.hasTitle ? " " : "").foregroundColor(.white)
                    
                    NavigationLink(destination: Login()){
                        Text("Login")
                            .onAppear {
                                self.hasTitle = false
                               
                            }
                            .onDisappear {
                                self.hasTitle = true
                            }
                            .foregroundColor(Color.white)
                        
                    }.navigationBarTitle(self.hasTitle ? " " : "").foregroundColor(.white)
                }
            }
            
        }.accentColor( .white)
    }
    
   
}

struct buttonWithBackground: View {
    
    var btnText: String
    
    var body: some View {
        
        HStack {
//            Spacer()
            Text(btnText)
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .frame(width: 140, height: 50)
                .background(Color.white)
                .clipped()
                .cornerRadius(5.0)
                .shadow(color: .white, radius: 5, x: 0, y: 5)
            
//            Spacer()
        }
    }
}

struct alertView: View {
    
    
    @State var alertMsg = ""
    
    var alert: Alert {
        Alert(title: Text(""), message: Text(alertMsg), dismissButton: .default(Text("OK")))
    }
    
    var body: some View {
        Text("Alert")
    }
    
}





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
