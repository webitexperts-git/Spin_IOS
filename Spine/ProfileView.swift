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
    @State var view = ""
    @State var view1:Bool = true
    @State var view2 = false
    @State var view3 = false
    @State var view4 = false
    
    var gridItemLayout = [GridItem(.adaptive(minimum:250)), GridItem(.adaptive(minimum:250))]
    
    @ObservedObject var userPostModel = UserPostViewModel()
    
    var body: some View{
        NavigationView(){
        ZStack{
           
            VStack(alignment: .leading){
               
                HStack(alignment: .top){

                    NavigationLink(destination: PlusButtonView()){
                        Text("+")
                            .font(.system(size: 50))
                           
                    } .padding(.top, -5)
                    .padding(.leading)
                   
                
                    Spacer()
                    ZStack(alignment:.center){
                        Image("back").resizable().frame(width: 80, height: 80, alignment: .center)
                        .cornerRadius(80/2)
                    }.padding(.leading, 65)
                  Spacer()
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

                    HStack(spacing: 5){
                        Button(action: {
                             print("sign up bin tapped")
                          
                                ScrollView {
                                    VStack(){
                                    if($userPostModel.woofUrl.wrappedValue != false){
                                    LazyVGrid(columns: gridItemLayout, spacing: 0) {
                                        ForEach(userPostModel.data, id: \.self) { data in

//                                            let color = data.post_backround_color_id ?? "#B89A8A"
                                            let url1: String = "http://162.214.165.52/~pirituc5/assets/upload/spine-post/" + (data.files ?? "http://162.214.165.52/~pirituc5/assets/upload/default.jpg")!


                                            let imageExtensions = ["png", "jpg", "gif", "jpeg", "PNG", "JPG", "GIF", "JPEG"]

                                            let url: URL? = NSURL(fileURLWithPath: url1) as URL

                                            let pathExtention = url?.pathExtension

                                            if imageExtensions.contains(pathExtention!){
                                                if data.type! == "1"{
                                                AsyncImage(url: URL(string: "http://162.214.165.52/~pirituc5/assets/upload/spine-post/" + (data.files ?? "http://162.214.165.52/~pirituc5/assets/upload/profile/default.jpg"))!,
                                                              placeholder: { Text("") },
                                                              image: { Image(uiImage: $0).resizable() })
                                                    .frame(maxHeight: 200)
//                                                    .background(Color(UIColor(hex: color)))
                                                }else{

                                                VStack(){
                                                    HStack(alignment:.top){
                                                    Text(data.title!).foregroundColor(.white).font(.title2).multilineTextAlignment(.center).padding(.bottom)
                                                Text(data.hashtag_ids!).foregroundColor(.white).font(.title2).multilineTextAlignment(.center)
                                                }

                                                }.frame(maxHeight: 200)

//                                                .background(Color(UIColor(hex: color)))
                                                }

                                            }
                                            else{

                                            }
                                        }
                                       }
                                    }
                                    }.navigationTitle("STORIES")
                                    .navigationBarTitleDisplayMode(.inline)
                                    .onAppear(perform: getUserPostData)
                                
                            }
                         }) {
                             Text("POST")
                                 
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
//                    SubViewPost()
                    PagingViewNew(index: $index.animation(), maxIndex: views.count - 1) {
                        ForEach(views, id: \.self) { imageName in
                            if imageName == "POST"{
                                ScrollView {
                                    VStack(){
                                    if($userPostModel.woofUrl.wrappedValue != false){
                                    LazyVGrid(columns: gridItemLayout, spacing: 5) {
                                        ForEach(userPostModel.data, id: \.self) { data in
                                           
                                            let color = data.post_backround_color_id ?? "#B89A8A"
                                        
                                            
                                            let url1: String = "http://162.214.165.52/~pirituc5/assets/upload/spine-post/" + (data.files ?? "http://162.214.165.52/~pirituc5/assets/upload/default.jpg")!
                                            
                                            
                                            let imageExtensions = ["png", "jpg", "gif"]

                                            let url: URL? = NSURL(fileURLWithPath: url1) as URL

                                            let pathExtention = url?.pathExtension
                                              
                                            if imageExtensions.contains(pathExtention!){
                                                if data.type! == "1"{
                                                AsyncImage(url: URL(string: "http://162.214.165.52/~pirituc5/assets/upload/spine-post/" + (data.files ?? "http://162.214.165.52/~pirituc5/assets/upload/profile/default.jpg"))!,
                                                              placeholder: { Text("") },
                                                              image: { Image(uiImage: $0).resizable() })
                                                    .frame(maxHeight: 200)
                                                    .background(Color(UIColor(hex: color)))
                                                }else{
                                                   
                                                VStack(){
                                                   
                                                    Text(data.title ?? "").foregroundColor(.white).font(.title2).multilineTextAlignment(.center).padding(.bottom)
//                                                Text(data.hashtag_ids ?? "").foregroundColor(.white).font(.title2).multilineTextAlignment(.center)
                                                
                                                
                                                }.frame(maxHeight: 200)
                                                
                                                .background(Color(UIColor(hex: color)))
                                                }

                                            }
                                            else{
                        //
                                            }
                                        }
                                    }
                                    }
                                    }.navigationTitle("STORIES")
                                    .navigationBarTitleDisplayMode(.inline)
                                    .onAppear(perform: getUserPostData)
                                }
                            }else{
                                SubViewPost()
                            }
                        }
                    }
                  
                    Spacer()
               
                }
          
        }
           
    }.navigationBarHidden(true)
        }
   
    }
    func subviews(){
        if view1 == true{
            SubViewPost()
        }

    }
    func getUserPostData(){
        userPostModel.userPostData()
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
