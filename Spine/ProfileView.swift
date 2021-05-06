//
//  ProfileView.swift
//  Spine
//
//  Created by apple on 04/12/20.
//

import SwiftUI

struct ProfileView: View{
    
    var views = ["POST", "EVENT","PODCAST", ""]
    @State var index = 0
    var body: some View{
        NavigationView(){
        ZStack{
           
            VStack(){
               
                HStack(alignment: .top){

                    NavigationLink(destination: PlusButtonView()){
                        Text("+")
                            .font(.system(size: 50))
                           
                    } .padding(.top, -5)
                    .padding(.leading)
                   
                
                    Spacer()
                    ZStack(){
                        Image("back").resizable().frame(width: 80, height: 80, alignment: .center)
                        .cornerRadius(80/2)
                    }
                  
                    Image("email").resizable().frame(width: 25, height: 25, alignment: .trailing)
                        .padding()
                        
                    
                    NavigationLink(destination: SettingsView()){
                        Image("settings").resizable().frame(width: 25, height: 25, alignment: .trailing)
                           
                    } .padding()
                    
                }
                ZStack(){
              Divider()
                }
                .padding(.top,-40)
//                Spacer()
                VStack{
                Text("VIEW PROFILE")
                    ZStack(){
                        Divider()
                    }

                    HStack(spacing: 2){
                        Button(action: {
                             print("sign up bin tapped")
                         }) {
                             Text("POST")
                                .overlay(
                            Rectangle().frame(height: 10)
                                .padding(.vertical, 24).foregroundColor(.gray)
                            )
                                 
                         }
                        Button(action: {
                             print("sign up bin tapped")
                         }) {
                             Text("EVENTS")

                         }

                        Button(action: {
                             print("sign up bin tapped")
                         }) {
                             Text("PODCASTS")

                         }

                        Button(action: {
                             print("sign up bin tapped")
                         }) {
                            Image("bookmark").resizable().frame(width: 25, height: 25)

                         }

                    }
                    Divider()
                    
                    PagingViewNew(index: $index.animation(), maxIndex: views.count - 1) {
                        ForEach(views, id: \.self) { imageName in
                            if imageName == "POST"{
                                Login()
                            }else{
                                Registration()
                            }
                        }
                    }
                    Spacer()
               
                }
          
        }
           
    }.navigationBarHidden(true)
        }
   
    }
}

enum LinePosition {
    case top
    case bottom
}

extension UIView {
    func addLine(position: LinePosition, color: UIColor, width: Double) {
        let lineView = UIView()
        lineView.backgroundColor = color
        lineView.translatesAutoresizingMaskIntoConstraints = false // This is important!
        self.addSubview(lineView)

        let metrics = ["width" : NSNumber(value: width)]
        let views = ["lineView" : lineView]
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[lineView]|", options:NSLayoutConstraint.FormatOptions(rawValue: 0), metrics:metrics, views:views))

        switch position {
        case .top:
            self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[lineView(width)]", options:NSLayoutConstraint.FormatOptions(rawValue: 0), metrics:metrics, views:views))
            break
        case .bottom:
            self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[lineView(width)]|", options:NSLayoutConstraint.FormatOptions(rawValue: 0), metrics:metrics, views:views))
            break
        }
    }
}


struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
