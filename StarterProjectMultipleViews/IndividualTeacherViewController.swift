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
    
    
    //alert triggered from the edit button
    //verification holds the presentation of the UI Alert to be titled as an alert, nil indicates that there could be nothing in the alert.
    @IBAction func editButton(_ sender: UIButton) {
        let verification = UIAlertController(title: "Verification", message: nil, preferredStyle: .alert)
        
        //adds text field1 to the alert
        verification.addTextField{ field in
            //Displays email address as default print
            field.placeholder = "Email Address"
        }
        
        //adds text field2 to the alert
        verification.addTextField{ field in
            //Displays password as default print
            field.placeholder = "Password"
            //secures the entered password into *** for privacy
            field.isSecureTextEntry = true
        }
        
        // {_ in performs the code within the {} only after the confirm button is pressed
        let confirm = UIAlertAction(title: "Confirm", style: .default){ _ in
            
            //creates the 'field' to hold the two text fields, if the count is not 2 then returns
            guard let fields = verification.textFields, fields.count == 2 else{
                return
            }
            
            //defines first item of the field as email
            let emailField = fields[0]
            //defines second item of the field as password
            let passwordField = fields[1]
            
            //            //can idnetify the password as selected teacher went through an indexPath in previous VC to know its order in the array
            //            emailField.text = self.selectedTeacher?.teacherContact
            //            passwordField.text = self.selectedTeacher?.teacherPassword
            
            //calls the fields as a .text and nils to return if the text is empty
            guard let emailFieldText = emailField.text, !emailFieldText.isEmpty,
                  let passwordFieldText = passwordField.text, !passwordFieldText.isEmpty else {
                return
            }
            
            //if else statement to check if the elements in the text field == the teacherContact/Password item in the array, else returns the action
            if emailField.text == self.selectedTeacher?.teacherContact, passwordField.text == self.selectedTeacher?.teacherPassword{
                //action performed by the UI Alert to segue to the next VC with idnetifier from itself triggered by the if statement
                self.performSegue(withIdentifier: "toEditProfile", sender: self)
                //if incorrect then return the alert
            } else{
                return
            }
            
        }
        
        //adds the confirm actiond defined above to the verification alert
        verification.addAction(confirm)
        //adds a default cancel action declared for UI Alerts
        verification.addAction(UIAlertAction(title: "cancel", style: .cancel))
        //pop up for the alert once button is clicked
        present(verification, animated: true)
    }
    
    //prepares for the next VC to catch the data when the segue is triggered
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //identifier of the segue to ensure it is going to the correct VC
        if segue.identifier == "toEditProfile" {
            
            //if the destination of the segue is correct,pass the data of the selected teacher from here to the next VC as "teacherToEdit"
            if let editTeacherVC = segue.destination as? EditTeacherViewController {
                editTeacherVC.teacherToEdit = self.selectedTeacher
            }
        }
    }
    
    //another action that uses the data re-entered in the 'edit teacher VC' and unwind back here to update through the segue
    //segue.source as? specifically identifies only the 'edit teacher VC as the source that gets unwind from the segue'
    //catches data FROM the next VC
    @IBAction func unwindToProfile (segue: UIStoryboardSegue) {
        if let editVC = segue.source as? EditTeacherViewController,
           let updatedTeacher = editVC.teacherToEdit{
            self.selectedTeacher = updatedTeacher
            
            nameLabel.text = updatedTeacher.teacherName
            roleLabel.text = updatedTeacher.teacherRole
            contactLabel.text = updatedTeacher.teacherContact
            interestLabel.text = updatedTeacher.teacherInterest
            skillsLabel.text = updatedTeacher.teacherSkills
            experiencesLabel.text = updatedTeacher.teacherExperiences
            storyLabel.text = updatedTeacher.teacherStory
            
        }
        
    }
    
    
    
    
    var selectedTeacher: Teacher?
    
    //initial set up to populate data is presented before anything actually shows
    //override runs my custom set up on top of Apple's viewDidLoad
    //super = superclass, refering to the original VC
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

