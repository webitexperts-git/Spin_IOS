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
    @State private var showInfo = false
    @ObservedObject var viewModel: LoginViewModel = LoginViewModel()
//    var login: Login
    @State private var actionState: Int? = 0
    @State var isActive = false
    @State var attemptingLogin = false
    @State var tag:Int? = nil
    
    @EnvironmentObject var settings: UserSettings
    @State var alertMsg = ""
    @State var showAlert = false
    @State var loginSelection: Int? = nil
    @State private var showHome = false
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var alert: Alert {
        Alert(title: Text(""), message: Text(alertMsg), dismissButton: .default(Text("OK")))
    }
    
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
                    .navigationBarBackButtonHidden(true)
                   
                    NavigationLink(destination: EmailVerification()){
                        Text("Login")
                            .underline()
                            .foregroundColor(Color.white)
                            .padding()
                        }
                    
                    
//                    Button(action: {
//                        if  self.isValidInputs() {
//                            // For use with property wrapper
////                            UserDefaults.standard.set(true, forKey: "Loggedin")
////                            UserDefaults.standard.synchronize()
//
//                            self.loginaction.loginFunc(email: email, password: password)
//
//
////                            if loginaction.fieldBeingEdited == 1{
////                                self.showHome = true
////                            }
////                            self.showHome = true
////                            self.settings.loggedIn = true
//                            // ==========
//
//                            // For use with property wrapper
//                            // self.dataStore.loggedIn = true
//                            // ==========
//                        }
//
//                    }) {
//                        buttonWithBackground(btnText: "LOGIN")
//                    }.sheet(isPresented: self.$showHome) {
//                        EmailVerification()
//                    }
                            
                            .frame(minWidth: 0, maxWidth: 250, minHeight: 0, maxHeight: 40)
                            .foregroundColor(Color(red: 237 / 255, green: 215 / 255, blue: 183 / 255))
                            .background(Color.white)
                            .cornerRadius(18)
                            .padding(.bottom, 10)
                        
//                    }.navigationBarTitle(self.hasTitle ? " " : "")
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
//}

fileprivate func isValidInputs() -> Bool {
    
    if self.email == "" {
        self.alertMsg = "Email can't be blank."
        self.showAlert.toggle()
        return false
    } else if !self.email.isValidEmail {
        self.alertMsg = "Email is not valid."
        self.showAlert.toggle()
        return false
    }else if self.password == "" {
        self.alertMsg = "Password can't be blank."
        self.showAlert.toggle()
        return false
    }
//    else if !(self.password.isValidPassword) {
//        self.alertMsg = "Please enter valid password"
//        self.showAlert.toggle()
//        return false
//    }
    
    return true
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
    @State var email1 : String?
    @State var password1: String = ""
    @State var email: String = ""
    @State var status: Int64 = 0
    @Published var fieldBeingEdited: Int = 0
    
    let didChange = PassthroughSubject<LoginAction,Never>()

      // required to conform to protocol 'ObservableObject'
      let willChange = PassthroughSubject<LoginAction,Never>()
    
    
    func loginFunc(email: String, password: String) {
        print(email, password)
        
//        guard let fname = email1, !fname.isEmpty else {
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
            self.status = dataResult["status"]! as! Int64
            print("status",self.status)
            if self.status == 1{
                UserDefaults.standard.set(true, forKey: "Loggedin")
                UserDefaults.standard.synchronize()
                let data = dataResult as! Dictionary<String, Any>
                self.email = data["email"] as! String
//            self.navigationController?.popViewController(animated: true)
//            self.dismiss(animated: true, completion: nil)
               
                }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.0, execute: {
//                self.alert(message: message)
            })
        }
    }
    
//    2760846318
//    func alert(message:String){
//
//        let alert = UIAlertController(title: "Your title", message: "Your message", preferredStyle: .alert)
//
//             let ok = UIAlertAction(title: "OK", style: .default, handler: { action in
//             })
//             alert.addAction(ok)
//             let cancel = UIAlertAction(title: "Cancel", style: .default, handler: { action in
//             })
//             alert.addAction(cancel)
//             DispatchQueue.main.async(execute: {
//                self.present(alert, animated: true)
//        })
//       }
       
   
        func isValidEmail(emailStr:String) -> Bool {

           let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

           let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
           return emailPred.evaluate(with: emailStr)
       }
}





//struct TodoView : View {
//    var login: LoginModel
//
//    var body: some View {
//        Text(login.title)
//    }
//}
//
//struct TodoCell : View {
//    var login: LoginModel
//    var body: some View {
//        HStack {
//            if login.completed {
//                Image(systemName: "checkmark.square")
//            } else {
//                Image(systemName: "square")
//            }
//            Text(login.title)
//        }
//    }
//}



struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
