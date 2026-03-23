//
//  IndividualTeacherViewController.swift
//  StarterProjectMultipleViews
//
//  Created by Brian Ma on 17/3/2026.
//

import UIKit

class IndividualTeacherViewController: UIViewController {

    @IBOutlet weak var teacherBackground: UIImageView!
    @IBOutlet weak var teacherProfile: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var roleLabel: UILabel!
    @IBOutlet weak var contactLabel: UILabel!
    @IBOutlet weak var interestLabel: UILabel!
    @IBOutlet weak var skillsLabel: UILabel!
    @IBOutlet weak var experiencesLabel: UILabel!
    @IBOutlet weak var storyLabel: UILabel!
    
    @IBAction func editButton(_ sender: UIButton) {
        let verification = UIAlertController(title: "Enter Password", message: nil, preferredStyle: .alert)
        verification.addTextField{ field in
            field.placeholder = "Password"
            field.isSecureTextEntry = true
        }
        
        let confirm = UIAlertAction(title: "Confirm", style: .default){ _ in
            if verification.textFields?.first?.text == "1991"{
                self.performSegue(withIdentifier: "toEditProfile", sender: self)
            } else{
                print("oops, incorrect")
            }
        }
        
        verification.addAction(confirm)
        verification.addAction(UIAlertAction(title: "cancel", style: .cancel))
        
        present(verification, animated: true)
    }
    
    
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
            
            //defaults for place holder
            teacherProfile.image = UIImage(named: "profileImage")
            teacherBackground.image = UIImage(named: "backgroundImage")
            
            //consistant with prev VC
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

