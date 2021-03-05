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
    
    @State var string = ""
    
    @ObservedObject var allEventViewModel = AllEventViewModel()
    var body: some View {
        ZStack {

            HStack(){
                
                Button(action:{
                    allEvent()
                    self.didTap = true
                    self.didTap1 = false
                    self.didTap2 = false
                    self.didTap3 = false
                    self.didTap4 = false
                    self.didTap5 = false
                    self.didTap6 = false
                    
                }){
                    Text("All").padding()
                       
                } .background(didTap ? Color("backColor") : Color.white)
                .foregroundColor(didTap ? Color.white : Color("backColor"))
                .cornerRadius(18)
                .shadow(radius: 5)
                
 
                
                
                Button(action:{
                    nearBy()
                    self.didTap = false
                    self.didTap1 = true
                    self.didTap2 = false
                    self.didTap3 = false
                    self.didTap4 = false
                    self.didTap5 = false
                    self.didTap6 = false
                    self.string = "getUsersEventsList"
                    
                }){
                    Text("Nearby").padding()
                       
                } .background(didTap1 ? Color("backColor") : Color.white)
                .foregroundColor(didTap1 ? Color.white : Color("backColor"))
                .cornerRadius(18)
                .shadow(radius: 5)
                
                
//                NavigationLink(destination: EventView()){
//                Text("Nearby").padding()
////                    .frame(minWidth: 0, maxWidth: 300, minHeight: 0, maxHeight: 40)
//                    .foregroundColor(Color(red: 237 / 255, green: 215 / 255, blue: 183 / 255))
//                    .background(Color.white)
//                    .cornerRadius(18)
//                    .shadow(radius: 5)
////                    .padding()
//
//            }
                
                Button(action:{
                    allEvent()
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
                    allEvent()
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
                    allEvent()
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
                    allEvent()
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
                    allEvent()
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
    
    func allEvent(){
        print("abcd")
        allEventViewModel.getAllEventData()
    }
    
    func nearBy(){
        allEventViewModel.getAllEventData()
    }
}



struct EventRow: View {
    var event: AllEventModel.Data
    
    var body: some View {
       
        VStack(alignment:.leading) {
                Text(event.start_date!)
                Divider()
//                HStack{
          
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
                
                            }}
                
            
                        }
          
            Spacer()
    }
        
    }
}


struct EventView:View {
    @State private var searchText = ""
    @State private var showCancelButton: Bool = false
    @State private var favoriteColor = 0
    @ObservedObject var allEventViewModel = AllEventViewModel()
    
    var body: some View{
        NavigationView(){
        VStack(alignment: .leading) {
            HStack {

//                Button(action: {
//
//                }) {
//                    Text("+")
//
//                        .frame(width: 40, height: 40)
//                        .font(.system(size: 50))
//                        .foregroundColor(Color(red: 237 / 255, green: 215 / 255, blue: 183 / 255))
//
//                }.padding(.bottom, 10)
                
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
            
            
          
            
            if($allEventViewModel.woofUrl.wrappedValue != false){
            
                List(allEventViewModel.data, id: \.self){ data in
                  
                EventRow(event: data)
                 
                    }
                

//                .frame(minWidth:0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            
            }
            
        }.onAppear(perform: getAllEventData)
        .navigationBarHidden(true)
    }
    }
    
    func getAllEventData(){
        allEventViewModel.getAllEventData()
    }
}


struct EventView_Previews: PreviewProvider {
    static var previews: some View {
        EventView()
    }
}
