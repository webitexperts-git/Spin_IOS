//
//  EmailVerification.swift
//  Spine
//
//  Created by apple on 20/11/20.
//

import SwiftUI

struct EmailVerification: View {
    @State private var text: String = ""
    @State private var hasTitle = true
    @State private var isPresented = false
//    @State var email:String
//    @State var verificationPin: String
//    @State var userId:String
    
    @ObservedObject var emailVerificationViewModel = EmailVerificationViewModel()
    @ObservedObject var pinRegisterViewModel = RegisterViewModel()
    @State private var entry = ""
    let characterLimit = 4
    
    var verificationPin = ""
    var userId = ""
//    var email = ""
    
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color(red: 183 / 255, green: 152 / 255, blue: 136 / 255), Color(red: 215 / 255, green: 199 / 255, blue: 181 / 255)]), startPoint: .bottom, endPoint: .top).edgesIgnoringSafeArea(.all)
            
            VStack{
//
                Text(verificationPin).font(.system(size:20)).bold()
                    .foregroundColor(.white)
                    .padding(.bottom, 50)
                Text("Verification code has been sent to your email. Please check junk folder in case code is not received.").foregroundColor(.white)
                    .padding()
//                HStack(spacing: 5){
                TextField("", text: $emailVerificationViewModel.email)
                        .foregroundColor(.white)
                    .font(Font.system(size: 30, design: .monospaced))
                        .frame(width: 90, height: 30, alignment: .center)
                        .keyboardType(.numberPad)
                        .textContentType(nil)
                        .disabled(entry.count > (characterLimit - 1))
                        .multilineTextAlignment(.center)
                
                
//                SATextField(tag: 0, placeholder: "Placeholder", changeHandler: { (newText) in
//                            self.text = newText
//                        }) {
//                            // do something when the editing of this textfield ends
//                        }
                
                HStack(){
                    Rectangle()
                        .frame(width: 15, height: 2.0, alignment: .center)
                        .foregroundColor(.white)
                Rectangle()
                    .frame(width: 15, height: 2.0, alignment: .center)
                    .foregroundColor(.white)
                Rectangle()
                    .frame(width: 15, height: 2.0, alignment: .center)
                    .foregroundColor(.white)
                Rectangle()
                    .frame(width: 15, height: 2.0, alignment: .center)
                    .foregroundColor(.white)
                    
                  
                }
               
                
                Text("Haven’t received a code?")
                    .foregroundColor(.white)
                HStack{
//                    NavigationLink(destination: PhoneVerification().navigationBarBackButtonHidden(true)){
                Text("Get code again ")
                    .foregroundColor(.white)
                    .font(.system(size: 18))
//                    }
                    NavigationLink(destination: PhoneVerification()){
                    
                    Text("| Get code via SMS")
                        .foregroundColor(.white)
                        .font(.system(size: 18))
                    }
                }.padding()
                
                
                Button(action: {
                    print(emailVerificationViewModel.email)
                    print(verificationPin)
                    if verificationPin == emailVerificationViewModel.email{
                        print("userid",userId)
                        if(userId != ""){
                        UserDefaults.standard.setValue(userId, forKey: "user_id")
                        self.isPresented.toggle()
                        print("code matched!!!")
//                        callApi()
                        }
                    }else{
                        alertAction(message: "OTP is wrong!")
                    }
                    
                }) {
                    Text("VERIFY")
                        .frame(minWidth: 0, maxWidth: 250, minHeight: 0, maxHeight: 40)
                        .foregroundColor(Color(red: 237 / 255, green: 215 / 255, blue: 183 / 255))
                        .background(Color.white)
                        .cornerRadius(18)
                        .padding(.bottom, 5)
                } .fullScreenCover(isPresented: $isPresented, content: Home.init)
                
                Spacer()
                
            }.onAppear(perform: {
                callApi()
            })
            .navigationBarHidden(true)

        } .frame(maxWidth: .infinity, maxHeight: .infinity)
        
     
       
    }
    func callApi(){
        print("Success ho gaya")
        emailVerificationViewModel.getEmailVerificationData()
        
    }
    
    func alertAction(message:String){

        let alertView = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        var rootViewController = UIApplication.shared.keyWindow?.rootViewController
               let alertAction = UIAlertAction(title: "ok", style: .cancel) { (alert) in
                rootViewController?.dismiss(animated: true, completion: nil)
               }
               alertView.addAction(alertAction)
                rootViewController?.present(alertView, animated: true, completion: nil)
    }
    
    
}


    
//struct EmailVerification_Previews: PreviewProvider {
//    @State var email:String
//    @State var verificationPin: String
//    static var previews: some View {
//        EmailVerification(email: email, verificationPin: verificationPin)
//    }
//}
