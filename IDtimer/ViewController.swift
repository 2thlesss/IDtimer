//
//  ViewController.swift
//  IDtimer
//
//  Created by Thomas Jadie Reeves on 3/5/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var timerLabel: UILabel!
    
    @IBOutlet weak var startButtonTapped: UIButton!
    
    
    @IBOutlet weak var roundLabel: UILabel!
    
    
    var remainingTime = 0
       var currentRound = 0
       var roundDurations = [65, 65, 65, 65, 65, 65, 65, 65, 65, 65, 65, 65, 65, 65, 105, 105, 105, 105, 105, 105, 105, 105, 105, 125, 125]
       var timer: Timer?
       
       override func viewDidLoad() {
           super.viewDidLoad()
       }
       
       override func viewWillDisappear(_ animated: Bool) {
           super.viewWillDisappear(animated)
           
           timer?.invalidate()
           timer = nil
       }
    
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
        // disable the button
               startButtonTapped.isEnabled = false
               
               // check if timer is running, if yes, invalidate it
               if timer != nil {
                   timer?.invalidate()
                   timer = nil
               }
               
               currentRound = 1
               remainingTime = roundDurations[currentRound-1]
               timerLabel.text = "\(remainingTime)"
               roundLabel.text = "Round \(currentRound)"
               
               timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] timer in
                   guard let self = self else { return }
                   
                   if self.remainingTime >= 1 { // check if remaining time is greater than or equal to 1
                       self.remainingTime -= 1
                       self.timerLabel.text = "\(self.remainingTime)"
                   } else {
                       self.currentRound += 1
                       
                       if self.currentRound > self.roundDurations.count {
                           timer.invalidate()
                           self.timer = nil
                           self.timerLabel.text = "Done!"
                           self.startButtonTapped.isEnabled = true // enable the button
                       } else {
                           self.remainingTime = self.roundDurations[self.currentRound-1]
                           self.timerLabel.text = "\(self.remainingTime)"
                           self.roundLabel.text = "Round \(self.currentRound)"
                       }
                       if self.currentRound
                   }
               }
           }
       }
/// now i need to put in the code to display the banner alerts and display in a lable the round information for buffs and towers
/// 
