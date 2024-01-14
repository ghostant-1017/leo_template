// The 'leo_template' program.
program leo_template.aleo {
    transition get_max(arrs: [u8; 16]) -> u8 {
        let result: u8 = 0u8;
        for i: u8 in 0u8..8u8 {
            if arrs[i] > result {
                result = arrs[i];
            }
        }
        return result;
    }
}
