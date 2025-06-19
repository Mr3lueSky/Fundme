# Fundme
A smart contract that collects donation from other nodes and lets the contract owner withdraw all the donations.

The price_converter.sol makes use of chainlink oracle to fetch the current value of ETH in USD.

- Any node can donate an amount above a certain limit to the smart contract.
- The address of the donator and the amount donated is stored in the smart contract.
- The owner of the contract is the only address that can withdraw the funds.
- After withdrawal the donator and amount details are cleared from the smart contract.

## How to run
1. Open Remix IDE on the browser. No installations are required.
2. download the fundme.sol and price_converter.sol and open both in remix IDE.
3. create a metamask account
