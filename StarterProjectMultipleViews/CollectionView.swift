/*
 
 ViewControllerTwo.swift
 
 This file will contain the code for the second viewcontroller.
 Please ensure that your code is organised and is easy to read.
 This means that you will need to both structure your code correctly,
 in addition to using the correct syntax for Swift.
 
 Unless you are told otherwise, ensure that you are using the
 camelCase syntax. For example, outputLabel and firstName are good
 examples of using the camelCase syntax.
 
 Within each class, you can see clearly identified sections denoted by
 MARK statements. These MARK statements allow you to structure and organise
 your code.
 
 - @IBOutlets should be listed under the MARK section on IBOutlets
 - Variables and constants listed under the MARK section Variables and Constants
 - Functions (including @IBActions) listed under the section on IBActions and Functions.
 
 As you develop each view controller class with Swift code, please include
 detailed comments to both demonstrate understanding, and which serve you as
 a reminder as to what your code actually does.
 
 */

import UIKit

class ViewControllerTwo: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    
    // MARK: - Variables and Constants
    
    
    
    // MARK: - IBActions and Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical // Change to vertical
        layout.minimumInteritemSpacing = 10 // Horizontal space between cells
        layout.minimumLineSpacing = 10      // Vertical space between rows
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
        collectionView.collectionViewLayout = layout
        
        collectionView.register(MyCollectionViewCell.nib(),forCellWithReuseIdentifier: MyCollectionViewCell.identifier)
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
}

