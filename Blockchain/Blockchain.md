# Blockchain

## Important Concepts to Know

Definitions from below are provided in the following [tutorial](https://www.tutorialspoint.com/python_blockchain/python_blockchain_introduction.htm)

Components Involved in Blockchain Project Development
The entire blockchain project development consists of three major components −

+ Client
+ Miners
+ Blockchain

Client   

The Client is the one who will buy goods from other vendors. The client himself 
may become a vendor and will accept money from others against the goods he 
supplies. We assume here that the client can both be a supplier and a recipient 
of TPCoins. Thus, we will create a client class in our code that has the ability 
to send and receive money.

Miner   

The Miner is the one who picks up the transactions from a transaction pool and 
assembles them in a block. The miner has to provide a valid proof-of-work to get 
the mining reward. All the money that miner collects as a fee will be for him to 
keep. He may spend that money on buying goods or services from other registered 
vendors on the network, just the way a Client described above does.

Blockchain

Finally, a Blockchain is a data structure that chains all the mined blocks in a 
chronological order. This chain is immutable and thus temper-proof.

The first block in a blockchain is known as the `Genesis block`. The geneisis
block contains the first transaction initiated by the createor of the blockchain


## Smart Contract
Code or an automated process that handles a transaction between two parties
without a middleman.

Example:
You put your will in a smart contract and then upon your death. The program and
not a third party would handle your will. Anywhere, where a transaction needs
to occur you can use a smart contract.
