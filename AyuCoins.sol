// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

// This line imports the ERC-20 token standard from OpenZeppelin (OZ). 
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";

// This specifies a new contract, named LW3Token, in our Solidity file.
// Also, it says that this contract is an instance of ERC20. 
// ERC20 in this case refers to the standard contract we imported from OpenZeppelin.
contract AyuToken is ERC20 {
    // constructor function that is called when the smart contract is first deployed. 
    // Within the constructor, we want two arguments from the user - _name and _symbol which specify the name and symbol of our cryptocurrency.
    // The ERC20 contract we imported from OpenZeppelin has its own constructor
    // we are providing _name and _symbol variables to our contract, which we immediately pass on to the ERC20 constructor, thereby initializing the ERC20 smart contract.
    constructor(string memory _name, string memory _symbol) ERC20(_name, _symbol) {
        // _mint is an internal function within the ERC20 standard contract, which means that it can only be called by the contract itself. External users cannot call this function.
        // we call _mint to receive some token when we deploy this contract.
        // msg.sender is a global variable injected by the Ethereum Virtual Machine, which is the address which made this transaction.
        // Solidity does not support floating point numbers - that is decimals. Also, since ERC20 tokens deal with money, using floating point numbers is a bad idea.
        // we represent every currency as an amount relative to the smallest indivisible part of that currency.
        // ERC20 tokens by default work with 18 decimal places. So 1 full LW3Token in this case, is actually represented as 10 ^ 18. Therefore, to get 10 full AyuTokens, we use 10 * 10 ** 18.

        _mint(msg.sender, 10 * 10 ** 18);
    }
    // Made _mint a public function in the name of "mint", which means I allowed unlimited supply of token.
    // Any body can get this many tokens by just calling the mint functio
    function mint() public{
        _mint(msg.sender, 10 * 10 ** 18);
    }
}
