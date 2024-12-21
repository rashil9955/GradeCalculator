//
//  Models.swift
//  Grade Calculator
//
//  Created by Rashil Shibakoti on 12/21/24.
//


import SwiftUI
import Foundation

struct Course: Identifiable {
    let id = UUID()
    var name: String
    var creditHours: Double
    var grade: String
}




struct Semester: Identifiable {
    let id = UUID()
    var courses: [Course]
    var gpa: Double {
        calculateGPA(for: courses)
    }
}





func calculateGPA(for courses: [Course]) -> Double {
    var totalPoints = 0.0
    var totalCredits = 0.0
    
    for course in courses {
        let gradePoint = gradeToPoint(course.grade)
        totalPoints += gradePoint * course.creditHours
        totalCredits += course.creditHours
    }
    
    return totalCredits > 0 ? totalPoints / totalCredits : 0.0
}

func gradeToPoint(_ grade: String) -> Double {
    switch grade.uppercased() {
    case "A": return 4.0
    case "B": return 3.0
    case "C": return 2.0
    case "D": return 1.0
    default: return 0.0
    }
}


