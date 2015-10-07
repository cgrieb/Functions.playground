//: Playground - noun: a place where people can play

import UIKit

var stringToParse : String

let closure = { ( s: String ) -> Bool in
    var count = 0
    
    for c in s.characters {
        switch c {
        case "0"..."9":
            fallthrough
        case " ":
            fallthrough
        case "*" :
            fallthrough
        case "+" :
            fallthrough
        case "-" :
            fallthrough
        case "/" :
            count++
        default:
            break
        }
    }
    
    return count == s.characters.count
}

//
// Enter a simple math expression using two integers with an operator
//
// Yes, this could be much more interesting if I add more features,
//      like parenthesis and multiple operators,
//      but I would need to implement stacks and recursion
//      and I need to get this assignment done!
//
stringToParse = "3 * 5"   // must be an integer expression


func evaluate( expression : String, verify: ( s: String ) -> Bool ) -> Int {
    var total = 0
    var leftOperand = 0
    var rightOperand = 0
    var currentOperator : Character = " "
    var left = true
    
    func calcExpression( a : Int, b : Int, op : Character ) -> Int {
        var result : Int = 0
        switch op {
        case "*" :
            result = a * b
        case "+" :
            result = a + b
        case "-" :
            result = a - b
        case "/" :
            result = a / b
        default:
            break
        }
        return result
    }
    
    if ( !verify( s: expression ) ) {
        print("Please enter a valid expression")
    } else {
        
        for c in expression.characters {
            
            switch c {
            case "0"..."9" :
                if left {
                    leftOperand = ( leftOperand * 10 ) + Int(String(c))!
                } else {
                    rightOperand = (rightOperand * 10 ) + Int(String(c))!
                }
            case "*" :
                fallthrough
            case "+" :
                fallthrough
            case "-" :
                fallthrough
            case "/" :
                if left {
                    left = false
                } else {
                    currentOperator = c
                }
                break
            case " " :
                left = false
                break
                //        case "(" :
                //            let beginPos = expression.characters.indexOf("(")!
                //            let endPos = expression.characters.indexOf(")")!
                //            let subString = expression.substringWithRange(beginPos...endPos)
                //            if left {
                //                leftOperand = evaluate(subString)
                //                left = false
                //            } else {
                //                rightOperand = evaluate(subString)
                //            }
                //            break
                //        case ")" :
                //            break
            default :
                print("Error in expression. Please try again.")
            }
            
        }
    }
    
    return calcExpression(leftOperand, b: rightOperand, op: currentOperator)
    
}


print("\n\nThe result of the expression \(stringToParse) is: \(evaluate(stringToParse,verify: closure))")


