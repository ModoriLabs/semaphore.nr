use edwards::{Curve};
use edwards::bjj::BabyJubJubParams;
use edwards::ScalarField;
use std::ops::Add;

fn eddsa_to_pub(secret: Field) -> Curve<BabyJubJubParams> {
    let (bx, by) = BabyJubJubParams::gen();
    let base_point: Curve<BabyJubJubParams> = Curve { x: bx, y: by };
    let secret_scalar: ScalarField<63> = ScalarField::from(secret);

    base_point.mul(secret_scalar)
}

fn main() {
    let (bx, by) = BabyJubJubParams::gen();
    let point: Curve<BabyJubJubParams> = Curve { x: bx, y: by };

    let mul_result = eddsa_to_pub(2);
    let add_result = point.add(point);
    assert(mul_result == add_result);
    println(f"mul_result: {mul_result}");
    println(f"add_result: {add_result}");
}

#[test]
fn test_main() {
    main();
}
