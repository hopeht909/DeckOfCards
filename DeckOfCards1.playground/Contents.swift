import UIKit

struct Card{
    var Color : String
    var rollValue : Int
    
}

class Deck{
    var cards: [Card] = []
    
    init(card: [Card]){
        
        self.cards = card
        
        for i in 0...2{
            
            for _ in 0...9{
                if i == 0 {
                    cards.append(Card(Color: "Red", rollValue: Int.random(in: 3...4)))
                }
                else if i == 1{
                    cards.append(Card(Color: "Green", rollValue:  Int.random(in: 4...6)))
                }
                else{
                    cards.append(Card(Color: "Blue", rollValue: Int.random(in: 1...2)))
                }
            }
        }}
    
    func removeTop(){
        cards.removeLast()
    }
    func isEmpty() -> Bool {
        if (cards.count > 0) {
            return false
        }
        else{
            return true
        }
    }
    func shuffleCard(){
        cards.shuffle()
    }
    func printDeck(){
        for (_ , value) in cards.enumerated() {
            print("Card Color: \(value.Color) Roll Value: \(value.rollValue)")
            
        }
    }
}

class Player {
    var name: String = ""
    var hand : [Card] = []
    
    init(name: String, hand: [Card]){
        self.hand = hand
        self.name = name
        print("Player Name \(name)")
    }
    func draw(deck: Deck) -> Card {
        let draw = deck.cards[Int.random(in: 1...30)]
        hand.append(draw)
        return draw
    }
    
    func rollDic() -> Int{
        return Int.random(in: 1...6)
    }
    
    func matchingCards(color y: String, value x: Int) -> Int {
        var count : Int = 0
        for (_ , value) in hand.enumerated() {
            if(value.Color == y && value.rollValue == x){
                count = count + 1
                
            }
            print(value)
        }
        return count
    }
}

var card  = Card(Color: "Green", rollValue: 4)
var deck = Deck(card: [card])
deck.shuffleCard()
deck.removeTop()
deck.printDeck()

var player = Player(name: "ameera", hand: [card])
player.draw(deck: deck)
player.draw(deck: deck)
player.draw(deck: deck)
player.draw(deck: deck)
player.draw(deck: deck)


player.rollDic()

var matchingCards = player.matchingCards(color: "Red", value: 4)
print("The number of matching Cards is : \(matchingCards)")






