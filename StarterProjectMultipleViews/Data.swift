//
//  Struct.swift
//  StarterProjectMultipleViews
//
//  Created by Brian Ma on 11/3/2026.
//



import Foundation

//struct for each department
//Teacher is a struct, thus this struct holds a sub-struct
//Codable allows Encodable and Decodable for the data type to match any to conform to the constrains
struct Department: Codable{
    let departmentIcon: String
    let departmentName: String
    let departmentTeacher: [Teacher]
}

//struct for teachers
struct Teacher: Codable {
    var teacherName: String
    var teacherContact: String
    var teacherRole: String
    var teacherProfileURL: String
    var teacherBackgroundURL: String
    var teacherStory: String
    var teacherInterest: String
    var teacherSkills: String
    var teacherExperiences: String
    var isUpperSchoolTeacher: Bool
    var teacherPassword: String
}
