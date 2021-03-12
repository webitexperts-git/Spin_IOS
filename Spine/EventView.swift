//
//  EventView.swift
//  Spine
//
//  Created by apple on 04/12/20.
//

import SwiftUI


struct ButtonView: View {
    @State var label: String
    @State private var didTap1:Bool = false
    @State private var didTap:Bool = true
    @State private var didTap2:Bool = false
    @State private var didTap3:Bool = false
    @State private var didTap4:Bool = false
    @State private var didTap5:Bool = false
    @State private var didTap6:Bool = false
    @State var eventStatus = ""
    @ObservedObject var allEventViewModel = AllEventViewModel()
    @ObservedObject var nearByViewModel = NearByViewModel()
    @StateObject var string = NearByViewModel()
    
    var body: some View {
        ZStack {

            HStack(){
                
                Button(action:{
//                    allEvent()
                    self.didTap = true
                    self.didTap1 = false
                    self.didTap2 = false
                    self.didTap3 = false
                    self.didTap4 = false
                    self.didTap5 = false
                    self.didTap6 = false
//                    string.string = "all"
//                    allEvent(event: "all")
                    eventStatus = "all"
//                    print("all", allEventViewModel.string)
                    EventView(eventStatus: $eventStatus).getAllEventData()
                    
                }){
                    Text("All").padding()
                       
                } .background(didTap ? Color("backColor") : Color.white)
                .foregroundColor(didTap ? Color.white : Color("backColor"))
                .cornerRadius(18)
                .shadow(radius: 5)
                
 
                
                
                Button(action:{
//                    nearBy()
                    self.didTap = false
                    self.didTap1 = true
                    self.didTap2 = false
                    self.didTap3 = false
                    self.didTap4 = false
                    self.didTap5 = false
                    self.didTap6 = false
                    eventStatus = "nearby"
                    EventView(eventStatus: $eventStatus).getAllEventData()

                }){
                    Text("Nearby").padding()
                       
                } .background(didTap1 ? Color("backColor") : Color.white)
                .foregroundColor(didTap1 ? Color.white : Color("backColor"))
                .cornerRadius(18)
                .shadow(radius: 5)
                
                
                Button(action:{
//                    allEvent()
                    self.didTap = false
                    self.didTap1 = false
                    self.didTap2 = true
                    self.didTap3 = false
                    self.didTap4 = false
                    self.didTap5 = false
                    self.didTap6 = false
                    
                    
                }){
                    Text("Online").padding()
                       
                } .background(didTap2 ? Color("backColor") : Color.white)
                .foregroundColor(didTap2 ? Color.white : Color("backColor"))
                .cornerRadius(18)
                .shadow(radius: 5)
                
                
                
                Button(action:{
//                    allEvent()
                    self.didTap = false
                    self.didTap1 = false
                    self.didTap2 = false
                    self.didTap3 = true
                    self.didTap4 = false
                    self.didTap5 = false
                    self.didTap6 = false
                    
                }){
                    Text("Following").padding()
                       
                } .background(didTap3 ? Color("backColor") : Color.white)
                .foregroundColor(didTap3 ? Color.white : Color("backColor"))
                .cornerRadius(18)
                .shadow(radius: 5)
                
                
                Button(action:{
//                    allEvent()
                    self.didTap = false
                    self.didTap1 = false
                    self.didTap2 = false
                    self.didTap3 = false
                    self.didTap4 = true
                    self.didTap5 = false
                    self.didTap6 = false
                    
                }){
                    Text("Going").padding()
                       
                } .background(didTap4 ? Color("backColor") : Color.white)
                .foregroundColor(didTap4 ? Color.white : Color("backColor"))
                .cornerRadius(18)
                .shadow(radius: 5)
                
                
                
                Button(action:{
//                    allEvent()
                    self.didTap = false
                    self.didTap1 = false
                    self.didTap2 = false
                    self.didTap3 = false
                    self.didTap4 = false
                    self.didTap5 = true
                    self.didTap6 = false
                    
                }){
                    Text("Saved").padding()
                       
                } .background(didTap5 ? Color("backColor") : Color.white)
                .foregroundColor(didTap5 ? Color.white : Color("backColor"))
                .cornerRadius(18)
                .shadow(radius: 5)
                
                
                
                Button(action:{
//                    allEvent()
                    self.didTap = false
                    self.didTap1 = false
                    self.didTap2 = false
                    self.didTap3 = false
                    self.didTap4 = false
                    self.didTap5 = false
                    self.didTap6 = true
                    
                }){
                    Text("Past").padding()
                       
                } .background(didTap6 ? Color("backColor") : Color.white)
                .foregroundColor(didTap6 ? Color.white : Color("backColor"))
                .cornerRadius(18)
                .shadow(radius: 5)
                
            }
            
        }
        
    }
    

    
    func getAllEventData(){
        print("evening", eventStatus)
        allEventViewModel.getAllEventData(event: eventStatus)
}
//
    func getNearByEventData(event:String){
        
//        allEventViewModel.getAllEventData()
    }
}



