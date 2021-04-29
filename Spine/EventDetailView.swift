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
    @State var title2 = ""
    @State var startDate2 = ""
    var dt = ""
    @State var bookEvent = false
    @State var reserveSpot = false
    @State var bookMessage = false
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
    @State private var userName = ""
    @State private var profileImgStr = ""
    @State var titleBtn = ""
//    var x:String
//    init() {
//           UITextView.appearance().backgroundColor = .clear
//       }
    @State var index = 0

    var images:[String] = []
    
    var body: some View {
        ZStack(){
           
        ScrollView(){
        ZStack(){
          
            if $eventDetailModel.woofUrl.wrappedValue != false{

                VStack(alignment:.leading) {
                   
                    let img = eventDetailModel.imageStr
                    let images = img.components(separatedBy: " ,")
                    let _ = print("imageArray", images)
            
                  PagingView(index: $index.animation(), maxIndex: images.count - 1) {
                      ForEach(images, id: \.self) { imageName in
                        AsyncImage(url: URL(string: "http://162.214.165.52/~pirituc5/assets/upload/spine-post/" + (imageName))!,
                                   placeholder: { Text("Loading..") },
                                   image: { Image(uiImage: $0).resizable() })

                      }
                  }
//                  .frame(minWidth:300, maxWidth:.infinity , minHeight: 300, maxHeight: 300)
                  .aspectRatio(4/3, contentMode: .fit)
                  .clipShape(RoundedRectangle(cornerRadius: 0))
                Spacer()

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
                                
//                                Text(eventDetailModel)
//                                    .foregroundColor(.white)
//                                    .font(Font.system(size: 27))
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
                                    Text(eventDetailModel.location)
                                        .foregroundColor(.white)
                                        .font(Font.system(size: 27))
                                }else{
                                    Text(eventDetailModel.location)
                                        .lineLimit(2)
                                        .foregroundColor(.white)
                                        .font(Font.system(size: 27))
                                }
                       
                                
//                                Text(eventDetailModel.linkOfEvent)
//                                    .foregroundColor(.white)
//                                    .font(Font.system(size: 22))
                                    
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
                            
                                Text(eventDetailModel.language)
                                    .foregroundColor(.white)
                                    .font(Font.system(size: 22))
                                    
                            }
                        }
                        
                }
                    Spacer()
                    
            }
                
        }
                    ScrollView(.horizontal){
                       
                        if($eventGoingModel.woofUrl.wrappedValue != false){
                           
                                let countPerson = String(eventGoingModel.data!.user_list!.count) + " " + "person going"
                                Text(countPerson)
                          
                            HStack(){
                            ForEach(eventGoingModel.data!.user_list!, id: \.self){ data in
                                EventGoingRow(event: data)
                            }
                           
                        }
                        }
                        Divider()
                    }.onAppear(perform: eventGoing)
                    .frame(height: 130)
                    .padding()
                    
                    
                    HStack(){
                        AsyncImage(url: URL(string: "http://162.214.165.52/~pirituc5/assets/upload/profile/" + (eventDetailModel.profileImageStr))!,
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
//                            NavigationLink(destination: MessagePopUp()){
//                                Text("Message").foregroundColor(.white)
//
//
//                            }.frame(width: 100, height: 40)
//                            .background(Color("backColor"))
//                            .cornerRadius(20.0)
                            
                            Button(action:{
                                bookMessage.toggle()
                            }){
                                Text("Message >").foregroundColor(.white)
                            }.frame(width: 120, height: 40)
                            .background(Color("backColor"))
                            .cornerRadius(20.0)
                            .padding()
                           
                           
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
                        if $eventGetCommentViewModel.woofUrl.wrappedValue != false{
                            ScrollView(){
                            ForEach(eventGetCommentViewModel.data, id: \.self) { data in
                                VStack(alignment:.leading){
                                let username = data.post_user_display_name ?? data.post_user_name
                                Text(username!)
                                let comment = data.comment ?? ""
                                    Text(comment).foregroundColor(.gray)
                                HStack(spacing:20){
                                    Image("heart").resizable().frame(width:25, height:25)
                                    Text("Reply").foregroundColor(Color("backColor"))
                                    Spacer()
                                    let daysMin = daysFromDate(findDate: data.created_on!)
                                    
                                    Text(daysMin!)
                                }
                                }
                                
                            }
                            }.frame(minHeight:0, maxHeight:300)
                          
                        }
                        
                        HStack(){
                           
                            let userId = UserDefaults.standard.string(forKey: "user_id")
                            if eventDetailModel.eventUserId != userId{
                                let symbol = eventDetailModel.symbol
                                let fee = eventDetailModel.fee
                                let total = fee
                                
                                Text(total)
                                Spacer()
                                
                                if (eventDetailModel.linkOfEvent != ""){
                                    
                                    Button(action:{
                                        bookEvent.toggle()
                                    }){
                                       
                                        Text("BOOK EVENT").foregroundColor(.white)

                                    }.frame(width: 130, height: 40)
                                    .background(Color("backColor"))
                                    .cornerRadius(20.0)
                                    .padding()

                                }else{
                                    
                                    Button(action:{
                                        reserveSpot.toggle()
                                    }){
                                       
                                        Text("RESERVE A SPOT").foregroundColor(.white)

                                    }.frame(width: 160, height: 40)
                                    .background(Color("backColor"))
                                    .cornerRadius(20.0)
                                    .padding()

                                }
                               
                                
                            }else if eventDetailModel.fee == "0"{
                                Text("Free")
                                    .padding(.leading)
                            }
                            else{
                                Text("Free")
                                    .padding(.leading)
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
                    .position(x: 60.0, y: UIScreen.main.bounds.height/6)
                    .font(.title).foregroundColor(.white)
                
        }
            
            btnBack
                .position(x: 20.0, y: 20.0)
         
            }
        }.onAppear(perform: eventDetail)
        .navigationBarHidden(true)
            
            if bookEvent != false{
                ZStack(alignment:.top){
                    EventBookPopUp(startDate2: $eventDetailModel.actualStartDate, title2: $eventDetailModel.title, bookEvent: $bookEvent)
                }
            }
            
            if bookMessage != false{
                ZStack(alignment:.top){
                    MessagePopUp(bookMessage: $bookMessage, userName:$eventDetailModel.hostDisplayName, profileImgStr: $eventDetailModel.profileImageStr)
                }
            }
            
            if reserveSpot != false{
                ZStack(alignment:.top){
                    ReserveSpotPopUp(reserveSpot: $reserveSpot, title: $eventDetailModel.title, startDate:$eventDetailModel.startDate, endDate: $eventDetailModel.endDate)
                }
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
    
    func daysFromDate(findDate:String)-> String?{
        
        let isoDate = findDate

        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let date = dateFormatter.date(from:isoDate)!
       
        
        let now = Date()
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .full
        formatter.allowedUnits = [.month, .day, .hour, .minute, .second]
        formatter.maximumUnitCount = 2
        
        let string = formatter.string(from: date, to: now)
//        print("string",string)
        let array = string?.components(separatedBy: ", ")
        
        if (array?[0])! >= "0"{
            return array?[0]
        }else if (array?[0])! <= "0"{
            return array?[1]
        }else if ((array?[0])! <= "0" && (array?[1])! <= "0"){
           return array?[2]
        }else{
            return array?[3]
        }
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
    @Binding var startDate2:String
    @Binding var title2:String
    @Binding var bookEvent:Bool
    var body: some View{
        ZStack{
              Rectangle()
              .fill(Color.gray)
              .opacity(0.5)
          
            Button(action:{
                bookEvent.toggle()
            }){
                Image("close").resizable().frame(width: 25, height: 25)
            }  .position(x: 30, y: 200)
          
              VStack {
               
                  Spacer()
               
                  HStack {
                      VStack(spacing: 20) {
                          Text("I'd like to join!").fontWeight(.bold).padding(.all, 20)
                      
                        Text(title2)
                       let day = weekDay(dateString: startDate2)
                        let stringA = formattedDateTimeFromString(dateString: startDate2, withFormat: "dd MMM yyyy")
                        
                        let fullDate = day! + ", " + stringA!
                        Text(fullDate)
                       
                      
                        Text("Once the host accepts your request, the link to the event is shared with you.").padding()
                            .multilineTextAlignment(.center)
                        Button(action:{
                            
                        }){
                            Text("SEND REQUEST TO HOST")
                                .foregroundColor(.white)
                                .padding()
                          
                        }.background(Color("backColor"))
                        .cornerRadius(20.0)
                        
                      }
                  }
                  .frame(minWidth: 300, maxWidth: .infinity, minHeight: 250, maxHeight: 350, alignment: .top)
                  .fixedSize(horizontal: false, vertical: false)
                  .background(RoundedRectangle(cornerRadius: 20).fill(Color.white.opacity(1)))
                  .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.white, lineWidth: 1))
                  .padding()
                  Spacer()
              }
          }
        }
    
    func formattedDateTimeFromString(dateString: String, withFormat format: String) -> String? {

        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"

        if let date = inputFormatter.date(from: dateString) {

          let outputFormatter = DateFormatter()
          outputFormatter.dateFormat = format

            return outputFormatter.string(from: date)
        }

        return nil
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


struct ReserveSpotPopUp:View{
    
    @Binding var reserveSpot:Bool
    @Binding var title:String
    @Binding var startDate:String
    @Binding var endDate:String
    @State var textViewEdt = ""
   
    var body: some View{
        ZStack{
              Rectangle()
              .fill(Color.gray)
              .opacity(0.5)
          
            Button(action:{
                reserveSpot.toggle()
            }){
                Image("close").resizable().frame(width: 25, height: 25)
            }  .position(x: 30, y: 200)
          
              VStack {
               
                  Spacer()
               
                  HStack {
                      VStack(spacing: 20) {
                          Text("I'd like to join!").fontWeight(.bold).padding(.all, 20)
                      
                        Text(title)
//                       let day = weekDay(dateString: startDate)
                      
                        let stringA = formattedDateTimeFromString(dateString: startDate, withFormat: "dd MMM")
                        
                        let fullDate = stringA!
                        
//                        let day2 = weekDay(dateString: endDate)
                        let stringB = formattedDateTimeFromString(dateString: endDate, withFormat: "dd MMM")
                        
                        let fullDate2 = stringB!
                        HStack(){
                            Text(fullDate)
                            Text("-")
                            Text(fullDate2)
                        }
                       
                       
                      
                        ZStack(){
                        
                        TextEditor(text: $textViewEdt)
                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 100, maxHeight: 100)
                       .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)), lineWidth: 1))
                            .padding(.top, 20)
                            .padding()
                            
//                        Text(textViewEdt).opacity(0.5).padding(.all, 8)
                            if textViewEdt.isEmpty {
                                Text("Type a message").multilineTextAlignment(.leading)
                                    .foregroundColor(.gray)
                                    .padding(.top, 20)
                                
                            }
                        
                        }
                        
                        Button(action:{
                            
                        }){
                            Text("SEND")
                                .foregroundColor(.white)
                                .padding()
                          
                        }.background(Color("backColor"))
                        .cornerRadius(20.0)
                        
                      }
                  }
                  .frame(minWidth: 300, maxWidth: .infinity, minHeight: 400, maxHeight: 400, alignment: .top)
                  .fixedSize(horizontal: false, vertical: false)
                  .background(RoundedRectangle(cornerRadius: 20).fill(Color.white.opacity(1)))
                  .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.white, lineWidth: 1))
                  .padding()
                  Spacer()
              }
          }
        }
    
    func formattedDateTimeFromString(dateString: String, withFormat format: String) -> String? {

        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "yyyy-MM-dd"

        if let date = inputFormatter.date(from: dateString) {

          let outputFormatter = DateFormatter()
          outputFormatter.dateFormat = format

            return outputFormatter.string(from: date)
        }

        return nil
    }
    
    func weekDay(dateString:String)->String?{
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = dateFormatter.date(from:dateString)!
        
        
        let dateFormatter1 = DateFormatter()
        dateFormatter1.dateFormat = "EEE"
        let dayOfTheWeekString = dateFormatter1.string(from: date)
        
         return dayOfTheWeekString
    }
}


