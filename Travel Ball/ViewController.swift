//
//  ViewController.swift
//  Travel Ball
//
//  Created by Austin Vershel on 10/3/16.
//  Copyright © 2016 Austin Vershel. All rights reserved.
//

import UIKit
import Foundation
import AudioToolbox

class ViewController: UIViewController {

    @IBOutlet weak var timerlabel: UILabel!
    @IBOutlet weak var field: UIImageView!
    @IBOutlet weak var answera: UIButton!
    @IBOutlet weak var answerb: UIButton!
    @IBOutlet weak var answerc: UIButton!
    @IBOutlet weak var answerd: UIButton!
    @IBOutlet weak var answere: UIButton!
    @IBOutlet weak var answerf: UIButton!
    
    
    @IBOutlet weak var gosubmit: UIButton!
    @IBOutlet weak var questionBox: UILabel!
//    public var helloWorldTimer;
    var trivia: [Trivia] = []
    var helloWorldTimer = Timer()
    var index = 0
    var abool = false
    var bbool = false
    var cbool = false
    var dbool = false
    var ebool = false
    var fbool = false
    var down = 1
    var gain = 0
    var yardageoutoften = 0
    var fieldposition = 0;

    
    var wrongbool = false
    var imgindex = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionBox.text = "Welcome to Travel Ball!  Press the button below to begin."

        timerlabel.isHidden = true;
        questionBox.isHidden = false;
        
