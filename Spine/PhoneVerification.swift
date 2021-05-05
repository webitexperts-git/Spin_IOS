//
//  PhoneVerification.swift
//  Spine
//
//  Created by apple on 20/11/20.
//

import SwiftUI

struct PhoneVerification: View {
    @State var mobile: String = ""
    var body: some View {
        ZStack{
            
            LinearGradient(gradient: Gradient(colors: [Color(red: 183 / 255, green: 152 / 255, blue: 136 / 255), Color(red: 215 / 255, green: 199 / 255, blue: 181 / 255)]), startPoint: .bottom, endPoint: .top).edgesIgnoringSafeArea(.all)
         
            VStack{
                
                Text("Enter your phone number")
                    .foregroundColor(.white)
//                Spacer()
                ZStack(alignment: .leading) {
                if mobile.isEmpty{
                    Text("GB +44 | Phone number").foregroundColor(.white)
                        .padding(10)
                }
                    TextField("", text: $mobile)
                    .foregroundColor(Color.white)
                  .padding(10)
                    .frame(width:250.0, height: 40.0)
                  .font(Font.system(size: 15, weight: .medium, design: .serif))
                    .overlay(RoundedRectangle(cornerRadius: 18).stroke(Color.white, lineWidth: 2))
                    .padding(.bottom,5)
                }
                NavigationLink(destination: PhoneOTPVerification()){
                    Text("NEXT")
                        .frame(minWidth: 0, maxWidth: 250, minHeight: 0, maxHeight: 40)
                        .foregroundColor(Color(red: 237 / 255, green: 215 / 255, blue: 183 / 255))
                        .background(Color.white)
                        .cornerRadius(18)
                        .shadow(radius: 18)
                        .padding()
                    
                }
               Spacer()
            }
          

            }
       
        }
        
}

struct PhoneVerification_Previews: PreviewProvider {
    static var previews: some View {
        PhoneVerification()
    }
}
