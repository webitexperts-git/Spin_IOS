//
//  EventPostView.swift
//  Spine
//
//  Created by Aashita Tyagi on 22/02/21.
//

import SwiftUI
import Combine
import CoreLocation

struct EventPostView: View {
    
    enum ActiveSheet: Identifiable {
        case first, second
        
        var id: Int {
            hashValue
        }
    }
    @State var activeSheet: ActiveSheet?
    @State private var name: String = ""
    @State private var eventTitle: String = ""
    @State private var eventType: String = ""
    @State private var eventLink: String = ""
    @State private var aboutEvent: String = ""
    @State private var eventCategory: String = ""
    @State private var eventFee: String = ""
    @State private var eventCurrency: String = ""
    @State private var eventAttendee: String = ""
    @State private var eventLanguage: String = ""
    @State private var showingSheet = false
    @State private var languageList = false
    @State private var language = ""
    @State private var currency = ""
    @State private var currencyList = false
    @State private var acceptParticipaient = ""
    @State private var allowComment = ""
    @State private var participaients = false
    @State private var comment = false
   
    
    
//    @ObservedObject var lm = AddressLocation()
//    var placemark: String { return("\(String(describing: lm.placemark?.locality))") }
    
    @State private var placeholder = "Who should join, and why? What will you do at your event? (minimum 50 characters)"
    @State private var showGreeting = true
    @State var showImagePicker: Bool = false
    @State var showCameraPicker: Bool = false
    @State var image: Image? = nil
    @State var imgData: Data? = nil
    
    @State var image1 : UIImage? = nil
    @State var uiImage: UIImage? = nil
    @State var selectedDateStart = Date()
    @State var selectedDateEnd = Date()
    @State var selectedTimeStart = Date()
    @State var selectedTimeEnd = Date()
    
    var selectedDateStartStr = ""
    @State var selectedDateEndStr = ""
    @State var selectedTimeStartStr = ""
    @State var selectedTimeEndStr = ""

    @State var timeZone = ""
    
    @State private var showPopUp = false
    
    @ObservedObject var locationManager = LocationManager()
    @ObservedObject var eventCategoryModel = EventCategoryViewModel()
    @ObservedObject var eventLanguageModel = EventLanguageViewModel()
    @ObservedObject var eventPostModel = EventPostViewModel()
    @ObservedObject var eventCurrencyModel = EventCurrencyViewModel()
    
    var userLatitude: String {
           return "\(locationManager.lastLocation?.coordinate.latitude ?? 0)"
       }

       var userLongitude: String {
           return "\(locationManager.lastLocation?.coordinate.longitude ?? 0)"
       }
    @State var place = LocationManager().placemark
 
    var textBinding: Binding<String> {
            Binding<String>(
                get: {
                    return self.locationManager.placemark ?? ""
            },
                set: { newString in
                    self.locationManager.placemark = newString
            })
        }
    
    var timeZoneBinding: Binding<String> {
            Binding<String>(
                get: {
                    return TimeZone.current.identifier
            },
                set: { newString in
                    _ = newString
            })
        }
    
   
    @State private var showingSheetEvent = false
    
     var localTimeZoneAbbreviation: String { return TimeZone.current.abbreviation() ?? "" }
    
//    @State var localTimeZoneAbbreviation: Int = TimeZone.current.secondsFromGMT()
   

