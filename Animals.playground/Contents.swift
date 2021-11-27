import UIKit

class Animal{
    var name = "cat"
    fileprivate var health = 100
    
    init(name: String){
        self.name = name
        
    }
    func displayHealth() -> Animal {
        print("Health of \(name) is : \(health)")
        return self
    }
}

class Cat : Animal{
    
    func growl() -> Animal{
        print("Rawr!")
        return self
    }
    override init(name: String){
        super.init(name: name)
        
        self.health = 150
    }
    func run() -> Cat{
        if self.health >= 10{
        self.health -= 10
        print("Running")
        }
        return self
    }
}

class Cheetah : Cat{
    override func run()-> Cat{
        if(self.health >= 50){
        print("Running Fast")
            self.health -= 50
        }
        return self
    }
    func sleep(){
        if(health < 200){
         health = health + 50
        }
            
    }
}

class Lion: Cat{
    override init(name: String){
        super.init(name: name)
        
        self.health = 200
    }
    override func growl() -> Cat {
        print("ROAR!!!! I am the King of the Jungle")
        return self
    }
    
}

var cheetah = Cheetah(name: "cheetah")
cheetah.run().run().run().run()
cheetah.displayHealth()

var lion = Lion(name: "Lion")
lion.run().run().run()
lion.growl()