struct EventRow: View {
   
    var event: AllEventModel.Data
    
    @State private var hasTitle = true
    @ObservedObject var nearbyViewModel = NearByViewModel()
    var body: some View {

        VStack(alignment:.leading) {
           
                Text(event.start_date!)
                Divider()
//                HStack{
//            NavigationLink(destination: EventDetailView()){
                        ForEach(event.records!, id: \.self){ data in
                            NavigationLink(destination: EventDetailView()){
                            ZStack(){
                                VStack(){
                                    HStack(){
                                       
                                        VStack(){
                                          
                                            AsyncImage(url: URL(string: "http://wiesoftware.com/spine/assets/upload/spine-post/" + (data.file ?? "default.jpg"))!,
                                                       placeholder: { Text("") },
                                                       image: { Image(uiImage: $0).resizable() })
                                                .frame(width:80, height:80)
                                                .cornerRadius(80/2)
                                                .padding(.leading,5)
                                            
//                                            Image("back") .resizable().frame(width: 80, height: 80)
//                                .cornerRadius(80/2)
                                   
                                Text(data.use_name!).font(.subheadline)
                                            
                                
//                                Spacer()
                                        }
                                        VStack(alignment: .leading){
                                            Text(data.title!).font(.title3).foregroundColor(Color(red: 183 / 255, green: 152 / 255, blue: 136 / 255)).bold()
                                            Text(data.description!).font(.subheadline).foregroundColor(.black)  .lineLimit(2)
                                            
                                            
                                            Text(data.location!).font(.subheadline).foregroundColor(.gray)
                                            HStack(){
                                            Text(data.start_date!).font(.subheadline).foregroundColor(.black)
                                                Spacer()
                                                let fee = data.fee_currency! + data.fee!
                                            Text(fee).font(.subheadline).foregroundColor(.black)
                                            }
                                            HStack(){
                                            Text(data.event_categories!).font(.subheadline).foregroundColor(.black)
                                                Spacer()
                                                let type = data.type!
                                                if(type == "0"){
                                                    Text("Local").font(.subheadline).foregroundColor(Color(red: 183 / 255, green: 152 / 255, blue: 136 / 255))
                                                }
                                            }
                                        }
                                Spacer()
                                Image("bookmark").resizable().frame(width: 25, height: 25, alignment: .trailing)
                                     
                            

                       
                                }
                            
                                }
                
                            }.navigationBarTitle(self.hasTitle ? " " : "").foregroundColor(.white)
                                
                            }
                
            
                        }
          
//            Spacer()
    }
        
   
    }
   
}





struct EventRow1: View {
   
    var event: NearByModel.Data
    
    @State private var hasTitle = true
    @ObservedObject var nearbyViewModel = NearByViewModel()
    var body: some View {

        VStack(alignment:.leading) {
           
                Text(event.start_date!)
                Divider()
//                HStack{
//            NavigationLink(destination: EventDetailView()){
                        ForEach(event.records!, id: \.self){ data in
                            NavigationLink(destination: EventDetailView()){
                            ZStack(){
                                VStack(){
                                    HStack(){
                                       
                                        VStack(){
                                          
                                            AsyncImage(url: URL(string: "http://wiesoftware.com/spine/assets/upload/spine-post/" + (data.file ?? "default.jpg"))!,
                                                       placeholder: { Text("") },
                                                       image: { Image(uiImage: $0).resizable() })
                                                .frame(width:80, height:80)
                                                .cornerRadius(80/2)
                                                .padding(.leading,5)
                                            
//                                            Image("back") .resizable().frame(width: 80, height: 80)
//                                .cornerRadius(80/2)
                                   
                                Text(data.use_name!).font(.subheadline)
                                            
                                
//                                Spacer()
                                        }
                                        VStack(alignment: .leading){
                                            Text(data.title!).font(.title3).foregroundColor(Color(red: 183 / 255, green: 152 / 255, blue: 136 / 255)).bold()
                                            Text(data.description!).font(.subheadline).foregroundColor(.black)  .lineLimit(2)
                                            
                                            
                                            Text(data.location!).font(.subheadline).foregroundColor(.gray)
                                            HStack(){
                                            Text(data.start_date!).font(.subheadline).foregroundColor(.black)
                                                Spacer()
                                                let fee = data.fee_currency! + data.fee!
                                            Text(fee).font(.subheadline).foregroundColor(.black)
                                            }
                                            HStack(){
                                            Text(data.event_categories!).font(.subheadline).foregroundColor(.black)
                                                Spacer()
                                                let type = data.type!
                                                if(type == "0"){
                                                    Text("Local").font(.subheadline).foregroundColor(Color(red: 183 / 255, green: 152 / 255, blue: 136 / 255))
                                                }
                                            }
                                        }
                                Spacer()
                                Image("bookmark").resizable().frame(width: 25, height: 25, alignment: .trailing)
                                     
                            

                       
                                }
                            
                                }
                
                            }.navigationBarTitle(self.hasTitle ? " " : "").foregroundColor(.white)
                                
                            }
                
            
                        }
          
//            Spacer()
    }
        
   
    }
   
}


