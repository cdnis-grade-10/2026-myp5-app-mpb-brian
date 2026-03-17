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
                    teacherStory: "I grew up in Toronto, where a chance encounter with a traveling poet first introduced me to the power of spoken word. This sparked a lifelong journey that eventually led me to the vibrant international community here in Hong Kong. I love helping students find their own unique voices through the study of classic and modern literature. Outside of the classroom, you can usually find me exploring the local hiking trails with a notebook in hand.",
                    teacherInterest: "Modern Literature, Debate",
                    teacherSkills: "Curriculum Design, Public Speaking",
                    teacherExperiences: "12 years in International Baccalaureate (IB) English",
                    isUpperSchoolTeacher: true),
            Teacher(teacherName: "Sarah Jenkins",
                    teacherContact: "sarahjenkins@cdnis.edu.hk",
                    teacherRole: "Middle School Language Arts",
                    teacherProfileURL: "https://images.pexels.com/photos/3756679/pexels-photo-3756679.jpeg",
                    teacherBackgroundURL: "https://images.pexels.com/photos/159866/books-book-pages-read-literature-159866.jpeg",
                    teacherStory: "Before entering the classroom, I worked as a freelance journalist in London, writing human-interest stories. I realized that my favorite part of the job was helping others articulate their experiences, which naturally drew me to teaching. I specialize in creative writing and aim to make reading an immersive adventure for my middle schoolers. On weekends, I run a local book club and bake sourdough bread.",
                    teacherInterest: "Creative Writing, Journalism",
                    teacherSkills: "Editing, Media Literacy",
                    teacherExperiences: "5 years teaching Middle School English in the UK",
                    isUpperSchoolTeacher: false),
            Teacher(teacherName: "David O'Connor",
                    teacherContact: "davidoconnor@cdnis.edu.hk",
                    teacherRole: "AP/IB English Literature",
                    teacherProfileURL: "https://images.pexels.com/photos/2182970/pexels-photo-2182970.jpeg",
                    teacherBackgroundURL: "https://images.pexels.com/photos/374746/pexels-photo-374746.jpeg",
                    teacherStory: "With a background in theater and Shakespearean acting, I approach literature not just as text on a page, but as living, breathing scripts of the human experience. I want my upper school students to argue, debate, and passionately dissect the classics. I believe every great essay starts with a strongly defended opinion. I am also the director of the school's annual theatrical production.",
                    teacherInterest: "Theater, Shakespeare, Philosophy",
                    teacherSkills: "Directing, Advanced Essay Structuring",
                    teacherExperiences: "15 years teaching AP/IB Literature",
                    isUpperSchoolTeacher: true)
        ]),

        // 2. Chinese
        Department(departmentIcon: "chinese", departmentName: "Chinese", departmentTeacher: [
            Teacher(teacherName: "Li Chen",
                    teacherContact: "lichen@cdnis.edu.hk",
                    teacherRole: "Mandarin Department Head",
                    teacherProfileURL: "https://images.pexels.com/photos/712513/pexels-photo-712513.jpeg",
                    teacherBackgroundURL: "https://images.pexels.com/photos/1072179/pexels-photo-1072179.jpeg",
                    teacherStory: "Originally from Beijing, I moved to Hong Kong fifteen years ago to bridge the gap between traditional linguistics and modern communication. My grandfather was a master calligrapher, and he taught me that every character tells a complex story of history and culture. I strive to bring that same sense of heritage into my lessons to help students connect with the language on a deeper level. I am an avid collector of vintage fountain pens and enjoy practicing mindfulness through art.",
                    teacherInterest: "Calligraphy, Traditional Tea Ceremonies",
                    teacherSkills: "Bilingual Education, HSK Coaching",
                    teacherExperiences: "Previously taught at Beijing International School",
                    isUpperSchoolTeacher: true),
            Teacher(teacherName: "Wei Fang",
                    teacherContact: "weifang@cdnis.edu.hk",
                    teacherRole: "Lower School Mandarin Teacher",
                    teacherProfileURL: "https://images.pexels.com/photos/3778603/pexels-photo-3778603.jpeg",
                    teacherBackgroundURL: "https://images.pexels.com/photos/2086145/pexels-photo-2086145.jpeg",
                    teacherStory: "I believe that the best way to learn a new language is through play, song, and storytelling. My classroom is always filled with music and interactive games to make Mandarin approachable and fun for our youngest learners. I previously worked in children's television programming in Shanghai, creating educational content. My goal is to build a strong, joyful foundation for lifelong language learning.",
                    teacherInterest: "Puppetry, Children's Literature",
                    teacherSkills: "Early Childhood Education, Gamified Learning",
                    teacherExperiences: "7 years in Early Years bilingual education",
                    isUpperSchoolTeacher: false),
            Teacher(teacherName: "Kevin Zhang",
                    teacherContact: "kevinzhang@cdnis.edu.hk",
                    teacherRole: "IB Chinese Literature",
                    teacherProfileURL: "https://images.pexels.com/photos/1222271/pexels-photo-1222271.jpeg",
                    teacherBackgroundURL: "https://images.pexels.com/photos/7245315/pexels-photo-7245315.jpeg",
                    teacherStory: "Language is the ultimate window into a society's worldview. I specialize in modern Chinese history and literature, helping upper-level students analyze sociopolitical shifts through the lens of fiction and poetry. Before teaching, I was a translator for several global tech firms. I am passionate about showing students the practical, real-world power of being highly proficient in Mandarin.",
                    teacherInterest: "Modern Chinese History, Tech Translation",
                    teacherSkills: "Advanced Literary Analysis, Translation",
                    teacherExperiences: "10 years teaching native and near-native IB Chinese",
                    isUpperSchoolTeacher: true)
        ]),

        // 3. Maths
        Department(departmentIcon: "maths", departmentName: "Maths", departmentTeacher: [
            Teacher(teacherName: "Chris Young",
                    teacherContact: "chrisyoung@cdnis.edu.hk",
                    teacherRole: "Early Years Mathematics Teacher",
                    teacherProfileURL: "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg",
                    teacherBackgroundURL: "https://images.pexels.com/photos/3771097/pexels-photo-3771097.jpeg",
                    teacherStory: "I spent the early years of my career working as a McDonald chief, designing bridges that require absolute mathematical precision. However, I realized that my true calling was showing young people that math isn't just about formulas; it's the language of the universe. I moved into education to demystify complex concepts and make numbers feel accessible to every type of learner. When I'm not solving equations, I enjoy competitive chess and technical mountain biking.",
                    teacherInterest: "Data Science, Chess",
                    teacherSkills: "Complex Calculus, Python Programming",
                    teacherExperiences: "8 years at CDNIS",
                    isUpperSchoolTeacher: false),
            Teacher(teacherName: "Anita Desai",
                    teacherContact: "anitadesai@cdnis.edu.hk",
                    teacherRole: "Upper School Calculus & Stats",
                    teacherProfileURL: "https://images.pexels.com/photos/3769021/pexels-photo-3769021.jpeg",
                    teacherBackgroundURL: "https://images.pexels.com/photos/6256066/pexels-photo-6256066.jpeg",
                    teacherStory: "Numbers tell stories if you know how to listen to them. As a former actuary, I used statistics to predict the future for financial institutions. Now, I use those same concepts to help high school students understand everything from sports analytics to algorithm design. My goal is to completely eliminate 'math anxiety' in my classroom. I'm also the coach for the school's competitive math Olympiad team.",
                    teacherInterest: "Statistical Modeling, Sudoku",
                    teacherSkills: "AP Calculus, Financial Literacy",
                    teacherExperiences: "14 years teaching high school mathematics",
                    isUpperSchoolTeacher: true),
            Teacher(teacherName: "Marcus Thorne",
                    teacherContact: "marcusthorne@cdnis.edu.hk",
                    teacherRole: "Middle School Mathematics",
                    teacherProfileURL: "https://images.pexels.com/photos/2379004/pexels-photo-2379004.jpeg",
                    teacherBackgroundURL: "https://images.pexels.com/photos/5905497/pexels-photo-5905497.jpeg",
                    teacherStory: "Middle school math is the bridge between basic arithmetic and abstract algebra, and it's my favorite age group to teach. I focus heavily on project-based learning—whether that's designing a virtual city to understand geometry or running a mock stock market to grasp percentages. I want my students to see math in the real world, not just in textbooks.",
                    teacherInterest: "Architecture, Economics",
                    teacherSkills: "Project-Based Learning, Geometry",
                    teacherExperiences: "6 years specializing in Middle Years Programme (MYP)",
                    isUpperSchoolTeacher: false)
        ]),

        // 4. Science
        Department(departmentIcon: "science", departmentName: "Science", departmentTeacher: [
            Teacher(teacherName: "Elena Rossi",
                    teacherContact: "elenarossi@cdnis.edu.hk",
                    teacherRole: "Biology & Chemistry Specialist",
                    teacherProfileURL: "https://images.pexels.com/photos/1181519/pexels-photo-1181519.jpeg",
                    teacherBackgroundURL: "https://images.pexels.com/photos/3184418/pexels-photo-3184418.jpeg",
                    teacherStory: "My research in molecular biology once took me to the remote coral reefs of the South Pacific, where I lived on a research vessel for six months. Seeing the fragility of our ecosystems firsthand completely shifted my perspective on how we teach environmental science. I now dedicate my time to mentoring young scientists and encouraging them to lead their own sustainability initiatives within the school. In my spare time, I am a certified scuba instructor and a fan of Italian cinema.",
                    teacherInterest: "Marine Biology, Scuba Diving",
                    teacherSkills: "Laboratory Safety, Scientific Writing",
                    teacherExperiences: "Published researcher with 10 years of classroom experience",
                    isUpperSchoolTeacher: true),
            Teacher(teacherName: "Dr. James Carter",
                    teacherContact: "jamescarter@cdnis.edu.hk",
                    teacherRole: "Upper School Physics Teacher",
                    teacherProfileURL: "https://images.pexels.com/photos/2182979/pexels-photo-2182979.jpeg",
                    teacherBackgroundURL: "https://images.pexels.com/photos/1252890/pexels-photo-1252890.jpeg",
                    teacherStory: "Before coming to CDNIS, I worked as an aerospace engineer helping to design satellite propulsion systems. I bring that hands-on, engineering mindset directly into my physics labs. Whether we are building model rockets or analyzing the physics of a rollercoaster, I want students to understand the mechanics governing our universe. I also run the school's robotics club.",
                    teacherInterest: "Astrophysics, Robotics",
                    teacherSkills: "Engineering Design, Applied Physics",
                    teacherExperiences: "Former Aerospace Engineer, 8 years teaching",
                    isUpperSchoolTeacher: true),
            Teacher(teacherName: "Chloe Evans",
                    teacherContact: "chloeevans@cdnis.edu.hk",
                    teacherRole: "Lower School General Science",
                    teacherProfileURL: "https://images.pexels.com/photos/3772510/pexels-photo-3772510.jpeg",
                    teacherBackgroundURL: "https://images.pexels.com/photos/255503/pexels-photo-255503.jpeg",
                    teacherStory: "Children are natural scientists—they are constantly asking 'why' and 'how'. My job is simply to give them the tools to find the answers. From mixing messy chemical reactions (safely!) to planting our own school garden to study plant life cycles, my classroom is a hands-on exploration zone. I am deeply passionate about fostering a love for STEM in young girls.",
                    teacherInterest: "Botany, Ecology",
                    teacherSkills: "Interactive Experiments, STEM Advocacy",
                    teacherExperiences: "9 years in primary science education",
                    isUpperSchoolTeacher: false)
        ]),

        // 5. Music
        Department(departmentIcon: "music", departmentName: "Music", departmentTeacher: [
            Teacher(teacherName: "Julian Reed",
                    teacherContact: "julianreed@cdnis.edu.hk",
                    teacherRole: "Lower School Music Instructor",
                    teacherProfileURL: "https://images.pexels.com/photos/167635/pexels-photo-167635.jpeg",
                    teacherBackgroundURL: "https://images.pexels.com/photos/164821/pexels-photo-164821.jpeg",
                    teacherStory: "I believe every child has a unique melody within them that simply needs the right environment to be heard. Before becoming a teacher, I spent a decade as a touring cellist, performing in grand concert halls across Europe and North America. Those years taught me that music is the ultimate form of empathy and a tool for building community across cultures. I love bringing that global perspective to our school's orchestra and helping students discover the joy of performance.",
                    teacherInterest: "Jazz Improv, Music Technology",
                    teacherSkills: "Piano, Violin, Orchestral Conducting",
                    teacherExperiences: "Former member of the Toronto Symphony Orchestra",
                    isUpperSchoolTeacher: false),
            Teacher(teacherName: "Maria Gonzalez",
                    teacherContact: "mariagonzalez@cdnis.edu.hk",
                    teacherRole: "Choral Director & Vocal Coach",
                    teacherProfileURL: "https://images.pexels.com/photos/1181686/pexels-photo-1181686.jpeg",
                    teacherBackgroundURL: "https://images.pexels.com/photos/1763075/pexels-photo-1763075.jpeg",
                    teacherStory: "The human voice is the original instrument. I have directed choirs in three different countries and have seen firsthand how singing together can unite a diverse group of students. My curriculum explores everything from classical opera to contemporary acapella. I focus heavily on vocal health, ear training, and stage presence, preparing students for both school assemblies and international competitions.",
                    teacherInterest: "Acapella Arranging, Musical Theater",
                    teacherSkills: "Vocal Pedagogy, Choir Conducting",
                    teacherExperiences: "12 years as a professional vocal coach and director",
                    isUpperSchoolTeacher: true),
            Teacher(teacherName: "Samir Patel",
                    teacherContact: "samirpatel@cdnis.edu.hk",
                    teacherRole: "Upper School Band Director",
                    teacherProfileURL: "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg",
                    teacherBackgroundURL: "https://images.pexels.com/photos/164936/pexels-photo-164936.jpeg",
                    teacherStory: "I was a session drummer in Los Angeles before I realized I wanted to share the mechanics of music production with the next generation. As the Band Director, I oversee the jazz band, symphonic winds, and our digital music production classes. I believe modern music education should bridge the gap between classical theory and digital audio workstations (DAWs) like Logic and Ableton.",
                    teacherInterest: "Music Production, Percussion",
                    teacherSkills: "Audio Engineering, Band Management",
                    teacherExperiences: "10 years in music education and studio recording",
                    isUpperSchoolTeacher: true)
        ]),

        // 6. PE
        Department(departmentIcon: "pe", departmentName: "Physical Education", departmentTeacher: [
            Teacher(teacherName: "Marcus Jordan",
                    teacherContact: "marcusjordan@cdnis.edu.hk",
                    teacherRole: "Athletic Director & PE Teacher",
                    teacherProfileURL: "https://images.pexels.com/photos/863988/pexels-photo-863988.jpeg",
                    teacherBackgroundURL: "https://images.pexels.com/photos/163444/sport-treadmill-training-fitness-163444.jpeg",
                    teacherStory: "I grew up playing competitive basketball in a small town where the local gym was the heart of the community. That experience showed me that sports are about much more than physical fitness; they are about resilience, teamwork, and character. I moved to Hong Kong to help foster that same spirit of athletic excellence and sportsmanship in our student-athletes. When I'm not on the court, I'm usually training for my next triathlon or experimenting with plant-based nutrition.",
                    teacherInterest: "Triathlons, Nutrition Coaching",
                    teacherSkills: "First Aid, Strength & Conditioning",
                    teacherExperiences: "Coached state-winning varsity teams in Canada",
                    isUpperSchoolTeacher: true),
            Teacher(teacherName: "Jessica Lin",
                    teacherContact: "jessicalin@cdnis.edu.hk",
                    teacherRole: "Lower School PE & Dance",
                    teacherProfileURL: "https://images.pexels.com/photos/3779760/pexels-photo-3779760.jpeg",
                    teacherBackgroundURL: "https://images.pexels.com/photos/863977/pexels-photo-863977.jpeg",
                    teacherStory: "Physical literacy is just as important as reading and writing! My background is in contemporary dance and gymnastics. I focus on developing gross motor skills, coordination, and a joyful relationship with movement for our youngest students. My classes are high-energy, inclusive, and focus on personal improvement rather than just winning or losing.",
                    teacherInterest: "Choreography, Yoga",
                    teacherSkills: "Gymnastics Coaching, Motor Skill Development",
                    teacherExperiences: "Former professional dancer, 6 years teaching PE",
                    isUpperSchoolTeacher: false),
            Teacher(teacherName: "Tomoko Sato",
                    teacherContact: "tomokosato@cdnis.edu.hk",
                    teacherRole: "Upper School PE & Swim Coach",
                    teacherProfileURL: "https://images.pexels.com/photos/1181681/pexels-photo-1181681.jpeg",
                    teacherBackgroundURL: "https://images.pexels.com/photos/863988/pexels-photo-863988.jpeg",
                    teacherStory: "Water is my second home. As a former competitive swimmer in Japan, I learned discipline, time management, and mental toughness. I bring these values to my high school PE classes and to the varsity swim team. I believe that physical education in the upper school should prepare students to maintain healthy, active lifestyles long after they graduate from CDNIS.",
                    teacherInterest: "Competitive Swimming, Sports Psychology",
                    teacherSkills: "Lifeguard Certification, Kinesiology",
                    teacherExperiences: "National level swimmer, 8 years coaching aquatics",
                    isUpperSchoolTeacher: true)
        ])
    ]

extension ViewControllerTwo: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        
        let chosenDepartment = schoolDepartments[indexPath.item]
        
        if let tableVC = storyboard?.instantiateViewController(withIdentifier: "ViewControllerThree") as? ViewControllerThree {
        
            tableVC.selectedDepartment = chosenDepartment
            
            navigationController?.pushViewController(tableVC, animated: true)
        }
    }
    }

extension ViewControllerTwo: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return schoolDepartments.count
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
    

