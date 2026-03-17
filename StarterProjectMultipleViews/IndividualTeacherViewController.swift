//
//  IndividualTeacherViewController.swift
//  StarterProjectMultipleViews
//
//  Created by Brian Ma on 17/3/2026.
//

import UIKit

class IndividualTeacherViewController: UIViewController {

    @IBOutlet weak var teacherProfile: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var roleLabel: UILabel!
    @IBOutlet weak var contactLabel: UILabel!
    @IBOutlet weak var interestLabel: UILabel!
    @IBOutlet weak var skillsLabel: UILabel!
    @IBOutlet weak var experiencesLabel: UILabel!
    @IBOutlet weak var storyLabel: UILabel!
    
    var selectedTeacher: Teacher?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if selectedTeacher != nil {
            nameLabel.text = selectedTeacher?.teacherName
            roleLabel.text = selectedTeacher?.teacherRole
            contactLabel.text = selectedTeacher?.teacherContact
            interestLabel.text = selectedTeacher?.teacherInterest
            skillsLabel.text = selectedTeacher?.teacherSkills
            experiencesLabel.text = selectedTeacher?.teacherExperiences
            storyLabel.text = selectedTeacher?.teacherStory
            
            teacherProfile.image = UIImage(named: "profileImage")
            teacherProfile.layer.cornerRadius = teacherProfile.frame.size.height / 2
            
        }
    }

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

