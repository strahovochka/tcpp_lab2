//
//  ContentView.swift
//  Lab2
//
//  Created by Яна Страшок on 06.04.2022.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var VM: StudentListVM
    @State private var showPopUp = false
    
    var body: some View {
        ZStack{
            VStack{
                Text("Students")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                    .frame(width: 300.0, height: 50)
                    .padding(.horizontal)
                Button ("Show only excellent students"){
                    VM.calculate()
                }
                .padding()
                List{
                    ForEach(VM.list){ student in
                        VStack(alignment: .leading){
                            HStack{
                                Image(systemName: "person.crop.circle")
                                Text("\(student.name)").bold()
                            }
                            Text("Birth Date: \(VM.formatter.string(from: student.birthDate))")
                            Text("Enrollment Date: \(VM.formatter.string(from: student.enrolmentDate))")
                            Text(showArray(student.grades))
                        }
                    }
                    Button("Add a student") {
                        showPopUp.toggle()
                    }
                }
            }
            PopUpWindow(VM: VM, show: $showPopUp)
        }
    }
    
    func showArray(_ array: Array<Int>)->String{
        var value = "\(VM.subjects[0]): \(array[0])"
        for index in 1..<array.count {
            value += "\n\(VM.subjects[index]): \(array[index])"
        }
        return value
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let list = StudentListVM()
        Group {
            ContentView(VM: list)
        }
    }
}