    var body: some View {
    
        ScrollView{
                ZStack{
                Rectangle()
                    .overlay(
                        Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
                        )
        //            .frame(width: 200, height: 150)
                    .frame(minWidth:0, maxWidth: .infinity, minHeight: 250, maxHeight: 250)
                    VStack{
//                    Image("camera")
                        ZStack(){
                            image?.resizable().frame(minWidth:0, maxWidth: .infinity, minHeight: 250, maxHeight: 250)
//                            Text("Add Photo").foregroundColor(.white).font(.subheadline).padding(.top,80)
                            Image("camera")
                        }
//                        Button("Add Photo") {
//                                showingSheet = true
//                        }
                        
                        Button(action: {
                            self.showImagePicker = true
                            showingSheet = true
                            self.showCameraPicker = true
                        }){
                            Text("Add Image")
                        }
//                        {
//                            HStack {
//                                Image(systemName: "photo")
//                                    .font(.system(size: 20))
//
//                                Text("Photo library")
//                                    .font(.headline)
//                            }
//                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 50)
//                            .background(Color.blue)
//                            .foregroundColor(.white)
//                            .cornerRadius(20)
//                            .padding(.horizontal)
//                        }
                        
                                .actionSheet(isPresented: $showingSheet) {
                                    ActionSheet(
                                        title: Text("What do you want to do?"),
                                        message: Text("There's only one choice..."),
                                        buttons: [.default(Text("Camera"), action: {
                                            self.showCameraPicker.toggle()
                                            activeSheet = .first
                                        }), .default(Text("Gallery"), action: {
                                            self.showImagePicker.toggle()
                                            activeSheet = .second
                                            }), .destructive(Text("Cancel"), action: {
                                                print("Default tapped")
                                                })]
                                    )
                                }

                       
                    }.navigationBarTitle("NEW EVENT")
//                    .navigationBarTitleDisplayMode(.inline)
//                    .toolbar {
//                        ToolbarItem(placement: .navigationBarTrailing) {
//                            Button("Post") {
//                                print("Help tapped!")
//
//                                geteventPost(eventTitle: eventTitle, eventType: eventType, startDate: formattedDateTimeFromString(dateString: selectedDateStart, withFormat: "yy-MM-dd")!, startTime: formattedTimeFromString(dateString: selectedTimeStart, withFormat: "HH:mm:ss")!, endDate: formattedDateTimeFromString(dateString: selectedDateEnd, withFormat: "yy-MM-dd")!, endTime: formattedTimeFromString(dateString: selectedTimeEnd, withFormat: "HH:mm:ss")!, timeZone: TimeZone.current.identifier, location: self.locationManager.placemark!, addLink: eventLink, aboutEvent: aboutEvent, eventCategory: "eye", fee: eventFee, symbol: currency, attendee: eventAttendee, language: language, acceptParticipaient: "2", allowComment: comment, image: imgData!)
//                                print("image", imgData!)
//                            }
//                        }
//                    }
//                    .padding()
                    
                    .navigationBarItems(trailing:
                                   Button(action: {
                                       print("Edit button pressed...")
                                    geteventPost(eventTitle: eventTitle, eventType: eventType, startDate: formattedDateTimeFromString(dateString: selectedDateStart, withFormat: "yy-MM-dd")!, startTime: formattedTimeFromString(dateString: selectedTimeStart, withFormat: "HH:mm:ss")!, endDate: formattedDateTimeFromString(dateString: selectedDateEnd, withFormat: "yy-MM-dd")!, endTime: formattedTimeFromString(dateString: selectedTimeEnd, withFormat: "HH:mm:ss")!, timeZone: TimeZone.current.identifier, location: self.locationManager.placemark!, addLink: eventLink, aboutEvent: aboutEvent, eventCategory: "eye", fee: eventFee, symbol: currency, attendee: eventAttendee, language: language, acceptParticipaient: "2", allowComment: comment, image: imgData!)
    //                                print("image", imgData!)
                                    
                                   }) {
                                       Text("Post")
                                   })
                    
                }
        VStack(alignment:.leading){
            Text("Event Title").bold().padding()
            ZStack(alignment: .leading) {
                if eventTitle.isEmpty{
                    Text("Event Title").foregroundColor(.gray)
                        .padding(.bottom, 10)
                        .padding(.leading, 10)
                }
          
            TextField("", text: $eventTitle)
                .padding(10)
                .foregroundColor(Color.black)
//                .frame(width:250.0, height: 40.0)
                .font(Font.system(size: 15, weight: .medium, design: .serif))
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)), lineWidth: 2))
                .padding(.bottom,10)
            }.padding(10)
            
           
            Text("Event Type").bold().padding(.leading)
            ZStack(alignment: .leading) {
                if eventType.isEmpty{
                    Text("").foregroundColor(.gray)
                        .padding(.bottom, 10)
                        .padding(.leading, 10)
                }
          
            TextField("Event Type", text: $eventType)
                .padding(10)
                .foregroundColor(Color.black)
//                .frame(width:250.0, height: 40.0)
                .font(Font.system(size: 15, weight: .medium, design: .serif))
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)), lineWidth: 2))
                .padding(.bottom,10)
        }.padding(10)
            .simultaneousGesture(TapGesture().onEnded{
                showingSheetEvent = true
                })
            .actionSheet(isPresented: $showingSheetEvent) {
                    ActionSheet(
                        title: Text("Select event type"),
//                        message: Text("There's only one choice..."),
                        buttons: [.default(Text("Local event"), action: {
                            eventType = "Local event"
                        }), .default(Text("Online event"), action: {
                            eventType = "Online event"
                            }), .destructive(Text("Cancel"), action: {
                                print("Default tapped")
                                })]
                    )
                }
            
            
            HStack(){
            Text("Start").bold().padding(.leading)
                .padding(.trailing,160)
            Text("End").bold().padding(.leading)
            }
            VStack(){
                
            HStack(){
           
                DatePicker("", selection: $selectedDateStart, displayedComponents: .date)
                    .fixedSize().frame(maxWidth: .infinity, alignment: .leading)
//                let stringA = formattedDateTimeFromString(dateString: selectedDateStart, withFormat: "yy-MM-dd")!
             
                Spacer()
                
               
                DatePicker("", selection: $selectedDateEnd, displayedComponents: .date)
                        .fixedSize().frame(maxWidth: .infinity, alignment: .trailing)
            }
                
                
                HStack(){
               
                    DatePicker("", selection: $selectedTimeStart, displayedComponents: .hourAndMinute)
                        .fixedSize().frame(maxWidth: .infinity, alignment: .leading)
                    Spacer()
                    
                    
                    DatePicker("", selection: $selectedTimeEnd, displayedComponents: .hourAndMinute)
                        .fixedSize().frame(maxWidth: .infinity, alignment: .trailing)
                    
                    
                }
               
            }
            
            Group{
            Text("Timezone").bold().padding(.leading)
            ZStack(alignment: .leading) {
//                let tz = utcToLocal()
//                let _ = print("timeZone1", tz)
                ZStack(){
    
                    TextField("TimeZone", text: timeZoneBinding)
                        .padding(10)
                        .foregroundColor(Color.black)
        //                .frame(width:250.0, height: 40.0)
                        .font(Font.system(size: 15, weight: .medium, design: .serif))
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)), lineWidth: 2))
                        .padding(.bottom,10)
                }
           
            }.padding(10)
            
               
            
            
            Text("Location").bold().padding(.leading)
            ZStack(alignment: .leading) {
                TextField("Location", text: textBinding)
//                TextField("Location", text: $place)
                .padding(10)
                .foregroundColor(Color.black)
//                .frame(width:250.0, height: 40.0)
                .font(Font.system(size: 15, weight: .medium, design: .serif))
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)), lineWidth: 2))
                .padding(.bottom,10)
            }.padding(10)
            
            
            
            Text("Add link to event").bold().padding(.leading)
            ZStack(alignment: .leading) {
                
                if eventLink.isEmpty{
                    Text("").foregroundColor(.gray)
                        .padding(.bottom, 10)
                        .padding(.leading, 10)
                }
          
            TextField("Add link to event", text: $eventLink)
                .padding(10)
                .foregroundColor(Color.black)
//                .frame(width:250.0, height: 40.0)
                .font(Font.system(size: 15, weight: .medium, design: .serif))
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)), lineWidth: 2))
                .padding(.bottom,10)
            }.padding(10)
                

                Text("About the event").bold().padding(.leading)
                ZStack(alignment: .leading){
                    
                   
               
                TextEditor(text: $aboutEvent)
               .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)), lineWidth: 2))
                    
                    if aboutEvent.isEmpty {
                           Text(placeholder)
                            .foregroundColor(.gray)
                            .padding(.all, 30)
                            
                    }
                Text(aboutEvent).opacity(0).padding(.all, 8)
                
                  
                }.padding(10)
                
                
                Text("Event categories").bold().padding(.leading)
                ZStack(alignment: .leading) {
                    

                    if eventCategory.isEmpty{
                        Text("").foregroundColor(.gray)
                            .padding(.bottom, 10)
                            .padding(.leading, 10)
                    }
              
                    TextField("Event categories", text: $eventCategory)
                        .onTapGesture {
                            self.showPopUp = true
                        }
                    .padding(10)
                    .foregroundColor(Color.black)
                    .font(Font.system(size: 15, weight: .medium, design: .serif))
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)), lineWidth: 2))
                    .padding(.bottom,10)
                    
                    
                    ZStack(){
                        if $showPopUp.wrappedValue {
                            ZStack(alignment:.center) {
                                Color.white
                                VStack (alignment:.center){
                                    Text("Select Events").bold()
                                    Spacer()
                                   
                                    ScrollView(){
                                       
                                        VStack(){
                                         
                                            HStack(){
                                                if $eventCategoryModel.woofUrl.wrappedValue != false{
                                                List(eventCategoryModel.data, id: \.self){ data in
                                                    Text(data.category_name!)
                                                    Spacer()
                                                    CheckboxFieldView(catName: data.category_name!)
                                                }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 400, maxHeight: 400)
                                              
                                           
                                        }
                                            }
                                       
                                        }.padding()
                                    }.onAppear(perform: eventCategoryApi)
                                   
                                    Button(action: {
                                        self.showPopUp = false
                                    }, label: {
                                        Text("Close").padding()
                                    })
                                }.padding()
                            }
                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 400, maxHeight: 400)
                            .cornerRadius(20).shadow(radius: 20)
                            
                        }
                    }
                    
                    
                }.padding(10)
                
                
            }
            
            
            HStack(){
            Text("Fee").bold()
            ZStack(alignment: .leading) {
                
                if eventFee.isEmpty{
                    Text("0").foregroundColor(.gray)
//                        .padding(.bottom, 10)
                        .padding(.leading, 10)
                }
          
            TextField("", text: $eventFee)
                .padding(10)
                .foregroundColor(Color.black)
                .font(Font.system(size: 15, weight: .medium, design: .serif))
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)), lineWidth: 2))
//                .padding(.bottom,10)
            }.padding(10)
                
                ZStack(alignment: .leading) {
                if currency.isEmpty{
                    Text("$").foregroundColor(.gray)
//                        .padding(.bottom, 10)
                        .padding(.leading, 10)
                }
          
            TextField("", text: $currency)
                .padding(10)
                .foregroundColor(Color.black)
                .font(Font.system(size: 15, weight: .medium, design: .serif))
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)), lineWidth: 2))
                
                }.onTapGesture {
                    currencyList = true
                }
            }.padding(10)
            
            
            ZStack(){
                if $currencyList.wrappedValue {
                    ZStack(alignment:.center) {
                        Color.white
                        VStack (alignment:.center){
                            Text("Select Currency").bold()
                            Spacer()
                           
                            ScrollView(){
                               
                                VStack(){
                                 
                                    HStack(){
                                        if $eventCurrencyModel.woofUrl.wrappedValue != false{
                                        List(eventCurrencyModel.data, id: \.self){ data in
                                            let curName = data.currency! + ", " +  data.code!
                                            Text(curName)
                                                .onTapGesture {
                                                    currency = data.symbol!
                                                    currencyList = false
                                                }
                                            Spacer()
                                        }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 400, maxHeight: .infinity)
                                      
                                   
                                }
                                    }
                               
                                }.padding()
                            }.onAppear(perform: eventCurrencyApi)
                           
                            Button(action: {
                                self.showPopUp = false
                            }, label: {
                                Text("Close").padding()
                            })
                        }.padding()
                    }
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 400, maxHeight: 400)
                    .cornerRadius(20).shadow(radius: 20)
                    
                }
            }
            
            
        
            Group{
            Text("Max. number of attendees").bold().padding(.leading)
            ZStack(alignment: .leading) {
                
                if eventAttendee.isEmpty{
                    Text("").foregroundColor(.gray)
                        .padding(.bottom, 10)
                        .padding(.leading, 10)
                }
          
            TextField("Add", text: $eventAttendee)
                .padding(10)
                .foregroundColor(Color.black)
                .font(Font.system(size: 15, weight: .medium, design: .serif))
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)), lineWidth: 2))
                .padding(.bottom,10)
            }.padding(10)
            
              
                
            Text("Language the event is hosted in").bold().padding(.leading)
            ZStack(alignment: .leading) {
//                if $eventLanguageModel.woofUrl.wrappedValue != false{
                if language.isEmpty{
                    Text("").foregroundColor(.gray)
                        .padding(.bottom, 10)
                        .padding(.leading, 10)
                }
          
            TextField("Afar", text: $language)
                .padding(10)
                .foregroundColor(Color.black)
                .font(Font.system(size: 15, weight: .medium, design: .serif))
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)), lineWidth: 2))
                .padding(.bottom,10)
                .onTapGesture {
                    languageList = true
                }
                
            }.padding(10)

                Toggle("Want to accept participants?", isOn: $participaients)
