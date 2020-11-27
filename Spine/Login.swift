//
//  Login.swift
//  Spine
//
//  Created by apple on 20/11/20.
//

import SwiftUI
import FBSDKLoginKit

struct Login: View {
    @State var email: String = ""
    @State var password: String = ""
    @State private var hasTitle = true
    @ObservedObject var fbmanager = UserLoginManager()
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color(red: 183 / 255, green: 152 / 255, blue: 136 / 255), Color(red: 215 / 255, green: 199 / 255, blue: 181 / 255)]), startPoint: .bottom, endPoint: .top).edgesIgnoringSafeArea(.all)
            HStack(){
                
                VStack(spacing:5){
                    //                    Image("logo1")
                    Text("S P I N E").font(.largeTitle).foregroundColor(Color.white)
                    Text("Login").font(.subheadline).foregroundColor(Color.white).padding(.bottom, 30)
                    
                    ZStack(alignment: .leading) {
                        if email.isEmpty{
                            Text("email").foregroundColor(.white)
                                .padding(.bottom, 10)
                                .padding(.leading, 10)
                        }
                        
                        TextField("", text: $email)
                            .foregroundColor(Color.white)
                            .padding(10)
                            .frame(width:250.0, height: 40.0)
                            .font(Font.system(size: 15, weight: .medium, design: .serif))
                            .overlay(RoundedRectangle(cornerRadius: 18).stroke(Color.white, lineWidth: 2))
                            .padding(.bottom,10)
                    }
                    
                    ZStack(alignment: .leading) {
                        if password.isEmpty{
                            Text("password").foregroundColor(.white)
                                .padding(.bottom, 10)
                                .padding(.leading, 10)
                        }
                        
                        SecureField("", text: $password)
                            .foregroundColor(Color.white)
                            .padding(10)
                            .frame(width:250.0, height: 40.0)
                            .font(Font.system(size: 15, weight: .medium, design: .serif))
                            .overlay(RoundedRectangle(cornerRadius: 18).stroke(Color.white, lineWidth: 2))
                            .padding(.bottom,10)
                    }
//                    .navigationBarBackButtonHidden(true)
                    NavigationLink(destination: EmailVerification()){
                        Text("Login")
                            .onAppear {
                                self.hasTitle = false
                            }
                            .onDisappear {
                                self.hasTitle = true
                            }
                            .frame(minWidth: 0, maxWidth: 250, minHeight: 0, maxHeight: 40)
                            .foregroundColor(Color(red: 237 / 255, green: 215 / 255, blue: 183 / 255))
                            .background(Color.white)
                            .cornerRadius(18)
                            .padding(.bottom, 10)
                       
                    }.navigationBarTitle(self.hasTitle ? " " : "")
                    
                    NavigationLink(destination: ForgetPassword()){
                        Text("Forget Password?")
                            .underline()
                            .foregroundColor(Color.white)
                            .padding()
                        }
                    Text("_________Or_________")
                        .foregroundColor(.white)
                        .padding(.bottom, 40)
                    
                    Button(action: {
                        self.fbmanager.facebookLogin()
                    }) {
                        Text("CONTINUE WITH FACEBOOK")
                            
                            .frame(width: 250, height: 40)
                            
                            .foregroundColor(.white)
                            .background(LinearGradient(gradient: Gradient(colors: [Color(red: 48/255, green: 61/255, blue: 153/255), Color(red: 52/255, green: 119/255, blue: 185/255)]), startPoint: .leading, endPoint: .trailing))
                           
                            
                            .cornerRadius(10)
                    }.padding(.bottom, 10)
                    
                    Spacer()
                }
            }
        }
        

    }
}

class UserLoginManager: ObservableObject {
    let loginManager = LoginManager()
    func facebookLogin() {
        loginManager.logIn(permissions: ["publicProfile", "email"], from: nil) { (loginResult, err) in
//            switch loginResult {
//
//            case .failed:
//                print(err)
//            case .cancelled:
//                print("User cancelled login.")
//            case .success(let grantedPermissions, let declinedPermissions, let accessToken):
//                print("Logged in! \(grantedPermissions) \(declinedPermissions) \(accessToken)")
                GraphRequest(graphPath: "me", parameters: ["fields": "id, name, first_name"]).start(completionHandler: { (connection, result, error) -> Void in
                    if (error == nil){
                        let fbDetails = result as! NSDictionary
                        print(fbDetails)
                    }
                })
            }
        }
    }
//}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