struct EventView:View {
    @State private var searchText = ""
    @State private var showCancelButton: Bool = false
    @State private var favoriteColor = 0
    @ObservedObject var allEventViewModel = AllEventViewModel()
    @ObservedObject var nearByEventViewModel = NearByViewModel()
    @EnvironmentObject var string: NearByViewModel
//    @ObservedObject var event = ScoreModel()
    @Binding var eventStatus:String
    
    var body: some View{
        NavigationView(){
        VStack(alignment: .leading) {
            HStack {

                NavigationLink(destination: EventPostView()){
                    Text("+")
                        .foregroundColor(Color(red: 237 / 255, green: 215 / 255, blue: 183 / 255))
                        .font(.system(size: 50))
                        .padding(.bottom, 5)
                }

                HStack {

                    Image(systemName: "magnifyingglass")
                    TextField("Search Spine", text: $searchText, onEditingChanged: { isEditing in
                                   self.showCancelButton = true
                               }, onCommit: {
                                   print("onCommit")
                               }).foregroundColor(.primary)

                               Button(action: {
                                   self.searchText = ""
                               }) {
                                   Image(systemName: "xmark.circle.fill").opacity(searchText == "" ? 0 : 1)
                               }
                           }
                           .padding(EdgeInsets(top: 8, leading: 6, bottom: 8, trailing: 6))
                           .foregroundColor(.secondary)
                           .background(Color(.secondarySystemBackground))
                           .cornerRadius(10.0)

                           if showCancelButton  {
                               Button("Cancel") {
//                        UIApplication.shared.endEditing(true)
                                // this must be placed before the other commands here
                                       self.searchText = ""
                                       self.showCancelButton = false
                               }
                               .foregroundColor(Color(.systemBlue))
                           }

                       }
                       .padding(.horizontal)
                       .navigationBarHidden(showCancelButton)

            
            
//                 Divider()
                 ScrollView(.horizontal) {
                     HStack(spacing: 10) {
//                         ForEach(0..<10) { index in
//                             CircleView(label: "\(index)")
//                         }
                        ButtonView(label: " ")
                     }.padding()
                 }.frame(height: 60)
                 Divider()
                 Spacer()
            
            
//            if allEventViewModel.string == "all"{
            ScrollView(){
            if($allEventViewModel.woofUrl.wrappedValue != false){
            
                ForEach(allEventViewModel.data, id: \.self){ data in
                  
                    EventRow(event: data)
                 
                    }
                }
    
            }
            .onAppear(perform: getAllEventData)
//            }
//            if $string.string.wrappedValue == "nearby" {
////
//                ScrollView(){
//                if($nearByEventViewModel.woofUrl.wrappedValue != false){
//
//                    ForEach(nearByEventViewModel.data, id: \.self){ data in
//
//                        EventRow1(event: data)
//                        
//
//                        }
//                    }
//
//                }.onAppear(perform: getNearbyEventData)
//            }

            
            
            
        }.navigationBarHidden(true)
        
    }
    }
    
    func getAllEventData(){
        print("evening", self.eventStatus)
        allEventViewModel.getAllEventData(event: self.eventStatus)
    }
    
//    func getNearbyEventData(){
//        nearByEventViewModel.getNearByEventData()
//    }
}


struct EventView_Previews: PreviewProvider {
    @State static var isShowing = ""
    static var previews: some View {
        EventView(eventStatus: $isShowing)
//        EventView()
    }
}
