// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

// constructor() {} :: is a special function that is automatically executed only once whn the contact is deployed to a
// blockchain. it is used to inializecontract state variable

// modifier onlyowner{} :: a modifier is a reuseable piece of code that can be used to modify the behaviour of functions
// and restrictacess to certain operations within a contract

// to install a dependecy just copy the link from github but dont copy http://github
// forge install smartcontractkit/chainlink-brownie-contracts@0.8.0 --no-commit
// @0.8.0 is the version in github

// remappings= ["@chainlink/contracts/=lib/chainlink-brownie-contracts/contracts/"]
// pasting the above on our foundry.toml means that you are telling the code any where it sees @chainlink/contracts/ that you are
// also reffering to lib/chainlink-brownie-contracts/contracts

// we will now go ahead and write test

// .s.sol -> this is letting us know that this is a script while
// .t.sol -> is letting us know this is a test
// storage variables shoud also start with s_

// note that private variables are more gas efficient than public one

// to test test on terminal
// forge test -vv

// to test script
// forge script script/DeployFundMe.s.sol

// to test a single function in test
// forge test --mt testPriceFeedVersionIsAccurate -vvv

// to see how many line of our code is actually tested
// forge coverage --fork-url $SEPOLIA_RPC_URL

// What can we do to work with addresses outside our system?
// 1. Unit
//   - Testing a specific part of our code
// 2. Integration
//   - Testing how our code works with other parts of our code
// 3. Forked
//   - Testing our code on a simulated real environment
// 4. Staging
//   - Testing our code in a real environment that is not prod

// to see diffrent chain id of networks visits
// chainlist.org

// visit book.getfoundry.sh for more information about foundry and cheetcode

// chisel
// chisel allow us to write solidity in our terminal and execute it line by line

// this will show you how much gas it will cost for a single test
// forge snapshot --mt  testWithdrawWithASingleFunder

// this will tell you the exact layout your FundMe contract have
//forge inspect FundMe storageLayout

// to see a live contract storage
// cast storage 0xe7fetc

// use i_owner for immutable variables
// and use uppercase for constant variables
// then use s_priceFeed for storage variabless

// to test single contract in script
// forge script script/Interactions.s.sol:FundFundMe  rpc_url jfjd --private_key fjdj

//  publishing code to github
// first using foundry do
// git status  -> this will show you what you re pushing to github and so on, then do
// git add .  -> this says add all the files and folder in here to the one that will will commited with
// git log  -> this help us see all the version of our code that was pushed to github
// then lets mk our first commit with
// git commit -m 'our first commit!'  -> then after making ur first commit
// go to your github  press new to create new repository then type the name make it public or private
// THEN AFTER THAT, copy the link showed that hv .git then come bck to your cli and type
// git remote add origin https://github.com/king-null/my-foundry-first-repo.git
// the remote key word refers a website like github, add is saying we re going to add a remote place for us to push our code
// origin is a shorten name for this giant URL the URL is the actual place
// if we do git remote -v  -> we can see all the diffrent places we can push and pull our code from, next we do
// git push -u origin main -> after this you can now  see all your code in github
// note::: we can do git config user.name "kensel.null" -> this will change the username you are signing with to kenselnull
