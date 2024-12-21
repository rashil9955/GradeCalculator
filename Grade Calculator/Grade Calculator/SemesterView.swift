//
//  SemesterView.swift
//  Grade Calculator
//
//  Created by Rashil Shibakoti on 12/21/24.
//

import SwiftUI

struct SemesterView: View {
    @State private var semesters: [Semester] = []
    @State private var showSummary = false
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center) {
                // List of all semesters
                List {
                    ForEach(semesters) { semester in
                        VStack(alignment: .leading) {
                            Text("Semester \(semester.id.uuidString.prefix(4))")
                                .font(.headline)
                            Text("GPA: \(semester.gpa, specifier: "%.2f")")
                                .font(.subheadline)
                        }
                    }
                }
                
                // Navigation button to add a new semester
                NavigationLink(destination: AddSemesterView(onFinish: { newSemester in
                    semesters.append(newSemester)
                })) {
                    Text("Add Semester")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                        .padding(.horizontal)
                }
                
                // Done Button
                Button("Finish") {
                    showSummary = true
                }
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.green)
                .cornerRadius(10)
                .padding(.horizontal)
            }
            .navigationTitle("GPA CALCULATOR")
            .sheet(isPresented: $showSummary) {
                SummaryView(semesters: semesters)
            }
        }
    }
}


#Preview {
    SemesterView()
}

