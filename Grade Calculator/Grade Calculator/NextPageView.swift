//
//  NextPageView.swift
//  Grade Calculator
//
//  Created by Rashil Shibakoti on 12/21/24.
//

import SwiftUI

struct NextPageView: View {
    @State private var courses: [Course] = []
    @State private var semesters: [Semester] = []
    @State private var courseName: String = ""
    @State private var creditHours: String = ""
    @State private var grade: String = ""
    
    var body: some View {
        VStack {
            Text("GPA Calculator")
                .font(.title)
                .padding()
            
            // Table
            List {
                ForEach(courses) { course in
                    HStack {
                        Text(course.name)
                        Spacer()
                        Text("\(course.creditHours, specifier: "%.0f") credits")
                        Spacer()
                        Text(course.grade)
                    }
                }
            }
            
            // Input fields
            VStack(spacing: 15.0) {
                TextField("Course Name", text: $courseName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("Credit Hours", text: $creditHours)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.decimalPad)
                TextField("Grade (A, B, C, D, F)", text: $grade)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            .padding()
            
            // Add course button
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
            
            // GPA calculations
            VStack(alignment: .leading) {
                Text("GPA for this Semester: \(calculateGPA(for: courses), specifier: "%.2f")")
                Text("Overall GPA: \(calculateOverallGPA(), specifier: "%.2f")")
            }
            .padding()
            
            // Add semester button
            Button("Add Semester") {
                let newSemester = Semester(courses: courses)
                semesters.append(newSemester)
                courses.removeAll() // Clear the courses for the next semester
            }

            .buttonStyle(.borderedProminent)
            .padding()
        }
        .navigationTitle("Next Page")
    }
    
    
    
    // Calculate overall GPA
    func calculateOverallGPA() -> Double {
        var totalPoints = 0.0
        var totalCredits = 0.0
        
        for semester in semesters {
            for course in semester.courses {
                let gradePoint = gradeToPoint(course.grade)
                totalPoints += gradePoint * course.creditHours
                totalCredits += course.creditHours
            }
        }
        
        
        
        
        return totalCredits > 0 ? totalPoints / totalCredits : 0.0
    }
    
    
}


#Preview {
    NextPageView()
}
