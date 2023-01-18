// average_array(array : [Int]) -> async Int. 
// count_character(t : Text, c : Char) -> async Nat
// factorial(n : Nat) ->  async Nat
// number_of_words(t : Text) -> async Nat 
// find_duplicates(a : [Nat]) -> async [Nat]
// convert_to_binary(n : Nat) -> async Text
import {add} "mo:base/Nat";
import Array "mo:base/Array";
import Text "mo:base/Text";
import Iter "mo:base/Iter";
import Nat "mo:base/Nat";
import {toText} "mo:base/Nat";





actor {
    public func average_array(array : [Int]) : async Int{
        let sum = Array.foldLeft<Int, Int>(array,
        0, // start the sum at 0
        func(sumSoFar, x) = sumSoFar + x // this entire function can be replaced with `add`!
        );
        let quantity = array.size();
        return sum / quantity;
    }; 

    public func count_character(t : Text, c : Char) : async Nat {
        var counter: Nat = 0;
        let charList : Iter.Iter<Char> = Text.toIter(t);
        for (i in charList){
            if (i == c){
                counter := counter + 1;
            }
        };
        return counter;
    }; 

    public func factorial(n : Nat) : async Nat{
        let array : [Nat] = Array.tabulate<Nat>(n, func i = i + 1);
        let factorial =
            Array.foldLeft<Nat, Nat>(
                array,
                1, // start the sum at 0
                func(sumSoFar, x) = sumSoFar * x // this entire function can be replaced with `add`!
            );
        return factorial;
    };

    public func number_of_words(t : Text) : async Nat{
        var counter: Nat = 0;
        let charList : Iter.Iter<Text> = Text.split(t, #text(" "));
        for (i in charList){
            counter := counter + 1;
        };
        return counter;
    };

    public func find_duplicates(a : [Nat]) : async [Nat] {
        let data : [var Nat] = [var ];
        var counter : Nat = 0;
        for (x in a.vals()) {
            for (y in a.vals()){
                if (x == y){
                    counter := counter + 1;
                };
                switch(counter) {
                    case(2) { data[data.size()] := y };
                    case _ {  };
                };
            };
            counter := 0;
        };
        return Array.freeze<Nat>(data);
    };

    public func convert_to_binary(n : Nat) :  async Text{
        let data : [var Nat] = [var ];
        var m = n;
        switch(m) {
            case(0) { "0" };
            case(1) { "1" };
            case(2) { "10" };
            case(3) { "11" };
            case(n) {
                while (m/2!=0) {
                    if (m%2 == 0){
                        data[data.size()] := 0;
                    } else{
                        data[data.size()] := 1;
                    };
                    m :=m/2;
                };
                let immutable = Array.freeze<Nat>(data);
                return Array.foldRight<Nat, Text>(immutable, "", func(x, acc) = toText(x) # acc);
            };
        };
    };
};

