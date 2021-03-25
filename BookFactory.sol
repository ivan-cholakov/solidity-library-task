pragma solidity ^0.7.0;
pragma experimental ABIEncoderV2;

struct Book {   
    string name;
}

contract BookFactory {
    mapping (uint => address) public bookToOwner;
    mapping (address => uint) ownerBookCount;
    mapping (uint => address[]) public bookOwners;
    
    event Transfer(address from, address to, uint256 tokenId);
    
    Book[] public books;
    
    modifier ownerOf(uint _bookId) {
        require(msg.sender == bookToOwner[_bookId]);
        _;
    }
    
    function fetchBooks() public view returns (Book[] memory) {
        return books;
    }
    
    function transfer(address _from, address _to, uint _bookId) public {
        ownerBookCount[_to] = ownerBookCount[_to]++;
        ownerBookCount[msg.sender] = ownerBookCount[msg.sender]--;
        bookToOwner[_bookId] = _to;
        bookOwners[_bookId].push(_to);
        emit Transfer(_from, _to, _bookId);
    }
    
    function getBookOwners(uint _bookId) public view returns (address[] memory) {
        address[] memory result = new address[](255);
        for(uint i = 0; i < bookOwners[_bookId].length -1; i++) {
          result[i] = bookOwners[_bookId][i];
        }
        return result;
    }
}
