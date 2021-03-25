pragma solidity ^0.7.0;
pragma experimental ABIEncoderV2;
import './Administrator.sol';
import './User.sol';
import './BookFactory.sol';

contract Library {
    Administrator administrator = new Administrator();
    User bob = new User();
    User tom = new User();
    
    function addBook(string memory _name) public {
        administrator.addBook(_name);
    }
    function getAllBooks() public view returns (Book[] memory) {
        return administrator.fetchBooks();
    }
    function borrowBook(uint bookId) public {
        administrator.transfer(address(administrator), address(tom), bookId);
    }
    function returnBook(User user, uint bookId) public {
        user.returnBook(address(administrator), bookId);
    }
}
