//
//  AddSemesterView.swift
//  Grade Calculator
//
//  Created by Rashil Shibakoti on 12/21/24.
//

import SwiftUI

struct AddSemesterView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var courses: [Course] = []
    @State private var courseName: String = ""
    @State private var creditHours: String = ""
    @State private var grade: String = ""
    
    var onFinish: (Semester) -> Void
    
    var body: some View {
        VStack {
            // Table to display courses
            List {
                ForEach(courses) { course in
                    HStack {
                        Text(course.name)
                        Spacer()
                        Text("\(course.creditHours, specifier: "%.1f") credits")
                        Spacer()
                        Text(course.grade)
                    }
                }
            }
            
            // Input fields
            VStack {
                TextField("Course Name", text: $courseName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("Credit Hours", text: $creditHours)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.decimalPad)
                TextField("Grade (A, B, C, D, F)", text: $grade)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            .padding()
            
            // Add Course Button
            Button("Add Course") {
                if let credits = Double(creditHours), !courseName.isEmpty, !grade.isEmpty {
                    let newCourse = Course(name: courseName, creditHours: credits, grade: grade)
                    courses.append(newCourse)
                    courseName = ""
                    creditHours = ""
                    grade = ""
                }
            }
            .buttonStyle(.borderedProminent)
            .padding()
            
            // Done Button to finish semester
            Button("Done") {
                let newSemester = Semester(courses: courses)
                onFinish(newSemester)
                presentationMode.wrappedValue.dismiss()
            }
            .buttonStyle(.borderedProminent)
            .padding()
        }
        .navigationTitle("Add Semester")
    }
}


#Preview {
    AddSemesterView(onFinish: { _ in })
}
