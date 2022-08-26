//
//  ViewController.swift
//  todo
//
//  Created by Zhaojie CHEN(陳昭潔) on 2022/7/7.
//

import UIKit

class ViewController: UIViewController {


    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        appdelegate.test()
        QueueTesting()
        doall()
    }
    let myQueue = DispatchQueue(label: "", attributes: .concurrent)
    let appdelegate = AppDelegate()
    @IBOutlet weak var label: UILabel!
    
    func QueueTesting(){
        myQueue.sync {
            DispatchQueue.main.async {
                print("任務一開始")
                for index in 1...3{
                    print("\(index) 任務1")
                }
                print("任務一結束")
            }
            DispatchQueue.global(qos: .userInteractive).async {
                print("任務二開始")
                for index in 1...3{
                    print("\(index) 任務2")
                }
                print("任務二結束")
            }
            DispatchQueue.global(qos: .background).async {
                print("任務4開始")
                for index in 1...3{
                    print("\(index) 任務4")
                }
                print("任務4結束")
            }
        }
        myQueue.async{
            print("任務三開始")
            for index in 1...3{
                print("\(index) 任務3")
            }
            print("任務三結束")
        }
    }
    
    func a(){
        print("I am func a")
    }
    
    
    /**
     Serial:
     sync+sync+sync：2Ｘ
     sync+sync+async：2X
     sync+async+sync:231
     sync+async+async：231
     async+sync+sync??
     async+sync+async123
     async+async+sync231
     async+async+async231

     Concurrent:
     sync+sync+sync：2X
     sync+sync+async：2X
     sync+async+sync231
     sync+async+async231
     async+sync+sync312
     async+sync+async312
     async+async+sync3開23剩1
     async+async+async2開32剩1

     */

    
}

