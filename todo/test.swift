//
//  test.swift
//  todo
//
//  Created by Zhaojie CHEN(陳昭潔) on 2022/7/20.
//

import Foundation
var test = 2
class Cat {
    
    var catname: String
    init(name: String) {
        self.catname = name
        print("\(catname) is initialized")
    }
    
    var catfood: Food? = Food(name:"catfood")
    
    deinit {
        print("\(catname) is deinitialized")
    }
    
    lazy var getfoodname: ()->() = {
        [self, weak catfood] in
        var getfoodname2: ()->() = {
            print("getfoodname2")
            print("my name is \(catfood!.foodname)")
        }
        if(test==1){
            print(test)
        }else{
            getfoodname2()
            print("my name is \(catfood!.foodname)")
        }
    }
}

class Food {
    var foodname: String
    init(name: String) {
        self.foodname = name
        print("\(foodname) is initialized")
    }
    var cat: Cat?
    deinit {
        print("\(foodname)is deinitialized")
    }
    lazy var getcatname: ()->() = {
        [weak self] in
        if(test==1){
            print(test)
        }else{
            print("my name is \(catobj!.catname)")
        }
    }
}

var catobj: Cat? = Cat(name: "catobj") //真的實作出來
var foodobj: Food? = Food(name: "foodobj")

//catobj!.catfood = foodobj //造成無法nil的部分，且一定要互相參考
//foodobj!.cat = catobj

func doall(){
    catobj!.getfoodname()
    foodobj!.getcatname()

    catobj = nil
    foodobj = nil
}


