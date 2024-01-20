program leo_template.aleo;

record record1:
    owner as address.private;
    amount as u64.private;

record record2:
    owner as address.private;
    amount as u64.private;


function main:
    input r0 as u32.public;
    input r1 as u32.private;
    add r0 r1 into r2;
    output r2 as u32.private;
