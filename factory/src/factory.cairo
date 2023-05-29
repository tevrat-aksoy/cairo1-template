

#[contract]
mod Factory {
    use starknet::ContractAddress;

    use ownable::ownable::Ownable;

    struct Storage {
        _test: felt252,
    }

    #[view]
    fn owner() -> ContractAddress {
        Ownable::owner()
    }

    #[external]
    fn init() {
        Ownable::initializer();
    }

}
