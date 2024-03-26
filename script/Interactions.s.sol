// in here we re going to hv all the ways we can actually interact with our contract
// we re going to mk a
// fund script
// withdraw script

// SPDX-License-Identifier: MIT

pragma solidity 0.8.18;

import {Script, console} from "forge-std/Script.sol";
import {DevOpsTools} from "foundry-devops/src/DevOpsTools.sol";
import {FundMe} from "../src/FundMe.sol";

contract FundFundMe is Script {
    uint256 constant SEND_VALUE = 0.01 ether;

    function fundFundMe(address mostRecentlyDeployed) public {
        FundMe(payable(mostRecentlyDeployed)).fund{value: SEND_VALUE}();

        console.log("Funded FundMe with %s", SEND_VALUE);
    }

    function run() external {
        address mostRecentlyDeployed = DevOpsTools.get_most_recent_deployment( // the way this works is it look inside of the
            "FundMe", //.. broadcast folder based off the chain id then picks this run list and grabs the most recently
            block.chainid //.. deployed contract in that file
        );
        vm.startBroadcast();
        fundFundMe(mostRecentlyDeployed);
        vm.stopBroadcast();
    }
}

contract WithdrawFundMe is Script {
    function withdrawFundMe(address mostRecentlyDeployed) public {
        vm.startBroadcast();
        FundMe(payable(mostRecentlyDeployed)).withdraw();
        vm.stopBroadcast();
    }

    function run() external {
        address mostRecentlyDeployed = DevOpsTools.get_most_recent_deployment(
            "FundMe",
            block.chainid
        );

        //  vm.startBroadcast();
        withdrawFundMe(mostRecentlyDeployed);
        //vm.stopBroadcast();
    }
    // contract WithdrawFundMe is Script {
    //     function run() external {
    //         address mostRecentlyDeployed = DevOpsTools.get_most_recent_deployment(
    //             "FundMe",
    //             block.chainid
    //         );
    //         vm.startBroadcast();
    //         withdrawFundMe(mostRecentlyDeployed);
    //         vm.stopBroadcast();
    //     }

    //     function withdrawFundMe(address mostRecentlyDeployed) public {
    //         vm.prank(msg.sender);
    //         FundMe(payable(mostRecentlyDeployed)).withdraw();
    //         console.log("Withdrew funds");
    //     }
}
