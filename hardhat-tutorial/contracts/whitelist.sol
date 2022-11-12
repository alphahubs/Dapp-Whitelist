//SPDX-License-Identifier: Unlicense

pragma solidity ^0.8.17;

contract Whitelist {
    
    //The maximum number of whitelisted addressed allowed
    uint public maxWhitelistedAddresses;

    //mapping of whitelistedAddresses
    mapping (address => bool) public whitelistedAddresses;

    //numAddressesWhitelisted would be used to keep track of how many addresses have been whitelisted
    uint8 public numAddressesWhitelisted;

    //Setting the max number of whitelisted addresses
    //User will put the value at the time of deployment
    constructor(uint8 _maxWhitelistedAddresses) {
        maxWhitelistedAddresses = _maxWhitelistedAddresses;
    }

    /**
     * addAddressToWhitelist - This function adds the address of the sender to the whitelist
     */

    function addAddressToWhitelist() public {
        //check if the user has already been whitelisted
        require(!whitelistedAddresses[msg.sender], "Sender has already been whitelisted");
        // check if the numAddressesWhitelisted < maxWhiteListedAddresses, if not then throw an error.
        require(numAddressesWhitelisted < maxWhitelistedAddresses, "More addresses cant be added, limit reached");
        // Add the address which called the function to the WhitelistedAddresses array
        whitelistedAddresses[msg.sender] = true;
        //Increase the number of whitelisted addresses
        numAddressesWhitelisted += 1;
    }
    
}