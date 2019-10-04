//
//  ContentView.swift
//  MVVMProgrammingWithObservableObject
//
//  Created by ramil on 04/10/2019.
//  Copyright © 2019 com.ri. All rights reserved.
//

import SwiftUI

let apiUrl = "https://api.letsbuildthatapp.com/static/courses.json"

class CourcesViewModel: ObservableObject {
    @Published var message = "Message inside observable object"
}

struct ContentView: View {
    
    @ObservedObject var courcesVM = CourcesViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                Text(courcesVM.message)
            }.navigationBarTitle("Courses")
                .navigationBarItems(trailing: Button(action: {
                    print("Fetching json data")
                    
                    self.courcesVM.message = "SOMETHING ELSE"
                    
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
