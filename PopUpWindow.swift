//
//  PopUpWindow.swift
//  Lab2
//
//  Created by Яна Страшок on 13.04.2022.
//

import SwiftUI

extension NumberFormatter {
    static var number: NumberFormatter {
        let number = NumberFormatter()
        number.numberStyle = .none
        return number
    }
}

func StringToNumber (_ array: Array<String>) -> Array<Int> {
    var newArray = Array<Int>(repeating: 0, count: array.count)
    for index in 0..<newArray.count {
        newArray[index] = Int(array[index])!
    }
    return newArray
}

struct PopUpWindow: View {
    @ObservedObject var VM: StudentListVM
    @Binding var show: Bool
    @State var text1 = ""
    @State var text2 = Date()
    @State var text3 = Date()
    @State var array = Array<String>(repeating: "", count: 3)
    
    var formatter = NumberFormatter()
    var body: some View {
        ZStack{
            if show{
                Color.black.opacity(show ? 0.3 : 0).edgesIgnoringSafeArea(.all)
                VStack (alignment: .center){
                    Form{
                        TextField(
                            "Name ",
                            text: $text1
                        ).disableAutocorrection(true)
                        DatePicker(
                            "Birth Date",
                            selection: $text2,
                            displayedComponents: [.date]
                        )
                        DatePicker(
                            "Enrollment Date",
                            selection: $text3,
                            displayedComponents: [.date]
                        )
                        Section(header: Text("Grades")){
                            TextField(
                                "Linear algebra",
                                text: $array[0]
                            )
                            TextField(
                                "Calculus",
                                text: $array[1]
                            )
                            TextField(
                                "Statistics",
                                text: $array[2]
                            )
                        }
                    }
                    Spacer()
                    HStack{
                        Button(action: exit) {
                            Text("Cancel").font(.title)
                        }
                        Spacer()
                        Button(action: {
                            VM.addStudent(name: text1, birthDate: text2, enrollmentDate: text3, grades: StringToNumber(array))
                            exit()
                        }, label: {
                            Text("Submit").font(.title)
                        })
                    }.padding(.horizontal)
                }
            }
        }
    }
    func exit (){
        text1 = ""
        text2 = Date()
        text3 = Date()
        array = Array<String>(repeating: "", count: 3)
        show = false
    }
}
