//
//  EventView.swift
//  Spine
//
//  Created by apple on 04/12/20.
//

import SwiftUI
import Combine


struct ButtonView: View {
    @State var label: String
    @State private var didTap1:Bool = false
    @State private var didTap:Bool = true
    @State private var didTap2:Bool = false
    @State private var didTap3:Bool = false
    @State private var didTap4:Bool = false
    @State private var didTap5:Bool = false
    @State private var didTap6:Bool = false
   
    @ObservedObject var allEventViewModel = AllEventViewModel()
    @ObservedObject var nearByViewModel = NearByViewModel()
    @StateObject var string = NearByViewModel()
    @State private var showingSheet = false
    
    var body: some View {
        ZStack {

            HStack(){
                
                Button(action:{
                    self.didTap = true
                    self.didTap1 = false
                    self.didTap2 = false
                    self.didTap3 = false
                    self.didTap4 = false
                    self.didTap5 = false
                    self.didTap6 = false
//                    allEventViewModel.event = "all"
                    getAllEventData(event: "all")
                }){
                    Text("All").padding()
                       
                }
                .background(didTap ? Color("backColor") : Color.white)
                .foregroundColor(didTap ? Color.white : Color("backColor"))
                .cornerRadius(18)
                .shadow(radius: 5)
                
 
                
                
                Button(action:{
                  
                    self.didTap = false
                    self.didTap1 = true
                    self.didTap2 = false
                    self.didTap3 = false
                    self.didTap4 = false
                    self.didTap5 = false
                    self.didTap6 = false
//                    allEventViewModel.event = "nearby"
                    getAllEventData(event: "nearby")

                }){
                    Text("Nearby").padding()
                       
                }
                .background(didTap1 ? Color("backColor") : Color.white)
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
//                    allEventViewModel.event = "online"
                    getAllEventData(event: "online")
                    
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
    

    
    func getAllEventData(event:String){
        let event = event
        allEventViewModel.getAllEventData(event:event)
}
}



struct EventRow: View {
    
    var event: AllEventModel.Data
    
    @State private var hasTitle = true
    
    @ObservedObject var allEventViewModel = AllEventViewModel()
   @State var dayDate = ""
    
    var body: some View {
        
        VStack(alignment:.leading) {
            
            Text(event.start_date!)
            Divider()
            ForEach(event.records!, id: \.self){ data in
              
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
                                        .lineLimit(1)
                                        .frame(width:50)
                                        .multilineTextAlignment(.trailing)
                                        .fixedSize(horizontal: true, vertical: true)
                                        
                                    
                                    
                                }
                                VStack(alignment: .leading){
                                    
                                    let type = data.type!
                                    if(type == "0"){
                                        Text("Local").font(.title3).bold().foregroundColor(Color(red: 183 / 255, green: 152 / 255, blue: 136 / 255))
                                    }else if type == "1"{
                                        Text("Online").font(.title3).bold().foregroundColor(Color(red: 183 / 255, green: 152 / 255, blue: 136 / 255))
                                    }
                                    
                                    Text(data.title!).font(.subheadline).foregroundColor(.black)  .lineLimit(2)
                                    
                                    
                                    Text(data.location!).font(.subheadline).foregroundColor(.gray)
                                    HStack(){
//                                        let dayDate = weekDay("2020-12-23")
//                                    Text(dayDate).font(.subheadline).foregroundColor(.black)
                                    Spacer()
                                       
                                    let fee = data.symbol ?? "$" + data.fee!
                                    Text(fee).font(.subheadline).foregroundColor(.black)
                                    }

                                }
//                                Spacer()
                                Image("bookmark").resizable().frame(width: 25, height: 25, alignment: .trailing)
                                
                            }
                            
                        }
                        
                    }.navigationBarTitle(self.hasTitle ? " " : "").foregroundColor(.white)
                    
                }.simultaneousGesture(TapGesture().onEnded{
                    let x = data.id
                     let _ = print("1234", x!)
                     UserDefaults.standard.set(x, forKey:"eventId")
                    
                   
                })
                
            }
            
        }
        
    }
    
    func weekDay(dateString:String)->String?{
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let date = dateFormatter.date(from:dateString)!
        
        
        let dateFormatter1 = DateFormatter()
        dateFormatter1.dateFormat = "EEE"
        let dayOfTheWeekString = dateFormatter1.string(from: date)
        
         return dayOfTheWeekString
    }
    
    
}


struct EventView:View {
    @State private var searchText = ""
    @State private var showCancelButton: Bool = false
    @State private var favoriteColor = 0
    @ObservedObject var allEventViewModel = AllEventViewModel()
    @ObservedObject var nearByEventViewModel = NearByViewModel()

    var body: some View{
       
        VStack(alignment: .leading) {
           
            if($allEventViewModel.woofUrl.wrappedValue != false){
                ScrollView(.vertical){
                ForEach(allEventViewModel.data, id: \.self){ data in
                   
                    EventRow(event: data)
                 
                        }
               
                    }
            }

            Spacer()
        }
        .onAppear(perform: getAllEventData)
        .navigationBarHidden(false)
      
            
    }
    
    func getAllEventData(){
        allEventViewModel.getAllEventData(event:"all")
        
    }
    
}

    
 



struct EventView_Previews: PreviewProvider {
    static var previews: some View {
        EventView()
//        EventView()
    }
}
