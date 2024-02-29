//
//  main.swift
//  lab_3
//
//  Created by HAZY on 29.02.2024.
//

import Foundation


struct Student {
    let firstName: String
    let lastName: String
    var averageGrade: Double
}

class Journal {
    var students: [Student]

    init() {
        self.students = []
    }

    
    func addStudent(firstName: String, lastName: String, averageGrade: Double) {
        let newStudent = Student(firstName: firstName, lastName: lastName, averageGrade: averageGrade)
        students.append(newStudent)
    }

    
    func removeStudent(firstName: String, lastName: String) {
        students.removeAll { $0.firstName == firstName && $0.lastName == lastName }
    }

    
    func displayAllStudents() {
        for student in students {
            print("Name: \(student.firstName) \(student.lastName), GPA: \(student.averageGrade)")
        }
    }

    func listStudentsByGPA() -> [Student] {
        return students.sorted { $0.averageGrade > $1.averageGrade }
    }

    
    func averageScore() -> Double {
        let total = students.reduce(0.0) { $0 + $1.averageGrade }
        return total / Double(students.count)
    }

    
    func studentWithHighestGPA() -> Student? {
        return students.max(by: { $0.averageGrade < $1.averageGrade })
    }
}

//PRIMER
let journal = Journal()


journal.addStudent(firstName: "Khazbulat", lastName: "Yuniyev", averageGrade: 3.2)
journal.addStudent(firstName: "Bob", lastName: "Stroitel", averageGrade: 4.0)
journal.addStudent(firstName: "Barack", lastName: "Obama", averageGrade: 2.0)

journal.removeStudent(firstName: "Barack", lastName: "Obama")

journal.displayAllStudents()

let studentsByGPA = journal.listStudentsByGPA()
print("Students by GPA:")
for student in studentsByGPA {
    print("\(student.firstName) \(student.lastName), GPA: \(student.averageGrade)")
}

let averageScore = journal.averageScore()
print("Average score: \(averageScore)")

if let highestGPAStudent = journal.studentWithHighestGPA() {
    print("Student with highest GPA: \(highestGPAStudent.firstName) \(highestGPAStudent.lastName), GPA: \(highestGPAStudent.averageGrade)")
}

