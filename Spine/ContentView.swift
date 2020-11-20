//
//  ContentView.swift
//  Spine
//
//  Created by apple on 05/11/20.
//

import SwiftUI

struct ContentView: View {
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
                        
                    }
                    
                    NavigationLink(destination: Login()){
                        Text("Login")
                            //                        .frame(minWidth: 0, maxWidth: 200, minHeight: 0, maxHeight: 30)
                            .foregroundColor(Color.white)
                        
                    }
                }
            }
        }
    }
}



//struct verificationView:View{
//    var body: some View{
//        Text("Anytime.Anywhere.").font(.subheadline)
//            .fontWeight(.semibold)
//            .foregroundColor(Color.green)
//    }
//}


//struct HomeView:View {
//    var body: some View{
//        Text("Home")
//    }
//}

//struct forgetView:View {
//    var body: some View{
//        Text("forget")
//    }
//}

//struct emailVerificationView:View {
//    var body: some View{
//        Text("email verification")
//    }
//}
//
//struct mobileVerificationView:View {
//    var body: some View{
//        Text("mobile verification")
//    }
//}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
