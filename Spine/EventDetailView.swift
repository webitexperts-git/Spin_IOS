//
//  EventDetailView.swift
//  Spine
//
//  Created by Aashita Tyagi on 01/03/21.
//

import SwiftUI



struct EventDetailView: View {
    @Environment(\.presentationMode) var presentation
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @ObservedObject var eventDetailModel = EventDetailViewModel()
    @ObservedObject var eventGoingModel = EventGoingViewModel()
    @ObservedObject var eventGetCommentViewModel = EventGetCommentViewModel()
    @State var text = ""
    @State var text2 = false
    var dt = ""
    @State var bookEvent = false
//    @Binding var eventId:String
    var btnBack : some View { Button(action: {
        self.presentationMode.wrappedValue.dismiss()
        }) {
     HStack(alignment: .top) {
         Image("backBtn")
             // set image here
             .resizable()
             .renderingMode(.template)
                .foregroundColor(.black)
             .frame(width: 20, height: 20)
                .aspectRatio(contentMode: .fit)
            
            }
        }
    }
    let colors: [Color] = [Color("PostColor1"), Color("PostColor2"), Color("PostColor3"), Color("PostColor4")]
    @State private var title = ""
    @State private var placeholder = ""
//    var x:String
//    init() {
//           UITextView.appearance().backgroundColor = .clear
//       }
    @State var index = 0

    var images:[String] = []
    
    var body: some View {
      
        ScrollView(){
        ZStack(){
          
            if $eventDetailModel.woofUrl.wrappedValue != false{
//                let x = id
//                let _ = print("id123", x)
                VStack(alignment:.leading) {
                   
                    let img = eventDetailModel.imageStr
                    let images = img.components(separatedBy: " ,")
                    let _ = print("imageArray", images)
            
                  PagingView(index: $index.animation(), maxIndex: images.count - 1) {
                      ForEach(images, id: \.self) { imageName in
                        AsyncImage(url: URL(string: "http://162.214.165.52/~pirituc5/assets/upload/spine-post/" + (imageName))!,
                                   placeholder: { Text("") },
                                   image: { Image(uiImage: $0).resizable() })

                      }
                  }
                  .aspectRatio(4/3, contentMode: .fit)
                  .clipShape(RoundedRectangle(cornerRadius: 0))
                Spacer()

//                  Stepper("Index: \(index)", value: $index.animation(.easeInOut), in: 0...images.count-1)
//                      .font(Font.body.monospacedDigit())
            ZStack(alignment: .leading){
            Rectangle()
                .fill(Color("backColor"))
                .frame(width: UIScreen.main.bounds.width, height: 360, alignment: .topLeading)
                VStack(alignment: .leading){
                    let _ = print("eventType", eventDetailModel.type)
                    Group{
                        if eventDetailModel.type == "0"{
                            Text("LOCAL EVENT")
                                .foregroundColor(.white)
                                .font(Font.system(size: 26))
                                .padding()
                        }else{
                            Text("ONLINE EVENT")
                                .foregroundColor(.white)
                                .font(Font.system(size: 26))
                                .padding()
                        }
              
                    let title = eventDetailModel.title
                    Text(title)
                    .foregroundColor(.white)
                    .font(Font.system(size: 30))
                    .padding()
                    HStack(){
                        Image("calendar")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .padding(.leading)
                        VStack(alignment:.leading){
                            Text(eventDetailModel.startDate)
                        .foregroundColor(.white)
                        .font(Font.system(size: 27))
                            HStack(){
                            Text(eventDetailModel.startTime)
                                .foregroundColor(.white)
                                .font(Font.system(size: 14))
                                Text("-").foregroundColor(.white)
                                Text(eventDetailModel.endTime)
                                    .foregroundColor(.white)
                                    .font(Font.system(size: 14))
                            }
                                
                        }
                    }
                        
                        HStack(){
                            Image("pin")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .padding(.leading)
                            VStack(alignment:.leading){
                                
                                if eventDetailModel.type == "0"{
                                    Text("LOCAL")
                                        .foregroundColor(.white)
                                        .font(Font.system(size: 27))
                                }else{
                                    Text("Online")
                                        .foregroundColor(.white)
                                        .font(Font.system(size: 27))
                                }
                       
                            
                                Text(eventDetailModel.linkOfEvent)
                                    .foregroundColor(.white)
                                    .font(Font.system(size: 22))
                                    
                            }
                        }
                        
                        HStack(){
                            Image("microphone")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .padding(.leading)
                            VStack(alignment:.leading){
                        Text("Hosted in")
                            .foregroundColor(.white)
                            .font(Font.system(size: 27))
                            
                                Text(eventDetailModel.location)
                                    .foregroundColor(.white)
                                    .font(Font.system(size: 22))
                                    
                            }
                        }
                        
                }
                    Spacer()
                    
            }
        }
                    VStack(alignment:.leading){
                        if($eventGoingModel.woofUrl.wrappedValue != false){
                            let countPerson = String(eventGoingModel.data!.user_list!.count) + " " + "person going"
                            Text(countPerson)
                            ForEach(eventGoingModel.data!.user_list!, id: \.self){ data in
                                
                                EventGoingRow(event: data)
                             
                                }
                           
                            }
                        Divider()
                    }.onAppear(perform: eventGoing)
                    .frame(height: 130)
                    .padding()
                   
                    
                    HStack(){
                        AsyncImage(url: URL(string: "http://162.214.165.52/~pirituc5/assets/upload/spine-post/" + (eventDetailModel.imageStr))!,
                                   placeholder: { Text("") },
                                   image: { Image(uiImage: $0).resizable() })
                            .frame(width:80, height:80)
                            .cornerRadius(80/2)
                            .padding(.leading,20)
                        HStack(){
                            
                            VStack(){
                                let useName = eventDetailModel.hostDisplayName
                                Text(useName)
                                Text("HOST").foregroundColor(.gray)
                            }
                        
                            Spacer()
                            NavigationLink(destination: MessageEventView()){
                                Text("Message").foregroundColor(.white)
                               
                               
                            }.frame(width: 100, height: 40)
                            .background(Color("backColor"))
                            .cornerRadius(20.0)
                           
                           
                        }.padding()
                       
                    }
                  
                    Text("About the event")
                        .font(.title3).padding()
                    Text(eventDetailModel.description).padding()
                    
                    Text("COMMENTS").padding(.leading)
                    HStack {
                       
                        ZStack(alignment: .leading) {
                            if text.isEmpty{
                                Text("comments").foregroundColor(.gray)
                                    .padding(.bottom, 5)
                                    .padding(.leading, 25)
    
                            }

                            TextField("", text: $text)
                                .foregroundColor(Color.black)
                                .padding(10)
                                .frame(maxWidth:.infinity, maxHeight: 45.0)
                                .font(Font.system(size: 15, weight: .medium, design: .serif))
                            }
                        
                        ZStack(alignment: .trailing){
                            NavigationLink(destination: EventCommentDetailView()){
                                Text("Post")
                                }
                        }.padding(.trailing)
                       
                        }.overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 2))
                    .padding()
                    
                    
                    VStack(alignment: .leading){
                        if $eventDetailModel.woofUrl.wrappedValue != false{
                            
                            ForEach(eventGetCommentViewModel.data, id: \.self) { data in
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
                    } .onAppear(perform: getEventComment)
                    .padding()
                    
                   
                        
                }
               
                let dt = eventDetailModel.startDate
                let stringA = formattedDateFromString(dateString: dt, withFormat: "dd MMM")
                Text(stringA!)
                    .fixedSize(horizontal: false, vertical: true)
                    .multilineTextAlignment(.center)
                    .padding()
                    .frame(width: 100, height: 100)
                    .background(Rectangle().fill(Color("backColor")).shadow(radius: 3))
                    .position(x: 60.0, y: 250.0)
                    .font(.title).foregroundColor(.white)
        }
            
            btnBack
                .position(x: 20.0, y: 20.0)
           
           
         
            }
        }.onAppear(perform: eventDetail)
        .navigationBarHidden(true)
        ZStack(){
            HStack(){
               
                let userId = UserDefaults.standard.string(forKey: "user_id")
                if eventDetailModel.eventUserId != userId{
                    Text("$100")
                    Spacer()
                    Button(action:{
                        bookEvent.toggle()
                    }){
                        Text("Book Event >").foregroundColor(.white)
                    }.frame(width: 120, height: 40)
                    .background(Color("backColor"))
                    .cornerRadius(20.0)
                    .padding()
                    
                    
//                    NavigationLink(destination: BookEventView()){
//                        Text("Book Event >").foregroundColor(.white)
//
//                        }.frame(width: 120, height: 40)
//                    .background(Color("backColor"))
//                    .cornerRadius(20.0)
//                    .padding()
                }else{
                    Text("Free")
                        .padding(.leading)
                }
       
            }
    }
        if bookEvent != false{
            ZStack(){
            EventBookPopUp()
            }
        }
            
}
    
