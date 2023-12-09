program leo_template.aleo;

record token:
    owner as address.private;
    amount as u128.private;


mapping account:
	key as address.public;
	value as u128.public;

function mint_private:
    input r0 as address.private;
    input r1 as u128.private;
    is.eq self.caller aleo1qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq3ljyzc into r2;
    assert.eq r2 true;
    cast r0 r1 into r3 as token.record;
    output r3 as token.record;


function transfer_private:
    input r0 as token.record;
    input r1 as address.private;
    input r2 as u128.private;
    sub r0.amount r2 into r3;
    cast r0.owner r3 into r4 as token.record;
    cast r1 r2 into r5 as token.record;
    output r4 as token.record;
    output r5 as token.record;


function burn_private:
    input r0 as address.private;
    input r1 as token.record;
    input r2 as u128.private;
    is.eq self.caller aleo1qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq3ljyzc into r3;
    assert.eq r3 true;
    sub r1.amount r2 into r4;
    cast r1.owner r4 into r5 as token.record;
    output r5 as token.record;


function mint_public:
    input r0 as address.public;
    input r1 as u128.public;
    is.eq self.caller aleo1qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq3ljyzc into r2;
    assert.eq r2 true;
    async mint_public r0 r1 into r3;
    output r3 as leo_template.aleo/mint_public.future;

finalize mint_public:
    input r0 as address.public;
    input r1 as u128.public;
    get.or_use account[r0] 0u128 into r2;
    add r2 r1 into r3;
    set r3 into account[r0];


function transfer_public:
    input r0 as address.public;
    input r1 as u128.public;
    async transfer_public self.caller r0 r1 into r2;
    output r2 as leo_template.aleo/transfer_public.future;

finalize transfer_public:
    input r0 as address.public;
    input r1 as address.public;
    input r2 as u128.public;
    get.or_use account[r0] 0u128 into r3;
    sub r3 r2 into r4;
    set r4 into account[r0];
    get.or_use account[r1] 0u128 into r5;
    add r5 r2 into r6;
    set r6 into account[r1];


function burn_public:
    input r0 as address.public;
    input r1 as u128.public;
    async burn_public r0 r1 into r2;
    output r2 as leo_template.aleo/burn_public.future;

finalize burn_public:
    input r0 as address.public;
    input r1 as u128.public;
    get.or_use account[r0] 0u128 into r2;
    sub r2 r1 into r3;
    set r3 into account[r0];
