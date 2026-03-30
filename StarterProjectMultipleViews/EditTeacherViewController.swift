//
//  EditTeacherViewController.swift
//  StarterProjectMultipleViews
//
//  Created by Brian Ma on 23/3/2026.
//

import UIKit
import FirebaseCore
import FirebaseFirestore

class EditTeacherViewController: UIViewController {
    
    //textfields/view to allow users to enter data
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var roleTextField: UITextField!
    @IBOutlet weak var contactTextField: UITextField!
    @IBOutlet weak var skillsTextField: UITextField!
    @IBOutlet weak var interestTextField: UITextField!
    @IBOutlet weak var experiencesTextField: UITextField!
    @IBOutlet weak var storyTextView: UITextView!
    
    //follows same convention and recieves data from Teacher struct
    var teacherToEdit: Teacher?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //title this VC
        self.title = "Edit Profile"
        
        //assigns teacher as the teacher being editted which is connected to updatedTeacher in the prev VC and updates the info through the unwind segue
        if let teacher = teacherToEdit{
            nameTextField.text = teacher.teacherName
            roleTextField.text = teacher.teacherRole
            contactTextField.text = teacher.teacherContact
            interestTextField.text = teacher.teacherInterest
            skillsTextField.text = teacher.teacherSkills
            experiencesTextField.text = teacher.teacherExperiences
            storyTextView.text = teacher.teacherStory
        }
        
        
        // Do any additional setup after loading the view.
    }
    
    //function that when Done button is hit, prepares info to be unwind and segue back to the prev VC
    //overriding the original prepare func that serves the unwind segue allows for data transfermation as I have customized
    
    
    override func prepare(for segue:UIStoryboardSegue, sender: Any?){
        
        //identifies when the segue with the 'savesEdits' identifier is triggered (Done) then updates the variables as assigned text values
        //?? indicates they may be empty thus expecting nothing to be a possibility
        if segue.identifier == "savesEdits"{
            teacherToEdit?.teacherName = nameTextField.text ?? ""
            teacherToEdit?.teacherRole = roleTextField.text ?? ""
            teacherToEdit?.teacherContact = contactTextField.text ?? ""
            teacherToEdit?.teacherInterest = interestTextField.text ?? ""
            teacherToEdit?.teacherSkills = skillsTextField.text ?? ""
            teacherToEdit?.teacherExperiences = experiencesTextField.text ?? ""
            teacherToEdit?.teacherStory = storyTextView.text ?? ""
            
            //calls data held in teacherToEdit to be stored in new constant to push to FIreStore
            if let updatedTeacher = teacherToEdit {
                
                //Firestore
                let db = Firestore.firestore()
                
                // Creates document with the title as the teacherName stored in the lastest updated teacher data
                let document = db.collection("teachers").document(updatedTeacher.teacherName)
                
                do {
                    // Converts your updated struct to the cloud
                    try document.setData(from: updatedTeacher)
                    print("Edits Saved Successfully")
                    
                } catch {
                    print("Failed To Save Edits")
                }
            }
            
            /*
             // MARK: - Navigation
             
             // In a storyboard-based application, you will often want to do a little preparation before navigation
             override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
             // Get the new view controller using segue.destination.
             // Pass the selected object to the new view controller.
             }
             */
            
        }
    }
}
