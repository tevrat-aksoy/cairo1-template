use array::ArrayTrait;
use result::ResultTrait;
use protostar_print::PrintTrait;


#[test]
fn test_fail() {
    let class_hash_factory = declare('contract_factory').unwrap();
    let mut calldata = ArrayTrait::new();
    let prepare_result = prepare(class_hash_factory, @calldata).unwrap();
    let factory = deploy(prepare_result).unwrap();

    let owner_res= call(factory, 'owner', @ArrayTrait::new()).unwrap();
    owner_res.print();


    start_prank(12345, factory).unwrap();
    match invoke(factory, 'init', @calldata) {
        Result::Ok(x) => 'init success'.print(),
        Result::Err(x) => {
            'init revert'.print();
            x.panic_data.print();
        }
    } 

    let owner_res= call(factory, 'owner', @ArrayTrait::new()).unwrap();
    owner_res.print(); 
}
