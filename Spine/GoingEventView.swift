//
//  GoingEventView.swift
//  Spine
//
//  Created by Aashita Tyagi on 06/04/21.
//

import Foundation
import SwiftUI

struct EventRow4: View {
    
    var event: GoingEventModel.Data
    
    @State private var hasTitle = true
    
    @ObservedObject var goingEventViewModel = GoingEventViewModel()
//    var x = ""
    var body: some View {
        
        VStack(alignment:.leading) {
            
            Text(event.start_date!)
            Divider()
            //                HStack{
            //            NavigationLink(destination: EventDetailView()){
            ForEach(event.records!, id: \.self){ data in
                let x = data.id
                 let _ = print("1234", x!)
                 let userId = UserDefaults.standard.set(x, forKey:"eventId")
                NavigationLink(destination: EventDetailView()){
                    ZStack(){
                        VStack(){
                            HStack(spacing:20){
                                
                                VStack(){
                                    
                                    AsyncImage(url: URL(string: "http://162.214.165.52/~pirituc5/assets/upload/spine-post/" + (data.file ?? "default.jpg"))!,
                                               placeholder: { Text("") },
                                               image: { Image(uiImage: $0).resizable() })
                                        .frame(width:80, height:80)
                                        .cornerRadius(80/2)
                                        .padding(.leading,5)
                                    
                                    let userName  = data.use_display_name ?? data.use_name
                                    Text(userName!).font(.subheadline).font(.subheadline).foregroundColor(.black)
                                    
                                    
                                }
                                VStack(alignment: .leading){
                                    
                                    let type = data.type!
                                    if(type == "0"){
                                        Text("Local").font(.title3).bold().foregroundColor(Color(red: 183 / 255, green: 152 / 255, blue: 136 / 255))
                                    }else if type == "1"{
                                        Text("Online").font(.title3).bold().foregroundColor(Color(red: 183 / 255, green: 152 / 255, blue: 136 / 255))
                                    }
                                    
                                    Text(data.title!).font(.subheadline).foregroundColor(.black)  .lineLimit(2)
                                    
//                                    Text(data.location!).font(.subheadline).foregroundColor(.black)  .lineLimit(2)
                                    
                                    
                                    Text(data.location!).font(.subheadline).foregroundColor(.gray)
                                    HStack(){
                                        Text(data.start_date!).font(.subheadline).foregroundColor(.black)
                                    Spacer()
                                       
                                    let fee = data.symbol ?? "$" + data.fee!
                                    Text(fee).font(.subheadline).foregroundColor(.black)
                                    }
//                                    HStack(){
//                                        Text(data.event_categories!).font(.subheadline).foregroundColor(.black)
//                                        Spacer()
                                       
//                                    }
                                }
//                                Spacer()
                                Image("bookmark").resizable().frame(width: 25, height: 25, alignment: .trailing)
                                
                            }

                        }
                        
                    }.navigationBarTitle(self.hasTitle ? " " : "").foregroundColor(.white)
                    
                }
                
            }
        }
        
    }
    
}


struct GoingEventView: View {
    @State private var searchText = ""
    @State private var showCancelButton: Bool = false
    @State private var favoriteColor = 0
    @ObservedObject var goingEventViewModel = GoingEventViewModel()

    var body: some View{
        VStack(alignment: .leading) {
          
            if($goingEventViewModel.woofUrl.wrappedValue != false){
            
                ForEach(goingEventViewModel.data, id: \.self){ data in
                   
                    EventRow4(event: data)
                 
                        }
               
                    }

            Spacer()
        }
        .onAppear(perform: getGoingEventData)
        .navigationBarHidden(false)
      
            
    }
    
    func getGoingEventData(){
        goingEventViewModel.getGoingEventData()
        
    }

}



