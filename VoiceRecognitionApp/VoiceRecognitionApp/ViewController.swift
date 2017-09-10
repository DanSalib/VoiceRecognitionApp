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

class ViewController: UIViewController {

    @IBOutlet weak var activitySpinner: UIActivityIndicatorView!
    @IBOutlet weak var transcriptionTextView: UITextView!
    
    var audioPlayer: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activitySpinner.accessibilityElementsHidden = true
    }

    func requestSpeechAuth() {
        SFSpeechRecognizer.RequestAuthorization { authStatus in
            if authStatus == SFSpeechRecognizerAuthorizationStatus.authorized{
                if let path = bundle.main.urlForResource("test", withExtnsion: "m4a"){
                    do{
                        let sound = try AVAudioPlayer(contentOf: path)
                        self.audioPlayer = sound
                        sound.play()
                        
                    } catch{
                        print("Error")
                    }
                    
                    let recognizer = SFSpeechRecognizer();
                    let request = SFSpeechRecognitionRequest(url: path)
                    recognizer?.recognitionTask(with: request) { (result, error) in
                        if let error = error {
                            print("there was an error: \(error)")
                        } else {
                            print(result.bestTranscription.fomrattedString)
                        }
                    }
                }
            }
        }
    }

    @IBAction func playBtnPressed(sender: AnyObject) {
        activitySpinner.accessibilityElementsHidden = false
        activitySpinner.startAnimating()
        requestSpeechAuth()
    }
}

