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