struct MessagePopUp:View{
    @Binding var bookMessage:Bool
    @Binding var userName:String
    @Binding var profileImgStr:String
    @State var textViewEdt = ""
    var body: some View{
        ZStack{
              Rectangle()
              .fill(Color.gray)
              .opacity(0.5)
          
            Button(action:{
                bookMessage.toggle()
            }){
                Image("close").resizable().frame(width: 25, height: 25)
            }  .position(x: 30, y: UIScreen.main.bounds.height/4)
          
              VStack {
               
                  Spacer()
               
                  HStack {
                    VStack(alignment:.center, spacing: 20) {
                        let _ = print("profileImageStr",profileImgStr)
                        AsyncImage(url: URL(string: "http://162.214.165.52/~pirituc5/assets/upload/profile/" + (profileImgStr))!,
                                   placeholder: { Text("") },
                                   image: { Image(uiImage: $0).resizable() })
                            .frame(width:100, height:100)
                            .border(Color.white, width: 2.0)
                            .cornerRadius(120/2)
                            .padding(.leading,20)
                          
                            .position(x: (UIScreen.main.bounds.width/2)-30 , y: 0)
//                        Image("camera").resizable().frame(width: 80, height: 80)
//                            .position(x: (UIScreen.main.bounds.width/2)-20 , y: 0)
                        Text(userName).padding(.top, 30)
                        ZStack(){
                        
                        TextEditor(text: $textViewEdt)
                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 100, maxHeight: 100)
                       .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)), lineWidth: 1))
                            .padding(.top, 20)
                            .padding()
                            
//                        Text(textViewEdt).opacity(0.5).padding(.all, 8)
                            if textViewEdt.isEmpty {
                                Text("Type a message").multilineTextAlignment(.leading)
                                    .foregroundColor(.gray)
                                    .padding(.top, 20)
                                
                            }
                        
                        }

                        HStack(){
                        Button(action:{

                        }){
                            Text("CANCEL")
                                .foregroundColor(.white)
                                .padding()

                        }.background(Color("backColor"))
                        .cornerRadius(20.0)
                            
                            Spacer()
                            Button(action:{

                            }){
                                Text("SEND")
                               
                                    .foregroundColor(.white)
                                    .padding()

                            }.background(Color("backColor"))
                            .cornerRadius(20.0)
//                        Spacer()
                        }.padding()
                        
                        
                      
                      }
                  }
                  .frame(minWidth: 300, maxWidth: .infinity, minHeight: 250, maxHeight: 350, alignment: .top)
                  .fixedSize(horizontal: false, vertical: false)
                  .background(RoundedRectangle(cornerRadius: 20).fill(Color.white.opacity(1)))
                  .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.white, lineWidth: 0))
                  .padding()
                  Spacer()
              }
          }
    }
}



struct EventDetailView_Previews: PreviewProvider {
    static var previews: some View {
        EventDetailView()
    }
}
