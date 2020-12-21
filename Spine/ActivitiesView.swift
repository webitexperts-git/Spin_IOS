//
//  ActivitiesView.swift
//  Spine
//
//  Created by apple on 17/12/20.
//

import SwiftUI

struct ActivitiesView: View {
    @State private var selectedSport = 0
    private let triathlonSports = ["FOR YOU", "FOLLOWING"]
    var body: some View {
        VStack(){
        Picker(selection: $selectedSport, label: Text("Select a Sport")) {
         ForEach(0 ..< triathlonSports.count) {
                Text(self.triathlonSports[$0])
                }
           
            }.pickerStyle(SegmentedPickerStyle())
            Spacer()
        }
       
    }
  
}

struct ActivitiesView_Previews: PreviewProvider {
    static var previews: some View {
        ActivitiesView()
    }
}