        styleButtons()
        resetBoard()
        populateArray()
        



    }
    override func viewDidAppear(_ animated: Bool) {

        


    }
    func sayHello()
    {
        if(timerlabel!.text! == "0"){
            gosubmitpressed(self)
        }
        else{
            if(timerlabel!.text! == "12"){
                timerlabel.font = timerlabel.font.withSize(20)
            }



            var time = timerlabel!.text!;
        var numberFromString = Int(time);
        numberFromString = numberFromString! - 1;
        timerlabel.text = String(describing: numberFromString!);
        
        
        }
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func apressed(_ sender: AnyObject) {
        answera.isSelected = true
//        answera.isSelected = false
        answerb.isSelected = false
        answerc.isSelected = false
        answerd.isSelected = false
        answere.isSelected = false
        answerf.isSelected = false

        
         abool = true
         bbool = false
         cbool = false
         dbool = false
        ebool = false
        fbool = false
    }
    
    @IBAction func bpressed(_ sender: AnyObject) {
        answerb.isSelected = true
        answera.isSelected = false
//        answerb.isSelected = false
        answerc.isSelected = false
        answerd.isSelected = false
        answere.isSelected = false
        answerf.isSelected = false
         abool = false
         bbool = true
         cbool = false
         dbool = false
        ebool = false
        fbool = false

    }
    @IBAction func cpressed(_ sender: AnyObject) {
        answerc.isSelected = true
        answera.isSelected = false
        answerb.isSelected = false
//        answerc.isSelected = false
        answerd.isSelected = false
        answere.isSelected = false
        answerf.isSelected = false
         abool = false
         bbool = false
         cbool = true
         dbool = false
        ebool = false
        fbool = false

    }
    @IBAction func dpressed(_ sender: AnyObject) {
        answerd.isSelected = true
        answera.isSelected = false
        answerb.isSelected = false
        answerc.isSelected = false
        answere.isSelected = false
        answerf.isSelected = false
//        answerd.isSelected = false
         abool = false
         bbool = false
         cbool = false
         dbool = true
        ebool = false
        fbool = false
    }
    
    @IBAction func epressed(_ sender: AnyObject) {
        answerc.isSelected = false
        answera.isSelected = false
        answerb.isSelected = false
        //        answerc.isSelected = false
        answerd.isSelected = false
        answere.isSelected = true
        answerf.isSelected = false
        abool = false
        bbool = false
        cbool = false
        dbool = false
        ebool = true
        fbool = false
    }
    
    @IBAction func fpressed(_ sender: AnyObject) {
        answerc.isSelected = false
        answera.isSelected = false
        answerb.isSelected = false
        //        answerc.isSelected = false
        answerd.isSelected = false
        answere.isSelected = false
        answerf.isSelected = true
        abool = false
        bbool = false
        cbool = false
        dbool = false
        ebool = false
        fbool = true
    }
    
    
    
    
    @IBAction func gosubmitpressed(_ sender: AnyObject) {
        

        if(gosubmit.titleLabel?.text == "Go!"){
            timerlabel.isHidden = false
            if(index % 2 == 1) {
                timerlabel.text = "15"
timerlabel.font = timerlabel.font.withSize(26)
                AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))

                if(wrongbool){
                    timerlabel.textColor = UIColor.red

            helloWorldTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(ViewController.sayHello), userInfo: nil, repeats: true);
                }
                else{
                                helloWorldTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(ViewController.sayHello), userInfo: nil, repeats: true);
                }
            gosubmit.setTitle("Submit", for: .normal);
            questionBox.isHidden = false;
            questionBox.text = trivia[index].question
            assignAnswers(answers: trivia[index].answers)


            answera.isHidden = false
            answerb.isHidden = false
            answerc.isHidden = false
            answerd.isHidden = false
            }else if(index % 2 == 0){
                timerlabel.text = "15"
timerlabel.font = timerlabel.font.withSize(26)
                 helloWorldTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(ViewController.sayHello), userInfo: nil, repeats: true);
                gosubmit.setTitle("Submit", for: .normal);
                questionBox.isHidden = false;
                questionBox.text = "Pick a play!"
                answera.setTitle("Run", for: .normal)
                answerb.setTitle("Trick Play", for: .normal)
                answere.setTitle("Pass", for: .normal)
                
                answera.isHidden = false
                answerb.isHidden = false
                answere.isHidden = false
            }

        }else{
            if(index % 2 == 1) {
                timerlabel.isHidden = true
                timerlabel.font = timerlabel.font.withSize(20)

            gosubmit.setTitle("Go!", for: .normal);
            helloWorldTimer.invalidate()
            timerlabel.text = "15"
            answera.isSelected = false
            answerb.isSelected = false
            answerc.isSelected = false
            answerd.isSelected = false

                timerlabel.textColor = UIColor.black
                wrongbool = false

            
            
            if(rightAnswer()){
                
                //CORRECT ANSWER
                
                updateFieldPosition(correct: true)




            }else{
                
                //WRONG ANSWER
                updateFieldPosition(correct: false)


            }
                
                
            resetBoard()

            index += 1;
            if(index == trivia.count){
                index = 0;
            }
            }
            else if(index % 2 == 0) {
                //YOU BLANK VS A BLANK...SUCCESS RATE
                
                timerlabel.isHidden = true
                timerlabel.font = timerlabel.font.withSize(20)

                
                gosubmit.setTitle("Go!", for: .normal);
                helloWorldTimer.invalidate()
                timerlabel.text = "15"
                answera.isSelected = false
                answerb.isSelected = false
                answerc.isSelected = false
                answerd.isSelected = false
                answere.isSelected = false
                answerf.isSelected = false

                
                
                footballPlayUpdate()
                
                
                resetBoard()
                
                index += 1;
                if(index == trivia.count){
                    index = 0;
                }
                
                
                
                
            }

        }
    }
    
    
    func assignAnswers(answers: [String]) {
        answera.setTitle(answers[0], for: .normal)
        answerb.setTitle(answers[1], for: .normal)
        answerc.setTitle(answers[2], for: .normal)
        answerd.setTitle(answers[3], for: .normal)

    }
    func styleButtons() {
        answera.backgroundColor = UIColor.clear
        answera.layer.cornerRadius = 5
        answera.layer.borderWidth = 1
        answera.layer.borderColor = UIColor.blue.cgColor
        
        
        answerb.backgroundColor = UIColor.clear
        answerb.layer.cornerRadius = 5
        answerb.layer.borderWidth = 1
        answerb.layer.borderColor = UIColor.blue.cgColor
        
        
        answerc.backgroundColor = UIColor.clear
        answerc.layer.cornerRadius = 5
        answerc.layer.borderWidth = 1
        answerc.layer.borderColor = UIColor.blue.cgColor
        
        
        answerd.backgroundColor = UIColor.clear
        answerd.layer.cornerRadius = 5
        answerd.layer.borderWidth = 1
        answerd.layer.borderColor = UIColor.blue.cgColor
        
        answere.backgroundColor = UIColor.clear
        answere.layer.cornerRadius = 5
        answere.layer.borderWidth = 1
        answere.layer.borderColor = UIColor.blue.cgColor
        
        
        answerf.backgroundColor = UIColor.clear
        answerf.layer.cornerRadius = 5
        answerf.layer.borderWidth = 1
        answerf.layer.borderColor = UIColor.blue.cgColor

        
    }
    
    func resetBoard() {

    abool = false
    bbool = false
    cbool = false
    dbool = false
    ebool = false
    fbool = false
    answera.isHidden = true
    answerb.isHidden = true
    answerc.isHidden = true
    answerd.isHidden = true
    answere.isHidden = true
    answerf.isHidden = true
    answera.setTitle("", for: .normal)
    answerb.setTitle("", for: .normal)
    answerc.setTitle("", for: .normal)
    answerd.setTitle("", for: .normal)
    answere.setTitle("", for: .normal)
    answerf.setTitle("", for: .normal)
    
    
     }
    
    
    func rightAnswer() -> Bool{
        return (trivia[index].correctAnswer == "a" && abool) || (trivia[index].correctAnswer == "b" && bbool) || (trivia[index].correctAnswer == "c" && cbool) || (trivia[index].correctAnswer == "d" && dbool);
    }
    
    func footballPlayUpdate(){
        if(abool ){
            wrongbool = true
            let yourAttributes = [NSForegroundColorAttributeName: UIColor.black, NSFontAttributeName: UIFont.systemFont(ofSize: 22)]
            let yourOtherAttributes = [NSForegroundColorAttributeName: UIColor.red, NSFontAttributeName: UIFont.systemFont(ofSize: 18)]
            
            let partOne = NSMutableAttributedString(string: "You Run vs. a Blitz!\n", attributes: yourAttributes)
            let partTwo = NSMutableAttributedString(string: "Low Success Rate", attributes: yourOtherAttributes)
            
            let combination = NSMutableAttributedString()
            
            combination.append(partOne)
            combination.append(partTwo)
            questionBox.attributedText = combination
            
        }else if (ebool){
            let yourAttributes = [NSForegroundColorAttributeName: UIColor.black, NSFontAttributeName: UIFont.systemFont(ofSize: 22)]
            let yourOtherAttributes = [NSForegroundColorAttributeName: UIColor.green, NSFontAttributeName: UIFont.systemFont(ofSize: 18)]
            
            let partOne = NSMutableAttributedString(string: "You Pass vs. a Blitz!\n", attributes: yourAttributes)
            let partTwo = NSMutableAttributedString(string: "High Success Rate", attributes: yourOtherAttributes)
            
            let combination = NSMutableAttributedString()
            
            combination.append(partOne)
            combination.append(partTwo)
            questionBox.attributedText = combination
            imgindex = 0;
            //  field.image = UIImage(named: "field.jpg")
            
            
        }else if (bbool){
            let yourAttributes = [NSForegroundColorAttributeName: UIColor.black, NSFontAttributeName: UIFont.systemFont(ofSize: 22)]
            let yourOtherAttributes = [NSForegroundColorAttributeName: UIColor.green, NSFontAttributeName: UIFont.systemFont(ofSize: 18)]
            
            let partOne = NSMutableAttributedString(string: "You Trick Play vs. a Blitz!\n", attributes: yourAttributes)
            let partTwo = NSMutableAttributedString(string: "High Success Rate", attributes: yourOtherAttributes)
            
            let combination = NSMutableAttributedString()
            
            combination.append(partOne)
            combination.append(partTwo)
            questionBox.attributedText = combination
            imgindex = 0;
            //  field.image = UIImage(named: "field.jpg")
            
            
        }else{
            wrongbool = true
            let yourAttributes = [NSForegroundColorAttributeName: UIColor.black, NSFontAttributeName: UIFont.systemFont(ofSize: 22)]
            let yourOtherAttributes = [NSForegroundColorAttributeName: UIColor.red, NSFontAttributeName: UIFont.systemFont(ofSize: 18)]
            
            let partOne = NSMutableAttributedString(string: "You Run vs. a Blitz!\n", attributes: yourAttributes)
            let partTwo = NSMutableAttributedString(string: "Low Success Rate", attributes: yourOtherAttributes)
            
            let combination = NSMutableAttributedString()
            
            combination.append(partOne)
            combination.append(partTwo)
            questionBox.attributedText = combination
        }

    }
    
    func updateFieldPosition(correct: Bool){
        var randomNumber = Int(0)
        if(correct){
            questionBox.text = "Correct! Next Question?"
             randomNumber = Int(arc4random_uniform(15))


        }else{
            questionBox.text = "Wrong! Next Question?"
             randomNumber = Int(arc4random_uniform(5))

        }
        
        timerlabel.isHidden = false
        
        yardageoutoften += randomNumber
        fieldposition += randomNumber
        

        
        var downstr = ""
        down += 1
        if(yardageoutoften > 9){
            down = 1
            yardageoutoften = 0
        }
        
        var yardsstr = "yards"
        if(randomNumber == 1){
            yardsstr = "yard"
        }
        
        
        switch down {
        case 1:
            downstr = "1st"
        case 2:
            downstr = "2nd"
        case 3:
            downstr = "3rd"
        case 4:
            downstr = "4th"
        default:
            downstr = "Illegal Down"
        }

        if(downstr == "Illegal Down"){
            fieldposition = 0
            yardageoutoften = 0
            down = 1
            timerlabel.text = "Turnover. 1st down and \(10 - yardageoutoften). \(fieldposition) yd line"
        }else{

        
        timerlabel.text = "\(randomNumber) \(yardsstr). \(downstr) down and \(10 - yardageoutoften). \(fieldposition) yd line"
        }
    }
    
    
    
    func populateArray() {
        
        trivia.append(Trivia(question: "You are currently in Harrisonburg.  How many people live in there?", answers: ["10", "100", "1000", "10000"], correctAnswer: "d"))
        trivia.append(Trivia(question: "It is currently sunny.  How big is the suns diameter in miles?", answers: ["1800", "860000", "24200", "4"], correctAnswer: "b"))
        trivia.append(Trivia(question: "Who is the starting quarterback for the Houston Texans?", answers: ["Matthew Stafford", "Brock Osweiler", "Eli Manning", "Blake Bortles"], correctAnswer: "b"))
        trivia.append(Trivia(question: "Who lead the NFL in rushing yards in 2014?", answers: ["Adrian Peterson", "Jamaal Charles", "Le'veon Bell", "Demarco Murray"], correctAnswer: "d"))
        
        
        
        
    }
}

class Trivia {
    var question: String
    var answers: [String]
    var correctAnswer: String

    init(question: String, answers: [String], correctAnswer: String) {
        self.question = question
        self.answers = answers
        self.correctAnswer = correctAnswer
    }
}

