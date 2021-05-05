//
//  Registration.swift
//  Spine
//
//  Created by apple on 20/11/20.
//

import SwiftUI
import Combine

struct Registration: View {

    @State var alertMsg = ""
    @State var showAlert = false

  
    @ObservedObject var model = RegisterViewModel()

    var alert: Alert {
        Alert(title: Text(""), message: Text(alertMsg), dismissButton: .default(Text("OK")))
    }
    var body: some View {
        NavigationView {
            LoadingView(isShowing: .constant(model.isLoading)) {
                ZStack(alignment: .top){
            
            LinearGradient(gradient: Gradient(colors: [Color(red: 183 / 255, green: 152 / 255, blue: 136 / 255), Color(red: 215 / 255, green: 199 / 255, blue: 181 / 255)]), startPoint: .bottom, endPoint: .top).edgesIgnoringSafeArea(.all)
                
            HStack(){
               
                VStack(){
//                    Image("logo1").frame(width: 30, height: 30, alignment: .top).padding()
                    Text("S P I N E").font(.largeTitle).foregroundColor(Color.white)
                    Text("Register").font(.subheadline).foregroundColor(Color.white).padding(.bottom, 10)
                   

                    ZStack(alignment: .leading) {
                        if model.name.isEmpty{
                        Text("Username").foregroundColor(.white)
                            .padding(10)
                            Spacer()
                    }
                        TextField("", text: $model.name)
                .foregroundColor(Color.white)
              .padding(10)
                .frame(width:250.0, height: 40.0)
              .font(Font.system(size: 15, weight: .medium, design: .serif))
                .overlay(RoundedRectangle(cornerRadius: 18).stroke(Color.white, lineWidth: 2))
                .padding(.bottom,5)
                    }
                   
                    
            ZStack(alignment: .leading) {
                if model.email.isEmpty{
                    Text("Email").foregroundColor(.white)
                    .padding(10)
                    }
                TextField("", text: $model.email)
                .foregroundColor(Color.white)
              .padding(10)
                .frame(width:250.0, height: 40.0)
              .font(Font.system(size: 15, weight: .medium, design: .serif))
                .overlay(RoundedRectangle(cornerRadius: 18).stroke(Color.white, lineWidth: 2))
                .padding(.bottom,5)
            }
            
                ZStack(alignment: .leading) {
                    if model.password.isEmpty{
                    Text("Password").foregroundColor(.white)
                    .padding(10)
                }
                    TextField("", text: $model.password)
                        .foregroundColor(Color.white)
                        .padding(10)
                        .frame(width:250.0, height: 40.0)
                        .font(Font.system(size: 15, weight: .medium, design: .serif))
                        .overlay(RoundedRectangle(cornerRadius: 18).stroke(Color.white, lineWidth: 2))
                        .padding(.bottom,5)
                }
                    
                    ZStack(alignment: .leading) {
                        if model.town.isEmpty{
                        Text("Town").foregroundColor(.white)
                            .padding(10)
                    }
                    
                        TextField("", text: $model.town)
                        .foregroundColor(Color.white)
                        .padding(10)
                        .frame(width:250.0, height: 40.0)
                        .font(Font.system(size: 15, weight: .medium, design: .serif))
                        .overlay(RoundedRectangle(cornerRadius: 18).stroke(Color.white, lineWidth: 2))
                        .padding(.bottom,5)
                    }
                    
                    NavigationLink(destination: EmailVerification(verificationPin: model.verificationPin, userId: model.userId), isActive: .constant($model.woofUrl.wrappedValue != false)) {
                    VStack {
                        HStack {
                            Text("CONTINUE") .frame(minWidth: 0, maxWidth: 250, minHeight: 0, maxHeight: 40)
                                .foregroundColor(Color(red: 237 / 255, green: 215 / 255, blue: 183 / 255))
                                .background(Color.white)
                                .cornerRadius(18)
                                .padding(.bottom, 10)
                        }
                    }
                    
                }.simultaneousGesture(TapGesture().onEnded{
                    
                    if(self.isValidInputs()){
                    self.getRagistration()
                    }
                })
                
                    
                    
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
                       
                    }
                    .padding(.bottom, 70)
                   
                }
             
            
                }
         
            }  .accentColor( .black)
               
               
        }.alert(isPresented: $showAlert, content: { self.alert })
           
           
        }
//        .navigationBarTitle("gdgfd")
//        .navigationBarHidden(true)
//        .navigationBarBackButtonHidden(false)
       
    }
    
    fileprivate func isValidInputs() -> Bool {
        
        if model.name == "" {
            self.alertMsg = "Username can't be blank."
            self.showAlert.toggle()
            return false
        }
        else if model.email == "" {
            self.alertMsg = "Email can't be blank."
            self.showAlert.toggle()
            return false
        }
            else if !model.email.isValidEmail {
            self.alertMsg = "Email is not valid."
            self.showAlert.toggle()
            return false
        }
        else if model.password == "" {
            self.alertMsg = "Password can't be blank."
            self.showAlert.toggle()
            return false
        } else if model.town == "" {
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
        
        
        private func getRagistration() {
            model.getRagistration()
            
        }

    }

//}






struct Registration_Previews: PreviewProvider {
    static var previews: some View {
        Registration()
    }
}
