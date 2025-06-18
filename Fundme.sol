// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {PriceConverter} from "./price_converter.sol";

contract FundMe{
    using PriceConverter for uint256;

    uint256 public constant minimumUSD = 5e18;

    address[] public funder;
    mapping(address funder => uint256 amountFunded) public funderToAmount;

    address public immutable owner;

    constructor(){
        owner = msg.sender;
    }

    function fund() public payable{
        require(msg.value.getConversionRate() >= minimumUSD, "did not send enough ETH!");
        funder.push(msg.sender);
        funderToAmount[msg.sender] = funderToAmount[msg.sender] + msg.value;
    }
    function withdraw() public onlyOwner{
        for(uint256 funderIndex = 0; funderIndex < funder.length; funderIndex++){
            address funders = funder[funderIndex];
            funderToAmount[funders] = 0;
        }
        funder = new address[](0);
        (bool callSuccess, ) = payable(msg.sender).call{value : address(this).balance}("");
        require(callSuccess, "ETH withdraw failed.");
    }

    modifier onlyOwner(){
        require(msg.sender == owner, "Should be owner.");
        _;
    }
}
