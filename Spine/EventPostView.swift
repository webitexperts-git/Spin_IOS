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
    
//    @ObservedObject var lm = AddressLocation()
//    var placemark: String { return("\(String(describing: lm.placemark?.locality))") }
    
    @State private var placeholder = "Who should join, and why? What will you do at your event? (minimum 50 characters)"
    @State private var showGreeting = true
    @State var showImagePicker: Bool = false
    @State var showCameraPicker: Bool = false
    @State var image: Image? = nil
    
    @State var selectedDateStart = Date()
    @State var selectedDateEnd = Date()
    @State var selectedTimeStart = Date()
    @State var selectedTimeEnd = Date()
    
    @State private var showPopUp = false
    
    @ObservedObject var locationManager = LocationManager()
    
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
    
    
    @State private var showingSheet = false
    
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
                            Text("Add Photo").foregroundColor(.white).font(.subheadline).padding(.top,80)
                            Image("camera")
                        }
                        Button("Add Photo") {
                                    showingSheet = true
                                }
                                .actionSheet(isPresented: $showingSheet) {
                                    ActionSheet(
                                        title: Text("What do you want to do?"),
                                        message: Text("There's only one choice..."),
                                        buttons: [.default(Text("Camera"), action: {
                                            self.showCameraPicker.toggle()
                                        }), .default(Text("Gallery"), action: {
                                            self.showImagePicker.toggle()
                                            }), .destructive(Text("Cancel"), action: {
                                                print("Default tapped")
                                                })]
                                    )
                                }
//                        Button(action: {
//                            self.showImagePicker.toggle()
//                            print("Button Tapped")
//
//                        }) {
                            
                          
                           
                            
//                        }
                       
                    }.navigationBarTitle("NEW EVENT")
                    .navigationBarTitleDisplayMode(.inline)
                    .padding()
                    
                    .sheet(isPresented: $showImagePicker) {
                                    ImagePicker(sourceType: .photoLibrary) { image in
                                        self.image = Image(uiImage: image)
                                    }
                                }
                    .sheet(isPresented: $showCameraPicker) {
                                    ImagePicker(sourceType: .camera) { image in
                                        self.image = Image(uiImage: image)
                                    }
                                }
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
            HStack(){
            Text("Start").bold().padding(.leading)
                .padding(.trailing,160)
            Text("End").bold().padding(.leading)
            }
            VStack(){
                
//                VStack {
//                        DatePicker("", selection: $selectedDateStart, displayedComponents: .date)
//                    Text("\(selectedDateStart)").multilineTextAlignment(.center).lineLimit(nil)
//                    let _ = print("wwww", selectedDateStart)
//                       }
//                Text("latitude: \(userLatitude)")
//                Text("longitude: \(userLongitude)")
                
            HStack(){
           
                DatePicker("", selection: $selectedDateStart, displayedComponents: .date)
                    .fixedSize().frame(maxWidth: .infinity, alignment: .leading)
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
            TextField("Timezone", text: $name)
                .padding(10)
                .foregroundColor(Color.black)
//                .frame(width:250.0, height: 40.0)
                .font(Font.system(size: 15, weight: .medium, design: .serif))
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)), lineWidth: 2))
                .padding(.bottom,10)
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
                                            Text("Alternative pain treatment")
                                            Spacer()
                                            CheckboxFieldView()
                                        }
                                        HStack(){
                                            Text("Alternative pain treatment")
                                            Spacer()
                                            CheckboxFieldView()
                                        }
//                                        HStack(){
//                                            Text("Alternative pain treatment")
//                                            Spacer()
//                                            CheckboxFieldView()
//                                        }
                                       
//                                        Text("Alternative pain treatment")
//                                        Text("Alternative pain treatment")
                                        }.padding()
                                    }
                                   
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
                if eventCurrency.isEmpty{
                    Text("$").foregroundColor(.gray)
//                        .padding(.bottom, 10)
                        .padding(.leading, 10)
                }
          
            TextField("", text: $eventCurrency)
                .padding(10)
                .foregroundColor(Color.black)
                .font(Font.system(size: 15, weight: .medium, design: .serif))
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)), lineWidth: 2))
                
            }
            }.padding(10)
        
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
                
                if eventLanguage.isEmpty{
                    Text("").foregroundColor(.gray)
                        .padding(.bottom, 10)
                        .padding(.leading, 10)
                }
          
            TextField("Afar", text: $eventLanguage)
                .padding(10)
                .foregroundColor(Color.black)
                .font(Font.system(size: 15, weight: .medium, design: .serif))
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)), lineWidth: 2))
                .padding(.bottom,10)
            }.padding(10)
                
                
                
                Toggle("Want to accept participants?", isOn: $showGreeting)
                    .toggleStyle(SwitchToggleStyle(tint: .orange))

                           if showGreeting {
//                               Text("Hello World!")
                           }
                
                Toggle("Allow comments", isOn: $showGreeting)
                    .toggleStyle(SwitchToggleStyle(tint: .orange))
                           if showGreeting {
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

        }
    }
    
    func timezone(){
        for timeZone in TimeZone.knownTimeZoneIdentifiers {
            print("timeZone",timeZone)
        }
    }
}

struct CheckboxFieldView : View {

    @State var checkState:Bool = false

    var body: some View {

         Button(action:
            {
                //1. Save state
                self.checkState = !self.checkState
                print("State : \(self.checkState)")


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



struct EventPostView_Previews: PreviewProvider {
    static var previews: some View {
        EventPostView()
        
    }
}
