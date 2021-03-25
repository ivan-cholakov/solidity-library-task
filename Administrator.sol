pragma solidity ^0.7.0;
pragma experimental ABIEncoderV2;
import './BookFactory.sol';

contract Administrator is BookFactory {
    event NewBook(uint bookId, string name);
    
    constructor() {
    }
    
    function addBook(string memory _name) public {
        Book memory book = Book(_name);
        books.push(book);
        bookToOwner[books.length-1] = msg.sender;
        emit NewBook(books.length-1, _name);
    }
}   