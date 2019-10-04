//
//  ContentView.swift
//  MVVMProgrammingWithObservableObject
//
//  Created by ramil on 04/10/2019.
//  Copyright © 2019 com.ri. All rights reserved.
//

import SwiftUI

let apiUrl = "https://api.letsbuildthatapp.com/static/courses.json"

struct ContentView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                Text("Hello everyone from Youtube")
            }.navigationBarTitle("Courses")
                .navigationBarItems(trailing: Button(action: {
                    print("Fetching json data")
                }, label: {
                    Text("Fetch Cources")
                }))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
