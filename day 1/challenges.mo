// multiply(n : Nat, m : Nat) -> async Nat
// volume(n : Nat) -> async Nat
// hours_to_minutes(n : Nat) -> async Nat
// set_counter(n : Nat) -> async ()
// get_counter() -> async Nat
// test_divide(n: Nat, m : Nat) -> async Bool
// is_even(n : Nat) -> async Bool 

actor {
    public func multiply(n : Nat, m : Nat) : async Nat {
        return n*m;
    };

    public func volume(n : Nat) : async Nat {
        return n*n*n;
    };

    public func hours_to_minutes(n: Nat) : async Nat{
        return n*60
    };

    var counter : Nat = 0;
    public func set_counter(n : Nat) : async () {
        return counter := counter;
    };
    
    public func get_counter() : async Nat {
        return counter;
    };

    public func test_divide(n: Nat, m : Nat) : async Bool {
        if (m % n == 0){
            return true;
        } else {
            return false;
        }
    };

    public func is_even(n : Nat) : async Bool {
        if (n % 2 == 0){
            return true;
        } else {
            return false;
        }
    };
};