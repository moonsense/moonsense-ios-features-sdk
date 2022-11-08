//
//  ViewController.swift
//  SampleApp
//
//  Copyright © 2022 Moonsense, Inc. All rights reserved.
//

import UIKit
import MoonsenseSDK
import FeaturesSDK

class ViewController: UIViewController {

    let publicToken = <#YOUR PUBLIC TOKEN#>

    @IBOutlet weak var countLabel: UILabel!

    var sessions: NSMutableSet = NSMutableSet()

    override func viewDidLoad() {
        super.viewDidLoad()
        updateSessionCount()

        Moonsense.logLevel = .debug

        Moonsense.initialize(publicToken: publicToken, delegate: self)
    }

    @IBAction func startSession(_ sender: Any) {
        let sensorTypes: [SensorType] = [.accelerometer,
                                         .gyroscope,
                                         .linearAccelerometer,
                                         .magnetometer,
                                         .orientation]

        let featureGenerators = [KurtosisFeatureGenerator(sensorTypes: sensorTypes),
                                 MeanFeatureGenerator(sensorTypes: sensorTypes),
                                 PercentileFeatureGenerator(sensorTypes: sensorTypes),
                                 RMSFeatureGenerator(sensorTypes: sensorTypes),
                                 SkewnessFeatureGenerator(sensorTypes: sensorTypes),
                                 StandardDeviationFeatureGenerator(sensorTypes: sensorTypes),
                                 ZeroCrossingFeatureGenerator(sensorTypes: sensorTypes)]

        let sessionConfig = SessionConfig(sensorTypes: SensorType.allCases,
                                          featureGenerators: featureGenerators)

        _ = try? Moonsense.startSession(duration: 30, sessionConfig: sessionConfig, labels: ["FeaturesSampleApp"])
    }

    @IBAction func stopAllSessions(_ sender: Any) {
        Moonsense.stopAllSessions()
    }

    private func updateSessionCount() {
        countLabel.text = String(sessions.count)
    }
}

extension ViewController: MoonsenseDelegate {
    func didStartSession(_ session: Session) {
        sessions.add(session)
        updateSessionCount()
    }

    func didStopSession(_ session: Session) {
        sessions.remove(session)
        updateSessionCount()
    }

    func errorDidOccur(error: MoonsenseError) {
        print("Moonsense Error occurred: \(error.localizedDescription)")

        let alert = UIAlertController(title: "Moonsense Error", message: error.localizedDescription, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))

        self.present(alert, animated: true, completion: nil)
    }
}
