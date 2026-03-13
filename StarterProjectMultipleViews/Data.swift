//
//  Struct.swift
//  StarterProjectMultipleViews
//
//  Created by Brian Ma on 11/3/2026.
//



import Foundation

struct Teacher {
    var teacherName: String
    var teacherContact: String
    var teacherRole: String
    var teacherProfileURL: String
    var teacherBackgroundURL: String
    var teahcerStory: String
    var teacherInterest: String
    var teacherSkills: String
    var teacherExperiences: String
    var isUpperSchoolTeacher: Bool


}

struct Department{
    let departmentIcon: String
    let departmentName: String
    let departmentTeacher: [Teacher]
}
