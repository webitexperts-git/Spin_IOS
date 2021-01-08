//
//  Registration.swift
//  Spine
//
//  Created by apple on 20/11/20.
//

import SwiftUI

struct Registration: View {
    @State var firstname: String = ""
    @State var lastname: String = ""
    @State var email: String = ""
    @State var town: String = ""
    @State var alertMsg = ""
    @State var showAlert = false
    @State var password: String = ""
    
//    @ObservedObject var registerViewModel: RegisterViewModel = RegisterViewModel()
    var alert: Alert {
        Alert(title: Text(""), message: Text(alertMsg), dismissButton: .default(Text("OK")))
    }
    var body: some View {
//        ScrollView{
        ZStack{
            
            LinearGradient(gradient: Gradient(colors: [Color(red: 183 / 255, green: 152 / 255, blue: 136 / 255), Color(red: 215 / 255, green: 199 / 255, blue: 181 / 255)]), startPoint: .bottom, endPoint: .top).edgesIgnoringSafeArea(.all)
                
            HStack(){
            
                VStack(){
////                    Image("logo1")
            Text("S P I N E").font(.largeTitle).foregroundColor(Color.white)
            Text("Register").font(.subheadline).foregroundColor(Color.white).padding(.bottom, 10)

                    ZStack(alignment: .leading) {
                    if firstname.isEmpty{
                        Text("Username").foregroundColor(.white)
                            .padding(10)
                    }
            TextField("", text: $firstname)
                .foregroundColor(Color.white)
              .padding(10)
                .frame(width:250.0, height: 40.0)
              .font(Font.system(size: 15, weight: .medium, design: .serif))
                .overlay(RoundedRectangle(cornerRadius: 18).stroke(Color.white, lineWidth: 2))
                .padding(.bottom,5)
                    }
                    
                    
            ZStack(alignment: .leading) {
                if email.isEmpty{
                    Text("Email").foregroundColor(.white)
                    .padding(10)
                    }
            TextField("", text: $email)
                .foregroundColor(Color.white)
              .padding(10)
                .frame(width:250.0, height: 40.0)
              .font(Font.system(size: 15, weight: .medium, design: .serif))
                .overlay(RoundedRectangle(cornerRadius: 18).stroke(Color.white, lineWidth: 2))
                .padding(.bottom,5)
            }
            
                ZStack(alignment: .leading) {
                if password.isEmpty{
                    Text("Password").foregroundColor(.white)
                    .padding(10)
                }
                    TextField("", text: $password)
                        .foregroundColor(Color.white)
                        .padding(10)
                        .frame(width:250.0, height: 40.0)
                        .font(Font.system(size: 15, weight: .medium, design: .serif))
                        .overlay(RoundedRectangle(cornerRadius: 18).stroke(Color.white, lineWidth: 2))
                        .padding(.bottom,5)
                }
                    
                    ZStack(alignment: .leading) {
                    if town.isEmpty{
                        Text("Town").foregroundColor(.white)
                            .padding(10)
                    }
                    
                    TextField("", text: $town)
                        .foregroundColor(Color.white)
                        .padding(10)
                        .frame(width:250.0, height: 40.0)
                        .font(Font.system(size: 15, weight: .medium, design: .serif))
                        .overlay(RoundedRectangle(cornerRadius: 18).stroke(Color.white, lineWidth: 2))
                        .padding(.bottom,5)
                    }
                    
                    Button(action: {
                        if self.isValidInputs(){
//                            self.registerViewModel.load()
                            print("what is your name?")
                        }

                    }) {
                        Text("CONTINUE")

                            .frame(width: 250, height: 40)

                            .foregroundColor(Color(red: 237 / 255, green: 215 / 255, blue: 183 / 255))
                            .background(Color.white)
                            .cornerRadius(18)
                    }.padding(.bottom, 10)
                    
//                    Button(action: {
//                        self.registerViewModel.load()
//                    }, label: {
//                        Image(systemName: "arrow.2.circlepath")
//                    })
//                    NavigationLink(destination: Home()){
//                        Text("CONTINUE")
//                            .frame(minWidth: 0, maxWidth: 250, minHeight: 0, maxHeight: 40)
//                            .foregroundColor(Color(red: 237 / 255, green: 215 / 255, blue: 183 / 255))
//                            .background(Color.white)
//                            .cornerRadius(18)
//                            .padding(.bottom, 5)
//
//                    }
                    
                    
                    Text("I have read and agree to the Terms of Service and Privacy Policy")
                        .font(.subheadline)
                        .multilineTextAlignment(.center)
//                        .frame(width:300.0, height: 40.0)
                        .foregroundColor(Color.white)
                        .padding(.horizontal, 55.0)
                    Text("_______Or_______")
                        .foregroundColor(Color.white)
                        .padding(.bottom, 10)
                 
                    Button(action: {
                        
                    }) {
                        Text("CONTINUE WITH FACEBOOK")
                            
                            .frame(width: 250, height: 40)
                            
                            .foregroundColor(.white)
                            .background(LinearGradient(gradient: Gradient(colors: [Color(red: 48/255, green: 61/255, blue: 153/255), Color(red: 52/255, green: 119/255, blue: 185/255)]), startPoint: .leading, endPoint: .trailing))
                            .cornerRadius(10)
                    }.padding(.bottom, 10)
                    
                }
                Spacer()
                }.alert(isPresented: $showAlert, content: { self.alert })
            }  .accentColor( .black)
        }
    
    
    fileprivate func isValidInputs() -> Bool {
        
        if self.firstname == "" {
            self.alertMsg = "Username can't be blank."
            self.showAlert.toggle()
            return false
        }
            else if !self.email.isValidEmail {
            self.alertMsg = "Email is not valid."
            self.showAlert.toggle()
            return false
        }
        else if self.password == "" {
            self.alertMsg = "Password can't be blank."
            self.showAlert.toggle()
            return false
        } else if self.town == "" {
            self.alertMsg = "town can't be blank."
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
    
    func isValidEmail(emailStr:String) -> Bool {

       let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

       let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
       return emailPred.evaluate(with: emailStr)
   }

    }

//}






struct Registration_Previews: PreviewProvider {
    static var previews: some View {
        Registration()
    }
}
