//
//  PhoneOTPVerification.swift
//  Spine
//
//  Created by apple on 24/11/20.
//

import SwiftUI

struct PhoneOTPVerification: View {
    @State private var text: String = ""
    @State private var eventStatus = "all"
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color(red: 183 / 255, green: 152 / 255, blue: 136 / 255), Color(red: 215 / 255, green: 199 / 255, blue: 181 / 255)]), startPoint: .bottom, endPoint: .top).edgesIgnoringSafeArea(.all)
            
            VStack{
                Text("srivastava.gaurava@gmail.com").font(.system(size:20)).bold()
                    .foregroundColor(.white)
                    .padding(.bottom, 50)
                Text("Verification code has been sent to your email. Please check junk folder in case code is not received.").foregroundColor(.white)
                    .padding()
                TextField("", text: $text)
                    .foregroundColor(.white)
                    .font(Font.system(size: 25, design: .default))
                    .frame(width: 100, height: 30, alignment: .center)
                           .keyboardType(.numberPad)
                           .textContentType(nil)
                    .multilineTextAlignment(.center)
                Divider()
                    .frame(width: 100,height: 1, alignment: .center)
                 .padding(.horizontal, 30)
                 .background(Color.white)
                    .padding(.bottom, 30)
                Text("Haven’t received a code?")
                    .foregroundColor(.white)
                HStack{
//                    NavigationLink(destination: PhoneVerification().navigationBarBackButtonHidden(true)){
                Text("Get code again ")
                    .foregroundColor(.white)
                    .font(.system(size: 18))
//                    }
                    NavigationLink(destination: PhoneVerification().navigationBarBackButtonHidden(false)){
                    
                    Text("| Get code via SMS")
                        .foregroundColor(.white)
                        .font(.system(size: 18))
                    }
                }.padding()
                
                NavigationLink(destination: EventView(eventStatus: $eventStatus).navigationBarBackButtonHidden(true)){
                    Text("VERIFY")
                        .frame(minWidth: 0, maxWidth: 250, minHeight: 0, maxHeight: 40)
                        .foregroundColor(Color(red: 237 / 255, green: 215 / 255, blue: 183 / 255))
                        .background(Color.white)
                        .cornerRadius(18)
                        .padding(.bottom, 5)
                }
                Spacer()
                
            }.navigationBarHidden(true)
        }

    }
}

struct PhoneOTPVerification_Previews: PreviewProvider {
    static var previews: some View {
        PhoneOTPVerification()
    }
}
