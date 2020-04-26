//
//  ViewController.swift
//  test
//
//  Created by Tanmay Arora on 26/04/20.
//  Copyright © 2020 Tanmay Arora. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let progress = Progress(totalUnitCount: 5)

    @IBAction func track(_ sender: Any) {
        guard let url = URL(string: "https://www.google.com/maps/place/Ferofy/@28.6714758,77.1520659,15z/data=!4m5!3m4!1s0x0:0xa4103e06d06e0e07!8m2!3d28.6714758!4d77.1520659") else { return }
        
        //in the string feild, for the actual tracking product, we would use a dynamic latitude/longitude url
        /* https://maps.apple.com/?ll=\(latitude),\(longitude)
         Something like the above, where we dynamically update the longitude and latitude based on the location of the driver arriving with our order.
         
         */
        UIApplication.shared.open(url)
    }
    @IBOutlet weak var track_button: UIButton!
    @IBOutlet weak var done: UILabel!
    @IBOutlet weak var eighy: UILabel!
    @IBOutlet weak var sixty: UILabel!
    @IBOutlet weak var forty: UILabel!
    @IBOutlet weak var twenty: UILabel!
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    override func viewDidLoad() {
        super.viewDidLoad()
        //tableView.tableFooterView = UIView()
        progressView.progress = 0.0
        progress.completedUnitCount = 0
            Timer.scheduledTimer(withTimeInterval: 5, repeats: true) { (timer) in
            guard self.progress.isFinished == false else {
                timer.invalidate()
                return
            }
            self.progress.completedUnitCount += 1
            self.progressView.setProgress(Float(self.progress.fractionCompleted), animated: true)
            
            //self.progressLabel.text = "\(Int(self.progress.fractionCompleted * 100)) %"
                if(self.progress.completedUnitCount==0){
                     self.progressLabel.text = "Cooking"
                }
                if(self.progress.completedUnitCount==1){
                    self.progressLabel.text = "Picked"
                self.twenty.textColor=UIColor.magenta
                    //self.twenty.font = self.twenty.font.withSize(80)
                }
                if(self.progress.completedUnitCount==2){
                    self.progressLabel.text = "On the way"
                    self.forty.textColor=UIColor.magenta
                }
                if(self.progress.completedUnitCount==3){
                    self.progressLabel.text = "Almost there"
                    self.sixty.textColor=UIColor.magenta
                }
                if(self.progress.completedUnitCount==4){
                    self.progressLabel.text = "Delivered"
                    self.eighy.textColor=UIColor.magenta
                }
                if(self.progress.completedUnitCount==5){
                    self.progressLabel.text = "Done"
                    self.done.textColor=UIColor.magenta
                }
                
            
        // Do any additional setup after loading the view, typically from a nib.
    }


}

}
