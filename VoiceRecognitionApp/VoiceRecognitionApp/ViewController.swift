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
    override func viewDidLoad() {
        super.viewDidLoad()
        activitySpinner.accessibilityElementsHidden = true
    }



}

