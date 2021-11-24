//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.3.3/contracts/token/ERC721/ERC721.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.3.3/contracts/token/ERC20/IERC20.sol";

contract BootcampNFT is ERC721 {
    address paymentTokenAddress = address(0);
    uint256 tokenId = 1;
    uint256 public totalSupply = 100;
    mapping(uint256 => string) private _tokenURIs;
    mapping(address => bool) private _addressPreviouslyMinted;

    constructor(string memory _name, string memory _symbol, address _paymentTokenAddress) ERC721(_name, _symbol) {
        paymentTokenAddress = _paymentTokenAddress;
    }

    function mint() public {
        require(!_addressPreviouslyMinted[msg.sender], "Cannot mint more than one token per wallet");
        require(totalSupply >= tokenId, "No more tokens available for mint");
        _processPayment();
        super._safeMint(msg.sender, tokenId);
        _tokenURIs[tokenId] = "https://ipfs.io/ipfs/QmceHjRwzGYtXweUtnBkU5sYssUsTaCHf5s8fgwFLDRoYJ";
        _addressPreviouslyMinted[msg.sender] = true;
        tokenId++;
    }

    function _processPayment() private {
        uint256 paymentAmount = 100 * (10**18);
        uint256 allowance = IERC20(paymentTokenAddress).allowance(msg.sender, address(this));
        require(allowance >= paymentAmount, "Check the token allowance");
        IERC20(paymentTokenAddress).transferFrom(msg.sender, address(this), paymentAmount);
    }

    function burn(uint256 _tokenId) public {
        require(super.ownerOf(_tokenId) == msg.sender);
        super._burn(_tokenId);
    }

    function tokenURI(uint256 _tokenId) public view override returns (string memory) {
        require(super.ownerOf(_tokenId) != address(0), "TokenId does not exist");
        return _tokenURIs[_tokenId];
    }
}