//                    .toggleStyle(SwitchToggleStyle(tint: .orange))
                   
                           if participaients {
//                               Text("Hello World!")
                           
                            
                           }
                
                Toggle("Allow comments", isOn: $comment)
//                    .toggleStyle(SwitchToggleStyle(tint: .orange))
                           if comment {
//                               Text("Hello World!")
                           
                           }
                Divider().padding()
                HStack(){
                    Button("Preview") {
                                  
                               }.foregroundColor(Color("backColor"))
                    Spacer()
                    Button("Delete") {
                                  
                    }.foregroundColor(Color("backColor"))
                }
                
            }
        
        }.padding()
            
            
           

        } .sheet(item: $activeSheet) { item in
            switch item {
            case .first:
                ImagePicker(sourceType: .camera) { image in
                self.image = Image(uiImage: image)
                    self.image1 = image
                    self.imgData = image.pngData()
                    
                }
            case .second:
                ImagePicker(sourceType: .photoLibrary) { image in
                    self.image = Image(uiImage: image)
                    self.image1 = image
                    self.imgData = image.pngData()
            }
        }
    }
                
        
        
//        .sheet(isPresented: $showImagePicker) {
//            ImagePicker(sourceType: .photoLibrary) { image in
//                self.image = Image(uiImage: image)
//            }
//        }
//        .sheet(isPresented: $showCameraPicker) {
//            ImagePicker(sourceType: .camera) { image in
//                self.image = Image(uiImage: image)
//            }
//        }
        
      
        if $languageList.wrappedValue != false{
           
            ZStack(alignment:.top){
                Rectangle()
                .fill(Color.white)
                .opacity(0.5)
            ScrollView(){

                        if $eventLanguageModel.woofUrl.wrappedValue != false{
                        ForEach(eventLanguageModel.data, id: \.self){ data in
                            Text(data.name!).padding()
                                .onTapGesture {
                                    language = data.name!
                                    languageList = false
                                }

                        }
                }
              

            }
            }.onAppear(perform: geteventLanguage)
            .frame(width:400, height:300)
            .cornerRadius(10)
            .shadow(color: .gray, radius: 10)
        }
     
       
    }
    
    
    func eventCategoryApi(){
        eventCategoryModel.getEventCategoryData()
    }
    
    func geteventLanguage(){
        eventLanguageModel.getEventLanguageData()
    }
    
    func geteventPost(eventTitle: String, eventType:String, startDate: String, startTime: String, endDate: String, endTime: String, timeZone: String, location: String, addLink: String, aboutEvent: String, eventCategory: String, fee: String, symbol: String, attendee: String, language: String, acceptParticipaient: String, allowComment: Bool, image: Data){
       
        let eventTitle = eventTitle
        let eventType = eventType
        let startDate = startDate
        let startTime = startTime
        let endDate = endDate
        let endTime = endTime
        let timeZone = timeZone
        let location = location
        let eventLink = addLink
        let aboutEvent = aboutEvent
        let eventCategory = eventCategory
        let fee = fee
        let symbol = symbol
        let attendee = attendee
        let language = language
        let acceptParticipaient = acceptParticipaient
        let allowComment = allowComment
        let image = image
        
        
//        print("image", image)
       
        eventPostModel.getEventPostData(eventTitle: eventTitle, eventType: eventType, startDate: startDate, startTime: startTime, endDate: endDate, endTime: endTime, timeZone: timeZone, location: location, addLink: eventLink, aboutEvent: aboutEvent, eventCategory: "eye", fee: fee, symbol: symbol, attendee: attendee, language: language, acceptParticipaient: "2", allowComment: allowComment, image: image)
    }
    
    func eventCurrencyApi(){
        eventCurrencyModel.getEventCurrencyData()
    }
    
    
    func formattedDateTimeFromString(dateString: Date, withFormat format: String) -> String? {

        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "yyyy-MM-dd"
        
          let outputFormatter = DateFormatter()
          outputFormatter.dateFormat = format
        return outputFormatter.string(from: dateString)

    }
    
    func formattedTimeFromString(dateString: Date, withFormat format: String) -> String? {

        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "HH:mm:ss"
        
          let outputFormatter = DateFormatter()
          outputFormatter.dateFormat = format
        return outputFormatter.string(from: dateString)

    }

}

