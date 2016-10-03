//
//  ViewController.swift
//  Travel Ball
//
//  Created by Austin Vershel on 10/3/16.
//  Copyright © 2016 Austin Vershel. All rights reserved.
//

import UIKit
import Foundation
class ViewController: UIViewController {

    @IBOutlet weak var timerlabel: UILabel!
    @IBOutlet weak var field: UIImageView!
    @IBOutlet weak var answera: UIButton!
    @IBOutlet weak var answerb: UIButton!
    @IBOutlet weak var answerc: UIButton!
    @IBOutlet weak var answerd: UIButton!
    @IBOutlet weak var gosubmit: UIButton!
    @IBOutlet weak var questionBox: UILabel!
//    public var helloWorldTimer;
    var trivia: [Trivia] = []
    var helloWorldTimer = Timer()
    var index = 0


    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        questionBox.isHidden = true;
        answera.isHidden = true
        answerb.isHidden = true
        answerc.isHidden = true
        answerd.isHidden = true
        
        trivia.append(Trivia(question: "Who is the starting quarterback for the Houston Texans?", answers: ["Matthew Stafford", "Brock Osweiler", "Eli Manning", "Blake Bortles"], correctAnswer: "Brock Osweiler"))
        trivia.append(Trivia(question: "Who lead the NFL in rushing yards in 2014?", answers: ["Adrian Peterson", "Jamaal Charles", "Le'veon Bell", "Demarco Murray"], correctAnswer: "Demarco Murray"))

        


    }
    override func viewDidAppear(_ animated: Bool) {

        


    }
    func sayHello()
    {
        var time = timerlabel!.text!;
        var numberFromString = Int(time);
        numberFromString = numberFromString! - 1;
        timerlabel.text = String(describing: numberFromString!);
        
        
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func apressed(_ sender: AnyObject) {
        answera.isSelected = true
    }
    
    @IBAction func bpressed(_ sender: AnyObject) {
        answerb.isSelected = true

    }
    @IBAction func cpressed(_ sender: AnyObject) {
        answerc.isSelected = true

    }
    @IBAction func dpressed(_ sender: AnyObject) {
        answerd.isSelected = true

    }
    @IBAction func gosubmitpressed(_ sender: AnyObject) {
        if(gosubmit.titleLabel?.text == "Go!"){
            helloWorldTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(ViewController.sayHello), userInfo: nil, repeats: true);
            gosubmit.setTitle("Submit", for: .normal);
            questionBox.isHidden = false;
            questionBox.text = trivia[index].question
            assignAnswers(answers: trivia[index].answers)
            index += 1;
            answera.isHidden = false
            answerb.isHidden = false
            answerc.isHidden = false
            answerd.isHidden = false

        }else{
            gosubmit.setTitle("Go!", for: .normal);
            helloWorldTimer.invalidate()
            timerlabel.text = "15"
            answera.isSelected = false
            answerb.isSelected = false
            answerc.isSelected = false
            answerd.isSelected = false
            questionBox.text = "Next Question?"
            answera.isHidden = true
            answerb.isHidden = true
            answerc.isHidden = true
            answerd.isHidden = true



        }
    }
    
    
    func assignAnswers(answers: [String]) {
        answera.setTitle(answers[0], for: .normal)
        answerb.setTitle(answers[1], for: .normal)
        answerc.setTitle(answers[2], for: .normal)
        answerd.setTitle(answers[3], for: .normal)

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

