// SPDX-License-Identifier: MIT
pragma solidity 0.8.22;

//contract address = 0xD43e8ceE8475D2d5a3c7a209e447B0961cE6E13B
//deployed on eth sepolia https://sepolia.etherscan.io/address/0xD43e8ceE8475D2d5a3c7a209e447B0961cE6E13B

import "@api3/contracts/api3-server-v1/proxies/interfaces/IProxy.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract PriceFeed is Ownable {
    address public ShowPriceFeed;
    address public ProxyUSDT = 0x290B0fB170d075f466FeE83C4810f174D5C2610a;
    address public ProxyWBTC = 0x888F73D119F589031Fc84CA0Ef9c6611AFD46Bbb;
    address public ProxyETH = 0x925Bf88817d11b85A3B29BC38287d315A6749171;

    constructor ()Ownable(msg.sender) {}

    function Feed(address _priceFeed) external onlyOwner {
        ShowPriceFeed = _priceFeed;
    }
    function DataFeed() public view returns (uint256, uint256) {
        (int224 value, uint256 timestamp) = IProxy(ShowPriceFeed).read();
        uint256 price = uint224(value);
        return (price, timestamp);
    }
    function DataFeedUSDT() public view returns (int224 value, uint32 timestamp) {
    (value, timestamp) = IProxy(ProxyUSDT).read();
    }
    function DataFeedWBTC() public view returns (int224 value, uint32 timestamp) {
    (value, timestamp) = IProxy(ProxyWBTC).read();
    }
     function DataFeedETH() public view returns (int224 value, uint32 timestamp) {
    (value, timestamp) = IProxy(ProxyETH).read();
    }

}


