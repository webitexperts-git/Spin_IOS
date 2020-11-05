//
//  ContentView.swift
//  Spine
//
//  Created by apple on 05/11/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{

//               Color.blue.edgesIgnoringSafeArea(.all)
            Color(red: 237 / 255, green: 215 / 255, blue: 183 / 255).edgesIgnoringSafeArea(.all)
            VStack (spacing:10){
                Text("SPINE").font(.largeTitle).foregroundColor(Color.white)
                Text("The Spiritual Network").font(.subheadline).foregroundColor(Color.white).padding(.bottom, 100)
                Text("Connect with people with your intrests.").font(.subheadline).foregroundColor(Color.white)
                Text("Anytime.Anywhere.").font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.white)
                
                
                Button(action: {}) {
                    Text("REGISTER")
                    .frame(minWidth: 0, maxWidth: 200, minHeight: 0, maxHeight: 30)
                }
                .foregroundColor(Color(red: 237 / 255, green: 215 / 255, blue: 183 / 255))
                .background(Color.white)
                .cornerRadius(18)
                .padding()
                Button(action: {}) {
                    Text("Login")
                }
                .foregroundColor(Color.white)
                }


           }
             
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
