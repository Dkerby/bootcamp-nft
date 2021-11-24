# Bootcamp NFT

In order to continue building out the Bootcamp ecosystem on top of the BOOT token (thanks Chris) and learn more about ERC721, I deployed an NFT contract on the Avalanche Mainnet to commemorate everyone's involvement in the program. The max total supply is 100 CAMP NFTs, so that should be more than enough for all Bootcamp particpants and the Encode and Extropy team members to mint one. The metadata and images are hosted on IPFS and pinned using Pinata, so as long as the Pinata free tier exists, the metadata and image files should be available.

The contract source code is verified on Snowtrace (https://snowtrace.io/address/0x1b7afd520ddba75b7f72ea13122893fc96215781), so I encourage you to check it out for security reasons prior to minting. The mint cost will be 100 BOOT (from the airdrop) + Avalanche gas fees for two transactions on mainnet (Approval and Mint), so if you have the required 100 BOOT you will only need to pay gas fees in order to mint (roughly ~$1.50 USD combined). The 100 BOOT tokens from each mint will remain locked in the smart contract with no way to withdraw, so spend your tokens wisely. The limit is one mint per wallet, to ensure everyone has a chance to grab an NFT. Instructions on how to mint from the web using Snowtrace are below. Please read the warning below before proceeding.

# !!! WARNING !!!

If you try to mint a second NFT with the same wallet, do not have the required amount of BOOT tokens, or the the BOOT token approval is not done first prior to minting, Metamask may attempt to generate a transaction with an exorbitantly high gas fee (over $100 USD). If the gas fee is higher than .01 AVAX, DO NOT CLICK CONFIRM in Metamask, as you will receive no NFT and pay a very high trasaction fee that will be burned by the network.

Attempt to interact with the contract at your own risk, as this is on mainnet and real-world monetary losses are possible.

The example transactions provide an estimate of the gas fees you can expect, as well as the correct functions/parameters to use.

- Example Approval transaction: https://snowtrace.io/tx/0xa3daea5cef5ffcb9b255edfefe62bfccef4e19eedfc143f703eba105eab508dc
- Example Mint transaction: https://snowtrace.io/tx/0x214fc21e2c341a2e8d50880558cc21df621a84a44dfb199580736335e44acaea

## Minting

Ok, disclaimer over. On to the fun part.

--------------------------------------------------------------------------------

### Step 1: Approve the NFT smart contract to transfer your BOOT tokens (transaction fee: ~.50 cents).

- You can use the Write Contract function of Snowtrace to approve the CAMP NFT smart contract to transfer 100 BOOT, which will need to be done before you can mint.

- BOOT Token on Snowtrace: https://snowtrace.io/address/0x4446676688584e2e8be7d0d12cac055809e4030c#writeContract

```
Function Name: Approve()

Spender: 0x1b7afd520ddba75b7f72ea13122893fc96215781
Amount: 100000000000000000000
```

- Metamask will say "Give permission to access your BOOT?" if you are using the correct transaction, this should cost around $0.50 USD in gas fees. You can verify the amount being requested for approval is 100 BOOT by clicking "edit permission" in the transaction approval window in Metamask, prior to clicking "Confirm".

- Example transaction: https://snowtrace.io/tx/0xa3daea5cef5ffcb9b255edfefe62bfccef4e19eedfc143f703eba105eab508dc

### Step 2: Mint your token (transaction fee: less than ~$1.00 USD)



- Go to the ERC721 contract address (https://snowtrace.io/address/0x1b7afd520ddba75b7f72ea13122893fc96215781), and use the Write Contract functionality of Snowtrace again, this time to mint your NFT using the Mint() function of the contract. This function takes no inputs. This will require Step 1 to be completed first.

- Once again, check the gas fee Metamask is requesting. If it is very high, DO NOT MINT, as something is wrong and proceeding by clicking "Confirm" will result in a total loss of the large gas fee amount. This contract is on Mainnet, so real losses are possible.

- Example transaction: https://snowtrace.io/tx/0x214fc21e2c341a2e8d50880558cc21df621a84a44dfb199580736335e44acaea

# Viewing Your NFT

- Once minted, you can view your NFT on NFTrade: https://nftrade.com/assets/avalanche/0x1b7afd520ddba75b7f72ea13122893fc96215781.

I plan on building out a Frontend minting site hosted on IPFS in the near future to provide a better mint experience. Feel free to DM me if you have any feedback. Happy minting!