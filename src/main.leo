// The 'leo_template' program.
program leo_template.aleo {
    record record1 {
        owner: address,
        amount: u64,
    }

    record record2 {
        owner: address,
        amount: u64,
    }
    
    transition main(public a: u32, b: u32) -> u32 {
        let c: u32 = a + b;
        return c;
    }
}
