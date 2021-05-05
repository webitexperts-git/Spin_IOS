//
//  EventCommentDetail.swift
//  Spine
//
//  Created by Aashita Tyagi on 09/04/21.
//

import SwiftUI

struct EventCommentDetailView: View {
    @ObservedObject var eventCommentDetailViewModel = EventCommentDetailViewModel()
    var body: some View {
        ScrollView(){
        VStack(alignment: .leading){
            if $eventCommentDetailViewModel.woofUrl.wrappedValue != false{
                
                ForEach(eventCommentDetailViewModel.data, id: \.self) { data in
                    let username = data.post_user_display_name ?? data.post_user_name
                    Text(username!)
                    let comment = data.comment ?? ""
                    Text(comment!).foregroundColor(.gray)
                    HStack(spacing:20){
                        Image("heart").resizable().frame(width:25, height:25)
                        Text("Reply").foregroundColor(Color("backColor"))
                        Spacer()
                        Text("14 h")
                    }
                    
                }
              
            }
        }
    }.onAppear(perform: getEventComment)
        .navigationBarHidden(false)
        .navigationBarTitleDisplayMode(.inline)
        .padding()
   
    }
    func getEventComment(){
        eventCommentDetailViewModel.getEventCommentDetailData()
        }
}

struct EventCommentDetailView_Previews: PreviewProvider {
    static var previews: some View {
        EventCommentDetailView()
    }
}
