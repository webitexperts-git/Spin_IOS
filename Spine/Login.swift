//
//  Login.swift
//  Spine
//
//  Created by apple on 20/11/20.
//

import SwiftUI
import FBSDKLoginKit
import Combine

struct Login: View {
    
    var headerView: some View {
        VStack() {
//          Image("logo1")
            Text("S P I N E").font(.largeTitle).foregroundColor(Color.white)
            Text("Login").font(.subheadline).foregroundColor(Color.white).padding(.bottom, 30)
        }
    }
    @State private var isPresented = false
    @State var presentingModal = false
    @State var email: String = ""
    @State var password: String = ""
    @State private var hasTitle = true
    @ObservedObject var fbmanager = UserLoginManager()
    @ObservedObject var model = LoginViewModel()
    @State var isActive = false
    @State var alertMsg = ""
    @State var showAlert = false
  
    var alert: Alert {
        Alert(title: Text(""), message: Text(alertMsg), dismissButton: .default(Text("OK")))
    }
    
    
    var body: some View {
        NavigationView {
            LoadingView(isShowing: .constant(model.isLoading)) {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color(red: 183 / 255, green: 152 / 255, blue: 136 / 255), Color(red: 215 / 255, green: 199 / 255, blue: 181 / 255)]), startPoint: .bottom, endPoint: .top).edgesIgnoringSafeArea(.all)
            HStack(){
                
                VStack(spacing:5){
                    self.headerView
                    
                    ZStack(alignment: .leading) {
                        if model.email.isEmpty{
                            Text("email").foregroundColor(.white)
                                .padding(.bottom, 10)
                                .padding(.leading, 10)
                        }

                        TextField("", text: $model.email)
                            .foregroundColor(Color.white)
                            .padding(10)
                            .frame(width:250.0, height: 40.0)
                            .font(Font.system(size: 15, weight: .medium, design: .serif))
                            .overlay(RoundedRectangle(cornerRadius: 18).stroke(Color.white, lineWidth: 2))
                            .padding(.bottom,10)
                    }

                    ZStack(alignment: .leading) {
                        if model.password.isEmpty{
                            Text("password").foregroundColor(.white)
                                .padding(.bottom, 10)
                                .padding(.leading, 10)
                        }

                        SecureField("", text: $model.password)
                            .foregroundColor(Color.white)
                            .padding(10)
                            .frame(width:250.0, height: 40.0)
                            .font(Font.system(size: 15, weight: .medium, design: .serif))
                            .overlay(RoundedRectangle(cornerRadius: 18).stroke(Color.white, lineWidth: 2))
                            .padding(.bottom,10)
                    }
                       
                    NavigationLink(destination: Home(), isActive: .constant($model.woofUrl.wrappedValue != false)) {
                        VStack {
                            HStack {
                                Text("Login") .frame(minWidth: 0, maxWidth: 250, minHeight: 0, maxHeight: 40)
                                    .foregroundColor(Color(red: 237 / 255, green: 215 / 255, blue: 183 / 255))
                                    .background(Color.white)
                                    .cornerRadius(18)
                                    .padding(.bottom, 10)
                            }
                        }
                        
                    }.simultaneousGesture(TapGesture().onEnded{
                        if(self.isValidInputs()){
                        self.loginUser()
                        }
                        
                       
                    })
                    
                    
                    Button("Forget Password?") { self.presentingModal = true }
                           .sheet(isPresented: $presentingModal) { ForgetPasswordView(presentedAsModal: self.$presentingModal)
                            
                    }
                        
                    
                    Text("_________Or_________")
                        .foregroundColor(.white)
                        .padding(.bottom, 40)
                    
                    
                    Button(action: {
                        self.fbmanager.facebookLogin()
//                        self.loginaction.loginFunc(email: email, password: password)
                       
                      
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
        } .alert(isPresented: $showAlert, content: { self.alert })
    }
}
        .navigationBarHidden(true)
}

fileprivate func isValidInputs() -> Bool {
    
    if model.email == "" {
        self.alertMsg = "Email can't be blank."
        self.showAlert.toggle()
        return false
    } else if !model.email.isValidEmail {
        self.alertMsg = "Email is not valid."
        self.showAlert.toggle()
        return false
    }else if model.password == "" {
        self.alertMsg = "Password can't be blank."
        self.showAlert.toggle()
        return false
    }
    
    return true
}
    
    private func loginUser() {
        model.getLogin()
       
    }
    
    private func socialLogin(){
        
    }

}


class UserLoginManager: ObservableObject {
    @ObservedObject var model = LoginViewModel()
        let loginManager = LoginManager()
    
    

        func facebookLogin() {
            
//            loginManager.logIn(permissions: [.publicProfile, .email], viewController: nil) { loginResult in
//                switch loginResult {
//                case .failed(let error):
//                    print(error)
//                case .cancelled:
//                    print("User cancelled login.")
//                case .success(let grantedPermissions, let declinedPermissions, let accessToken):
//                    print("Logged in! \(grantedPermissions) \(declinedPermissions) \(accessToken)")
//                    GraphRequest(graphPath: "me", parameters: ["fields": "id, name, first_name, email"]).start(completionHandler: { [self] (connection, result, error) -> Void in
//                        if (error == nil){
//                            let fbDetails = result as! NSDictionary
//                            print(fbDetails)
//                            let socialEmail = fbDetails["email"]
//                            let socialName = fbDetails["name"]
//                            let fbId = fbDetails["id"]
//                            model.getSocialLogin()
//
//                        }
//                    })
//                }
//            }
        }
    }



struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
