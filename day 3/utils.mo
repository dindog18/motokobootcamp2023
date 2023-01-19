import Array "mo:base/Array";




// drop<T> : (xs : [T], n : Nat) -> [T]
// second_maximum(array : [Int]) ->  Int;
// remove_even(array : [Nat]) -> [Nat];



actor {
    // public func second_maximum(array : [Int]) : async Int {
        
    // };

    public func remove_even(array : [Nat]) : async [Nat] {
        let evenElements = Array.filter<Nat>(array, func x = x % 2 == 0);
        return evenElements;
    };
    // public func drop<T>(xs : [T], n : Nat) : async [T] {
    //     var counter : Nat = 0;
    //     let evenElements = Array.filter<T>(xs, func x = 
    //     if(x = counter){

    //     }
    //     counter >= x);
    // };
};