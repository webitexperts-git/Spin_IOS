//
//  ForgetPasswordView.swift
//  Spine
//
//  Created by apple on 07/01/21.
//

import SwiftUI


struct ForgetPasswordView: View {
    @ObservedObject var model = ForgetViewModel()
    @Binding var presentedAsModal: Bool
    
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

//        ZStack(alignment: .leading) {
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
        Spacer()
        
        Button(action: {
            if(self.isValidInputs()){
            self.forgetPassword()
            }
                         }) {
                             Text("Send")
                         }  .frame(minWidth: 0, maxWidth: 250, minHeight: 0, maxHeight: 40)
                             .foregroundColor(Color(red: 237 / 255, green: 215 / 255, blue: 183 / 255))
                             .background(Color.white)
                             .cornerRadius(18)
                             .padding(.top, 100)
      
   }.alert(isPresented: $showAlert, content: { self.alert })
          
    }
        .navigationBarTitle("")
      .navigationBarHidden(true)
        
    }
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
        }
//        else if model.password == "" {
//            self.alertMsg = "Password can't be blank."
//            self.showAlert.toggle()
//            return false
//        }
    //    else if !(self.password.isValidPassword) {
    //        self.alertMsg = "Please enter valid password"
    //        self.showAlert.toggle()
    //        return false
    //    }
        
        return true
    }

    
    func forgetPassword(){
        model.getForget()
    }
}

//struct ForgetPasswordView_Previews: PreviewProvider {
//    static var previews: some View {
//        ForgetPasswordView(presentedAsModal: self.$presentingModal)
//    }
//}
