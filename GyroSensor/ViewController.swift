//
//  ViewController.swift
//  GyroSensor
//
//  Created by 下澤一輝 on 2018/02/12.
//  Copyright © 2018年 下澤一輝. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {

    @IBOutlet weak var gyro_x: UILabel!
    @IBOutlet weak var gyro_y: UILabel!
    @IBOutlet weak var gyro_z: UILabel!
    @IBOutlet weak var accel_x: UILabel!
    @IBOutlet weak var accel_y: UILabel!
    @IBOutlet weak var accel_z: UILabel!
    
    let motionManager = CMMotionManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if motionManager.isAccelerometerAvailable {
            // intervalの設定 [sec]
            motionManager.accelerometerUpdateInterval = 1.0/30
            motionManager.gyroUpdateInterval = 1.0/30
            
            // センサー値の取得開始
            motionManager.startAccelerometerUpdates(
                to: OperationQueue.current!,
                withHandler: {(accelData: CMAccelerometerData?, errorOC: Error?) in
                    self.outputAccelData(acceleration: accelData!.acceleration)
            })
            motionManager.startGyroUpdates(
                to: OperationQueue.current!,
                withHandler: {(gyroData: CMGyroData?, errorOC: Error?) in
                    self.outputGyroData(rotationRate: gyroData!.rotationRate)
            })
          
            
        }
    }
    func outputAccelData(acceleration: CMAcceleration){
        // 加速度センサー [G]
        accel_x.text = String(format: "%06f", acceleration.x)
        accel_y.text = String(format: "%06f", acceleration.y)
        accel_z.text = String(format: "%06f", acceleration.z)
        
        //print("Accel = "+accel_x.text!+" "+accel_y.text!+" "+accel_z.text!)
    }
    
    func outputGyroData(rotationRate: CMRotationRate){
      
        gyro_x.text = String(format: "%06f", rotationRate.x)
        gyro_y.text = String(format: "%06f", rotationRate.y)
        gyro_z.text = String(format: "%06f", rotationRate.z)
        
       // print("Gyro = "+gyro_x.text!+" "+gyro_y.text!+" "+gyro_z.text!)
        print(accel_x.text!+" "+accel_y.text!+" "+accel_z.text!+" "+gyro_x.text!+" "+gyro_y.text!+" "+gyro_z.text!+" 0 0 0")
        
    }
    
    // センサー取得を止める場合
    func stopAccelerometer(){
        if (motionManager.isAccelerometerActive) {
            motionManager.stopAccelerometerUpdates()
        }
    }
    
    
    

    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