struct CheckboxFieldView : View {
    var catName:String
    @State var checkState:Bool = false
     @State var catNameArr:[String] = []
    var aa = ""
    var body: some View {

         Button(action:
            {
                //1. Save state
                self.checkState = !self.checkState
                if self.checkState {
                    catNameArr.append(catName)
//                    catNameArr.insert(contentsOf:catName, at: 0)
                    
                  
                    print("State : \(catNameArr)")
                }else{
                    
//                    catNameArr = catNameArr.filter { $0 !== catName }
                    if let index = catNameArr.firstIndex(of: catName) {
                        catNameArr.remove(at: index)
                        print("State : \(catNameArr)")

                    }
//                    eventCategory = "\(catNameArr)"
                }
               
                    

        }) {
            VStack(alignment: .center){
            HStack(alignment: .top) {

            //2. Will update according to state
                Image(checkState ? "checkbox-on" :  "checkbox-off")
                .renderingMode(.original)
                .resizable()
                .frame(width: 30.0, height: 30.0)
//                .background(Color.blue)
//                   Text("Todo  item ")

                }
            } .foregroundColor(Color.red)
        }
       
    }

}

struct EventLanguagePopUp:View{
    @Binding var languageList:Bool
    var body: some View{
        ZStack{
              Rectangle()
              .fill(Color.gray)
              .opacity(0.5)
          
            Button(action:{
                languageList.toggle()
            }){
                Image("close").resizable().frame(width: 25, height: 25)
            }  .position(x: 30, y: 200)
          
              VStack {
               
                  Spacer()
               
                  HStack {
                      VStack(spacing: 20) {
                          Text("I'd like to join!").fontWeight(.bold).padding(.all, 20)
                      
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
//        .onTapGesture {
//              self.displayItem = -1
//          }
        }
}


//struct EventPostView_Previews: PreviewProvider {
//    static var previews: some View {
//        EventPostView(imgData: Data)
//        
//    }
//}