let schoolDepartments: [Department] = [
    // 1. English
    Department(departmentIcon: "english", departmentName: "English", departmentTeacher: [
        Teacher(teacherName: "Alice Wong",
                teacherContact: "alicewong@cdnis.edu.hk",
                teacherRole: "Upper School English Teacher",
                teacherProfileURL: "https://images.pexels.com/photos/1181690/pexels-photo-1181690.jpeg",
                teacherBackgroundURL: "https://images.pexels.com/photos/256450/pexels-photo-256450.jpeg",
                teahcerStory: "I grew up in Toronto, where a chance encounter with a traveling poet first introduced me to the power of spoken word. This sparked a lifelong journey that eventually led me to the vibrant international community here in Hong Kong. I love helping students find their own unique voices through the study of classic and modern literature. Outside of the classroom, you can usually find me exploring the local hiking trails with a notebook in hand.",
                teacherInterest: "Modern Literature, Debate",
                teacherSkills: "Curriculum Design, Public Speaking",
                teacherExperiences: "12 years in International Baccalaureate (IB) English",
                isUpperSchoolTeacher: true)
    ]),

    // 2. Chinese
    Department(departmentIcon: "chinese", departmentName: "Chinese", departmentTeacher: [
        Teacher(teacherName: "Li Chen",
                teacherContact: "lichen@cdnis.edu.hk",
                teacherRole: "Mandarin Department Head",
                teacherProfileURL: "https://images.pexels.com/photos/712513/pexels-photo-712513.jpeg",
                teacherBackgroundURL: "https://images.pexels.com/photos/1072179/pexels-photo-1072179.jpeg",
                teahcerStory: "Originally from Beijing, I moved to Hong Kong fifteen years ago to bridge the gap between traditional linguistics and modern communication. My grandfather was a master calligrapher, and he taught me that every character tells a complex story of history and culture. I strive to bring that same sense of heritage into my lessons to help students connect with the language on a deeper level. I am an avid collector of vintage fountain pens and enjoy practicing mindfulness through art.",
                teacherInterest: "Calligraphy, Traditional Tea Ceremonies",
                teacherSkills: "Bilingual Education, HSK Coaching",
                teacherExperiences: "Previously taught at Beijing International School",
                isUpperSchoolTeacher: true)
    ]),

    // 3. Maths
    Department(departmentIcon: "maths", departmentName: "Maths", departmentTeacher: [
        Teacher(teacherName: "Chris Young",
                teacherContact: "chrisyoung@cdnis.edu.hk",
                teacherRole: "Early Years Mathematics Teacher",
                teacherProfileURL: "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg",
                teacherBackgroundURL: "https://images.pexels.com/photos/3771097/pexels-photo-3771097.jpeg",
                teahcerStory: "I spent the early years of my career working as a structural engineer, designing bridges that require absolute mathematical precision. However, I realized that my true calling was showing young people that math isn't just about formulas; it's the language of the universe. I moved into education to demystify complex concepts and make numbers feel accessible to every type of learner. When I'm not solving equations, I enjoy competitive chess and technical mountain biking.",
                teacherInterest: "Data Science, Chess",
                teacherSkills: "Complex Calculus, Python Programming",
                teacherExperiences: "8 years at CDNIS",
                isUpperSchoolTeacher: false)
    ]),

    // 4. Science
    Department(departmentIcon: "science", departmentName: "Science", departmentTeacher: [
        Teacher(teacherName: "Elena Rossi",
                teacherContact: "elenarossi@cdnis.edu.hk",
                teacherRole: "Biology & Chemistry Specialist",
                teacherProfileURL: "https://images.pexels.com/photos/1181519/pexels-photo-1181519.jpeg",
                teacherBackgroundURL: "https://images.pexels.com/photos/3184418/pexels-photo-3184418.jpeg",
                teahcerStory: "My research in molecular biology once took me to the remote coral reefs of the South Pacific, where I lived on a research vessel for six months. Seeing the fragility of our ecosystems firsthand completely shifted my perspective on how we teach environmental science. I now dedicate my time to mentoring young scientists and encouraging them to lead their own sustainability initiatives within the school. In my spare time, I am a certified scuba instructor and a fan of Italian cinema.",
                teacherInterest: "Marine Biology, Scuba Diving",
                teacherSkills: "Laboratory Safety, Scientific Writing",
                teacherExperiences: "Published researcher with 10 years of classroom experience",
                isUpperSchoolTeacher: true)
    ]),

    // 5. Music
    Department(departmentIcon: "music", departmentName: "Music", departmentTeacher: [
        Teacher(teacherName: "Julian Reed",
                teacherContact: "julianreed@cdnis.edu.hk",
                teacherRole: "Lower School Music Instructor",
                teacherProfileURL: "https://images.pexels.com/photos/167635/pexels-photo-167635.jpeg",
                teacherBackgroundURL: "https://images.pexels.com/photos/164821/pexels-photo-164821.jpeg",
                teahcerStory: "I believe every child has a unique melody within them that simply needs the right environment to be heard. Before becoming a teacher, I spent a decade as a touring cellist, performing in grand concert halls across Europe and North America. Those years taught me that music is the ultimate form of empathy and a tool for building community across cultures. I love bringing that global perspective to our school's orchestra and helping students discover the joy of performance.",
                teacherInterest: "Jazz Improv, Music Technology",
                teacherSkills: "Piano, Violin, Orchestral Conducting",
                teacherExperiences: "Former member of the Toronto Symphony Orchestra",
                isUpperSchoolTeacher: false)
    ]),

    // 6. PE
    Department(departmentIcon: "pe", departmentName: "Physical Education", departmentTeacher: [
        Teacher(teacherName: "Marcus Jordan",
                teacherContact: "marcusjordan@cdnis.edu.hk",
                teacherRole: "Athletic Director & PE Teacher",
                teacherProfileURL: "https://images.pexels.com/photos/863988/pexels-photo-863988.jpeg",
                teacherBackgroundURL: "https://images.pexels.com/photos/163444/sport-treadmill-training-fitness-163444.jpeg",
                teahcerStory: "I grew up playing competitive basketball in a small town where the local gym was the heart of the community. That experience showed me that sports are about much more than physical fitness; they are about resilience, teamwork, and character. I moved to Hong Kong to help foster that same spirit of athletic excellence and sportsmanship in our student-athletes. When I'm not on the court, I'm usually training for my next triathlon or experimenting with plant-based nutrition.",
                teacherInterest: "Triathlons, Nutrition Coaching",
                teacherSkills: "First Aid, Strength & Conditioning",
                teacherExperiences: "Coached state-winning varsity teams in Canada",
                isUpperSchoolTeacher: true)
    ])
]

extension ViewControllerTwo: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        print("works")
        
    }
    
    }

extension ViewControllerTwo: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCollectionViewCell.identifier, for: indexPath) as! MyCollectionViewCell
        
        // 1. Get the department for this specific index
        let department = schoolDepartments[indexPath.item]
        
        // 2. Use the departmentIcon string to find the image in Assets
        // We provide a fallback image (systemName) just in case the asset name is misspelled
        let iconImage = UIImage(named: department.departmentIcon) ?? UIImage(systemName: "questionmark.circle")
        
        // 3. Configure the cell (Assuming your configure method takes an image, name, and role/desc)
        cell.configure(with: iconImage!)
        
        return cell
    }
}

extension ViewControllerTwo: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            
        let padding: CGFloat = 40 // (inset left and right by 15 + space between cells 10)
        let collectionViewSize = collectionView.frame.size.width - padding
        
        let width = collectionViewSize / 2
            
        // For a square look, use width. For a card look, use width * 1.2
        return CGSize(width: width, height: width)
        }
    }
    

