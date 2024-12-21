//
//  SummaryView.swift
//  Grade Calculator
//
//  Created by Rashil Shibakoti on 12/21/24.
//

import SwiftUI

struct SummaryView: View {
    var semesters: [Semester]
    
    var body: some View {
        VStack {
            Text("Summary of Semesters")
                .font(.title)
                .padding()
            
            // List of semesters with GPAs
            List {
                ForEach(semesters) { semester in
                    VStack(alignment: .leading) {
                        Text("Semester \(semester.id.uuidString.prefix(4))")
                            .font(.headline)
                        ForEach(semester.courses) { course in
                            HStack {
                                Text(course.name)
                                Spacer()
                                Text("\(course.creditHours, specifier: "%.1f") credits")
                                Spacer()
                                Text(course.grade)
                            }
                        }
                        Text("GPA: \(semester.gpa, specifier: "%.2f")")
                            .font(.subheadline)
                            .padding(.top)
                    }
                }
            }
            
            // Overall GPA
            Text("Overall GPA: \(calculateOverallGPA(for: semesters), specifier: "%.2f")")
                .font(.headline)
                .padding()
        }
    }
    
    // Calculate overall GPA
    func calculateOverallGPA(for semesters: [Semester]) -> Double {
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
