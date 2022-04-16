//
//  StudentListVM.swift
//  Lab2
//
//  Created by Яна Страшок on 13.04.2022.
//

import Foundation

class StudentListVM: ObservableObject {
    static func createStudentList () ->StudentList{
        return StudentList()
    }
    
    let subjects = ["Linear Algebra", "Calculus", "Statistics"]
    
    var formatter: DateFormatter {
        let stringDate = DateFormatter()
        stringDate.dateFormat = "dd.MM.yyyy"
        return stringDate
    }
    
    
    @Published var model: StudentList = createStudentList()
    
    var list: Array<StudentList.Student>{
        return model.students
    }
    
    func addStudent(name: String, birthDate: Date, enrollmentDate: Date, grades: Array<Int>) {
        let student = StudentList.Student(name: name, birthDate: birthDate, enrolmentDate: enrollmentDate, grades: grades)
        model.addStudent(student)
    }
    
    func calculate(){
        model.target()
    }
}
