//
//  ImpulseCommentView.swift
//  Spine
//
//  Created by Aashita Tyagi on 17/02/21.
//

import SwiftUI


struct CommentRow: View {
    var Impcomment:ImpulseCommentModel.Data
    
    @ObservedObject var favouriteModel = FavouritViewModel()
    @ObservedObject var userPostModel = UserPostViewModel()
    @ObservedObject var commentModel = CommentViewModel()

    @State private var comment: String = ""
    @State private var isShowingRed = false

    var body: some View {
        
//        ZStack{
            
            VStack(alignment: .leading, spacing: 35) {
              
                HStack(){
                    Image("userb").resizable()
                        .frame(width:25, height:25)
                        .padding()
                        .clipShape(Circle())
                                    .overlay(Circle().stroke(Color("backColor"), lineWidth: 3.0))
                                    .frame(width: 25.0, height: 25.0)
                        .padding()
                    VStack(alignment: .leading){
                        Text(Impcomment.name!).font(.subheadline).foregroundColor(.black)
                            .padding(.leading)
                        Text(Impcomment.comment!).font(.subheadline).foregroundColor(.gray)
                            .padding(.bottom)
                            .padding(.leading)
                        HStack{
                            Spacer()
                            Text("REPLY").foregroundColor(Color("backColor"))
                    }
                }
                    
                 
            }
                
               
            }
            
           
//        }
       
    }
    
}


struct ImpulseCommentView: View {
    @State var email: String = ""
    @ObservedObject var impulseCommentModel = ImpulseCommentViewModel()
    var body: some View {
       
        Spacer()
         Spacer()
        VStack(alignment: .leading) {
            
            if($impulseCommentModel.woofUrl.wrappedValue != false){
                List(impulseCommentModel.data, id: \.self){ data in
                    CommentRow(Impcomment: data)
                } .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                .padding(.bottom, 5)
              
            }
            
            
            HStack(){
            if impulseCommentModel.email.isEmpty{
                Text("email").foregroundColor(.white)
                    .padding(.bottom, 10)
                    .padding(.leading, 10)
            }
            
            TextField("", text: $impulseCommentModel.email)
                .foregroundColor(Color.black)
                .padding(.bottom,10)
                .padding(.leading,10)
//                .frame(width:300, height: 40.0)
                .frame(minWidth: 0, maxWidth: 300, minHeight: 0, maxHeight: 40)
                .font(Font.system(size: 15, weight: .medium, design: .serif))
                .overlay( Divider()
                            .frame(height: 1)
                            .padding(.horizontal, 150)
                            .background(Color("backColor"))
                               .padding(.top,10))
                .padding(.trailing)
                Image("sent").resizable()
                    .frame(width:25, height:25)
                
            }
           

            
        }.navigationBarTitle("Comments")
        .onAppear(perform: impulseComment)
        
        
    }
    
    func impulseComment(){
    
        impulseCommentModel.getImpulseCommentData()
    }
}

struct ImpulseCommentView_Previews: PreviewProvider {
    static var previews: some View {
        ImpulseCommentView()
    }
}






//.clipShape(Circle())
//           .overlay(Circle().stroke(Color.gray, lineWidth: 4))
//           .shadow(radius: 7)
