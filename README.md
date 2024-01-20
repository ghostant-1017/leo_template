## Prerequisites
You can follow along within the playground for most of the Leo examples - https://play.leo-lang.org/

However as you build out more complex examples and want to deploy, you may want to move to a local environment. We will talk about the tools needed now.

Make sure you have the following software installed on your local machine:

### Software Installation

1. [Install Git](https://git-scm.com/downloads)
2. [Install Rust](https://www.rust-lang.org/tools/install)
3. [Install Leo](https://developer.aleo.org/leo/installation)
4. [Install snarkos](https://developer.aleo.org/testnet/getting_started/installation/)
5. [Install Leo Wallet](https://leo.app/) (Chrome)
6. [Install VSCode](https://code.visualstudio.com/download)



## Working with snarkos and the leo CLI

`snarkos` is the command used to interact with our Aleo node, so it will be used for things like deploying.

```
snarkos --help
```

`leo` is probably the command you will use more often, as it is the command used to interact with our application, or do basic things like create Leo wallets.

```
leo --help
```

There is some overlap between tools, so for example, you can create a wallet with both. I’ll generally prefer to use `leo` when possible. Let’s go through an example of creating a wallet next.

### Create a  Wallet

You will need a wallet to deploy your program. You can create a wallet by running the following command:

`leo account new`

The structure will look something like:

```
Private Key  APrivateKey1zkp57ZaLSVAQjEqfAMZ1QWbi7db3BBCmPkG6Q6fp4qryD6p
View Key  AViewKey1mMuL6pMbdQdK3Tqmw1og632Vz2Y9ZSJ5ctF48PhjK64r
Address  aleo1yt7t660fx2675gapa8tr5k99cgl7klwsz3gtd9qzcfh0xklwxuqsauh8v6
```

Be sure to save the Address, View and Private Keys of this wallet, you will need them later.



## Record Model Explained

Record model is similar to that of Bitcoin or the UTXO model compared to an account model.

We will go over some basic vocabulary:

-   A **record** is the smallest data structure for storing state. For example, we can use a record to transfer Aleo credits from one address to another privately.
-   We then have a **transition**. If the records store state, a transition describes a change from one state to another. Through this process, records are consumed and created.
-   A **transaction**, the term most have probably heard, is a collection of transitions that will be published on chain.
-   Finally, a **block** is a collection of transactions allowing for a record of all state changes over time.

You can see this grouping by looking first at a block - https://explorer.hamp.app/block?h=604344

block —> transactions —> transitions —> records



## What makes up a Record

A record will look like:

```
record1qyqsqy4m2af2k4ncfdz9epcn0rr284z2tdqt67dcpya5cdk84w6yv7q9qyxx66trwfhkxun9v35hguerqqpqzq9wtmyxdukwnwxvqjt9x8pz8gta40g5v8lfkfgpl8k5tlgzg0elqrwt7earvar8zlza6twwzpzacymsy2ms083k0plr0nsc4slu9xwq2yzgrhj
```

it can be decrypted with your **ViewKey **if it belongs to you

```
{
  owner: aleo1ej97m92u995kpzn8m0zms65uwasq8w95r6pnepdpnh89c7qug5pqyyykr9.private,
  microcredits: 93300000000u64.private,
  _nonce: 2537482171121567559953927872334058167419291196003242761090252325051232141276group.public
}
```

This contains an owner and microcredits, which is the smallest division of an Aleo credit.

https://developer.aleo.org/concepts/transaction_fees/#aleo-credits-denomination-table

The `_nonce` is just a unique identifier for this record, so the number has no significant meaning.

