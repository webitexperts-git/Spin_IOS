//
//  ButtonsView.swift
//  Spine
//
//  Created by Aashita Tyagi on 01/04/21.
//

import Foundation
import SwiftUI
import Combine


struct ButtonsView: View {
    @State private var searchText = ""
    @State private var showCancelButton: Bool = false
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
            
            VStack(alignment:.leading){
            HStack() {
              
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
                        }.padding(.horizontal)
            .navigationBarHidden(showCancelButton)
                    
                       
            
            
           
                ScrollView(.horizontal){
            HStack(spacing: 10){
               
                Button(action:{
                   
                    self.didTap = true
                    self.didTap1 = false
                    self.didTap2 = false
                    self.didTap3 = false
                    self.didTap4 = false
                    self.didTap5 = false
                    self.didTap6 = false
//                    allEventViewModel.event = "all"
                   
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
                
            }.frame(height: 80)

                }
                Spacer()
                if didTap == true{
                    ScrollView(){
                    VStack(alignment: .leading) {
                      
                        if($allEventViewModel.woofUrl.wrappedValue != false){
                        
                            ForEach(allEventViewModel.data, id: \.self){ data in
                               
                                EventRow(event: data)
                             
                                    }
                           
                                }

                        Spacer()
                    }
                    }
                    .onAppear(perform: getAllEventData)
//                    .navigationBarHidden(false)
                           
                          
                         
                }else if didTap1 == true{
                    ScrollView(){
                  NearbyEventView()
                    }
                }else if didTap2 == true{
                    ScrollView(){
                    OnlineEventView()
                    }
                }else if didTap3 == true{
                    ScrollView(){
                    FollowingEventView()
                    }
                }else if didTap4 == true{
                    ScrollView(){
                    GoingEventView()
                    }
                }else if didTap5 == true{
                    ScrollView(){
                    SavedEventView()
                    }
                }else if didTap6 == true{
                    ScrollView(){
                    PastEventView()
//                        }
                    }
                }
                
            }
       
        }.navigationBarHidden(true)

        
    }
    func getAllEventData(){
        allEventViewModel.getAllEventData(event:"all")
    }
        
    }
