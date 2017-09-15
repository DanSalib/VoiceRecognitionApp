//
//  ViewController.swift
//  VoiceRecognitionApp
//
//  Created by Daniel Salib on 2017-09-04.
//  Copyright © 2017 Daniel Salib. All rights reserved.
//

import UIKit
import Speech
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate {

    @IBOutlet weak var activitySpinner: UIActivityIndicatorView!
    @IBOutlet weak var transcriptionTextView: UITextView!
    
    var audioPlayer: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activitySpinner.accessibilityElementsHidden = true
    }
    
    func audioPlayerDidFinishPlaying( _ player: AVAudioPlayer, successfully flag: Bool){
        player.stop()
        activitySpinner.stopAnimating()
        activitySpinner.isHidden = true
    }

    func requestSpeechAuth() {
        if #available(iOS 10.1.1, *) {
            SFSpeechRecognizer.requestAuthorization { authStatus in
                if authStatus == SFSpeechRecognizerAuthorizationStatus.authorized{
                    if let path = Bundle.main.url(forResource: "test", withExtension: "m4a") {
                        do{
                            let sound = try AVAudioPlayer(contentsOf: path)
                            self.audioPlayer = sound
                            self.audioPlayer.delegate = self
                            sound.play()
                            
                        } catch{
                            print("Error")
                        }
                        
                        let recognizer = SFSpeechRecognizer()
                        let request = SFSpeechURLRecognitionRequest(url: path)
                        recognizer?.recognitionTask(with: request) { (result, error) in
                            if let error = error {
                                print("there was an error: \(error)")
                            } else {
                                self.transcriptionTextView.text = result?.bestTranscription.formattedString
                            }
                        }
                    }
                }
            }
        } else {
            // Fallback on earlier versions
        }
    }

    @IBAction func playBtnPressed(_ sender: AnyObject) {
        activitySpinner.accessibilityElementsHidden = false
        activitySpinner.startAnimating()
        requestSpeechAuth()
    }
}