    func eventDetail(){
        eventDetailModel.getEventDetailData()
    }
    
    func eventGoing(){
        eventGoingModel.getEventGoingData()
    }
    
    func getEventComment(){
        eventGetCommentViewModel.getEventCommentData()
    }
    
    func formattedDateFromString(dateString: String, withFormat format: String) -> String? {

        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "yyyy-MM-dd"

        if let date = inputFormatter.date(from: dateString) {

          let outputFormatter = DateFormatter()
          outputFormatter.dateFormat = format

            return outputFormatter.string(from: date)
        }

        return nil
    }
}



struct EventGoingRow: View {
    
    var event: EventGoingModel.User_list
    
    @State private var hasTitle = true
    
    @ObservedObject var eventGoingViewModel = EventGoingViewModel()
    
    
    var body: some View {
        
        VStack(alignment:.leading) {
                        
            AsyncImage(url: URL(string: "http://162.214.165.52/~pirituc5/assets/upload/profile/" + (event.profile_pic ?? "default.jpg"))!,
                       placeholder: { Text("") },
                       image: { Image(uiImage: $0).resizable() })
                .frame(width:80, height:80)
                .cornerRadius(80/2)
                .padding(.leading,5)
        }
        
    }
}
    

struct EventBookPopUp:View{
    var body: some View{
        ZStack(){
//            Color.gray.opacity(0.5).edgesIgnoringSafeArea(.all)
        }.frame(minWidth:400, maxWidth: .infinity, minHeight: 300, maxHeight:.infinity, alignment: .center)
        .background(Color.gray.opacity(0.5))
      
    }
}



struct EventDetailView_Previews: PreviewProvider {
    static var previews: some View {
        EventDetailView()
    }
}
