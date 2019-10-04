//
//  ContentView.swift
//  MVVMProgrammingWithObservableObject
//
//  Created by ramil on 04/10/2019.
//  Copyright © 2019 com.ri. All rights reserved.
//

import SwiftUI

let apiUrl = "https://api.letsbuildthatapp.com/static/courses.json"

struct Course: Identifiable, Decodable {
    let id = UUID()
    let name: String
}

class CourcesViewModel: ObservableObject {
    @Published var message = "Message inside observable object"
    @Published var courses: [Course] = [
        .init(name: "Cource 1"),
        .init(name: "Cource 2"),
        .init(name: "Cource 3")
    ]
    
    func changeMessage() {
        self.message = "BLAH  BLAH"
    }
    
    func fetchCourses() {
        // fetch json and decode and update some array property
        guard let url = URL(string: apiUrl) else { return }
        URLSession.shared.dataTask(with: url) { (data , resp, err) in
            // make sure to check error / resp
            
            DispatchQueue.main.async {
                
            
                 self.courses = try! JSONDecoder().decode([Course].self, from: data!)
            }
        }.resume()
    }
}

struct ContentView: View {
    
    @ObservedObject var courcesVM = CourcesViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                Text(courcesVM.message)
                
                ForEach(courcesVM.courses) { course in
                    Text(course.name)
                }
                
            }.navigationBarTitle("Courses")
                .navigationBarItems(trailing: Button(action: {
                    print("Fetching json data")
                    
                    self.courcesVM.fetchCourses()
                    
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
