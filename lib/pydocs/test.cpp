/**
 *  @title      C++ Programming Examples
 *  @author     www.progamiz.com
 *
 *  @header     Display Armstrong Number Interval 
 *  @see        @{NA}
 *  
 *  This program asks the user to enter two integers and displays all Armstrong
 *  numbers between the given interval. If you don't know how to check whether a
 *  number is Armstrong or not in programming then, this program may seem a
 *  little complex.
 *  
 *  @custom user    User Tages
 *  @param  var     variable description
 *  
 *  @return     value       return decription
 *  @exception  NullPointer description for how this gets raised
 * 
 *  @since      1.2
 *  @version    1.0.5
 */

// This is from https://www.programiz.com/cpp-programming/
//                      examples/armstrong-number-interval
// and is an example of some code that pydocs can parse


/*
 * ajnfsoanfoanfnaosknmlmassmaofjnsonfanfsjanfojnao asf
 *
 *
 *
 */

#include <iostream>
#include <cmath>
using namespace std;

int main() {

  int num1, num2, i, num, digit, sum, count;

  cout << "Enter first number: ";
  cin >> num1;

  cout << "Enter second number: ";
  cin >> num2;

  // swap if num1 > num2
  if (num1 > num2) {
    num1 = num1 + num2;
    num2 = num1 - num2;
    num1 = num1 - num2;
  }
  
  cout << "Armstrong numbers between " << num1 << " and " << num2 << " are: " << endl;
 
  // print Armstrong numbers from num1 to num2
  for(i = num1; i <= num2; i++) {

    // count gives the number of digits in i
    count = 0;
         
    // store value of i in num
    num = i;

    // count the number of digits in num and i
    while(num > 0) {
      ++count;
      num /= 10;
    }
 
    // initialize sum to 0
    sum = 0;

    // store i in num again    
    num = i;
        
    // get sum of power of all digits of i
    while(num > 0) {
      digit = num % 10;
      sum = sum + pow(digit, count);
      num /= 10;
    }

    // if sum is equal to i, then it is Armstrong
    if(sum == i) {
      cout << i << ", ";
    }
  }

  return 0;
}
