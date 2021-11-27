import UIKit

class Game {
    var player : [Player] = []
    var deck : Deck
    var turnIdx: Int
    var arrayCoin: [String: Int] = [:]
    
    init (players : [Player], deck : Deck, turnIdx: Int){
        self.player = players
        self.deck = deck
        self.turnIdx = turnIdx
        
        player.append(Player(name: "Mike", hand: deck.cards))
        player.append(Player(name: "Sydney", hand: deck.cards))
        player.append(Player(name: "Blake", hand: deck.cards))
        player.append(Player(name: "Tiffany", hand: deck.cards))
        deck.shuffleCard()
        
        
    }
    func playGame(){
        for i in 0...4{
            takeTurn(person: player[i])        }
    }
  
    
    func takeTurn(person : Player){
        var coin = 0
            person.rollDic()
        
        for i in 0...4{
            
        let greenCard = person.matchingCards(color: "Green", value: 6)
        
        for _ in 0...greenCard{
            coin += 2
        }
            let blueCard = person.matchingCards(color: "Blue", value: 1)
            
        for _ in 0...blueCard{
            coin += 1
        }
        let redCard = person.matchingCards(color: "Red", value: 4)
           
        for _ in 0...redCard{
            coin += 1
        }
        person.draw(deck: self.deck)
            
            arrayCoin[player[i].name] = coin
        }
    }
    
    func announceWinner(){
        var maxName = ""
        var maxValue = 0
        for (key, value) in arrayCoin {
            if value > maxValue {
                maxValue = value
                maxName = key
            
            }
            print("Player Name \(key): Number Of Coin: \(value)")
        }
        
        print("The winner is: \(maxName) with coin of \(maxValue)")
    }
}
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
        }
        
    }
    
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
    
        }
        return count
    }
}

var card  = Card(Color: "Green", rollValue: 4)
var deck = Deck(card: [card])
deck.shuffleCard()

var players = Player(name: "ameera", hand: [card])

players.rollDic()


var game = Game(players: [players], deck: deck, turnIdx: 1)


game.playGame()
game.takeTurn(person: players)
game.announceWinner()


