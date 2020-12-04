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
    @State var email: String = ""
    @State var password: String = ""
    @State private var hasTitle = true
    @ObservedObject var fbmanager = UserLoginManager()
    @ObservedObject var loginaction = LoginAction()
    @State var isLoginValid: Bool = false
    @State private var shouldShowLoginAlert: Bool = false
    @EnvironmentObject var loginAction: LoginAction
    
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color(red: 183 / 255, green: 152 / 255, blue: 136 / 255), Color(red: 215 / 255, green: 199 / 255, blue: 181 / 255)]), startPoint: .bottom, endPoint: .top).edgesIgnoringSafeArea(.all)
            HStack(){
                
                VStack(spacing:5){
//                  Image("logo1")
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
                    
                    NavigationLink(destination: EmailVerification(),
                                   isActive: self.$isLoginValid) {
                        Text("Login")
                            //                            .onAppear {
                            //                                self.hasTitle = false
                            ////                              self.loginaction.loginFunc(email: email, password: password)
                            //                            }
                            //                            .onDisappear {
                            //                                self.hasTitle = true
                            //                            }
                            .onTapGesture {
                                //determine login validity
                                isLoginValid = self.email == "root" && self.password == "toor"
                                                               
                                //trigger logic
                                if isLoginValid {
                                    self.isLoginValid = true //trigger NavigationLink
                                }
                                else {
                                    self.shouldShowLoginAlert = true //trigger Alert
                                }
                            }
                            
                            .frame(minWidth: 0, maxWidth: 250, minHeight: 0, maxHeight: 40)
                            .foregroundColor(Color(red: 237 / 255, green: 215 / 255, blue: 183 / 255))
                            .background(Color.white)
                            .cornerRadius(18)
                            .padding(.bottom, 10)
                        
                    }.navigationBarTitle(self.hasTitle ? " " : "")
//                          .alert(isPresented: $shouldShowLoginAlert) {
//                            Alert(title: Text("Email/Password incorrect"))
//                          }
                    
                    
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
//                        self.fbmanager.facebookLogin()
                        self.loginaction.loginFunc(email: email, password: password)
                        if !loginaction.isLoginValid{
                            Home()
                            
                        }else{
                            self.shouldShowLoginAlert = true
                            
                        }
                      
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


class LoginAction: ObservableObject{
    @State var email1: String = ""
    @State var password1: String = ""
    @State var isLoginValid: Bool = false
    
    let didChange = PassthroughSubject<LoginAction,Never>()

      // required to conform to protocol 'ObservableObject'
      let willChange = PassthroughSubject<LoginAction,Never>()
    
    
    func loginFunc(email: String, password: String) {
        print(email, password)
        
//        guard let fname = firstName.text, !fname.isEmpty else {
//            self.alert(message: "Please Enter Name!")
//            return
//        }
//        guard let lname = lastName.text, !lname.isEmpty else {
//            self.alert(message: "Please Enter Last name!")
//            return
//        }
//        if email.isEmpty{
//            Alert(title: Text("Important message"), message: Text("Wear sunscreen"), dismissButton: .default(Text("Got it!")))
//
//            return
//        }
//        guard let mobile = mobile.text, !mobile.isEmpty else {
//                self.alert(message: "Please Enter Mobile!")
//                return
//            }
//        guard let address = address.text, !address.isEmpty else {
//                self.alert(message: "Please Enter Address!")
//                return
//        }
//
//        guard let pwd = password.text, !pwd.isEmpty else {
//              self.alert(message: "Please Enter Password!")
//            return
//        }
//        guard let confirmPwd = confirmPassword.text, pwd == confirmPwd else {
//             self.alert(message: "Password mismatched!")
//            return
//        }
//
//        let validEmail = self.isValidEmail(emailStr:email)
//        if(validEmail == false){
//            self.alert(message: "Please Enter Valid Email!")
//            return
//        }
        
    
//        email: [required]
//        Password: [required]
//        notify_device_token: [required]
//        notify_device_type: [required]

        let params: [String:Any]? = ["email":email, "password":password, "notify_device_token": "123456", "notify_device_type": "IOS"]
            print(params!)
        
        ServiceClassMethods.sharedInstance.AlamoRequestNew(method: .post, serviceString: appConstants.kloginUser, parameters: params) { (dict) in

            print(dict)
            print("response",dict)
            let dataResult = dict as! Dictionary<String,Any>
//            let message = dataResult["message"] as! String
            let status = dataResult["status"]! as! Int64
            print("status",status)
            if status == 1{
                
                self.isLoginValid = true
//            self.navigationController?.popViewController(animated: true)
//            self.dismiss(animated: true, completion: nil)
               
                }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.0, execute: {
//                self.alert(message: message)
            })
        }
    }
}

func alert(message:String){
  
//        Alert(title: Text("Important message"), message: Text("Wear sunscreen"), dismissButton: .default(Text("Got it!")))
   }
   
   
    func isValidEmail(emailStr:String) -> Bool {

       let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

       let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
       return emailPred.evaluate(with: emailStr)
   }


struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
