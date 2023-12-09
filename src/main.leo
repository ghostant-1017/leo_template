// The 'leo_template' program.
program leo_template.aleo {
    mapping account: address => u128;

    record token {
        owner: address,
        amount: u128,
    }

    const contract_owner: address = aleo1qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq3ljyzc;

    transition mint_private(receiver: address, amount: u128) -> token {
        assert(self.caller == contract_owner);
        return token {
            owner: receiver,
            amount: amount,
        };
    }

    transition transfer_private(sender: token, receiver: address, amount: u128) -> (token, token) {
        let difference: u128 = sender.amount - amount;

        let remaining: token = token {
            owner: sender.owner,
            amount: difference,
        };

        let transferred: token = token {
            owner: receiver,
            amount: amount,
        };

        return (remaining, transferred);
    }

    transition burn_private (receiver: address, note: token, amount: u128) -> token {
        assert(self.caller == contract_owner);
        return token {
            owner: note.owner,
            amount: note.amount - amount,
        };
    }

    /**Public**/
    transition mint_public(public receiver: address, public amount: u128) {
        assert(self.caller == contract_owner);
        return then finalize(receiver, amount);
    }

    finalize mint_public(public receiver: address, public amount: u128) {
        let current_amount: u128 = Mapping::get_or_use(account, receiver, 0u128);
        Mapping::set(account, receiver, current_amount + amount);
    }

    transition transfer_public(public receiver: address, public amount: u128) {
        return then finalize(self.caller, receiver, amount);
    }

    finalize transfer_public(public sender: address, public receiver: address, public amount: u128) {
        let sender_amount: u128 = Mapping::get_or_use(account, sender, 0u128);
        Mapping::set(account, sender, sender_amount - amount);

        let receiver_amount: u128 = Mapping::get_or_use(account, receiver, 0u128);
        Mapping::set(account, receiver, receiver_amount + amount);
    }

    transition burn_public (public receiver: address, public amount: u128) {
        return then finalize(receiver, amount);
    }

    finalize burn_public (public receiver: address, public amount: u128) {
        let current_amount: u128 = Mapping::get_or_use(account, receiver, 0u128);
        Mapping::set(account, receiver, current_amount - amount);
    }
}