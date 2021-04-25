// https://projecteuler.net/problem=1
// Run with: 'javac solve1.java && java Solve1'
// using openjdk version 11.0.10 and javac 11.0.10
// by Zack Sargent

/* Prompt:

If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
Find the sum of all the multiples of 3 or 5 below 1000.

*/

class Solve1 {
    public static void main(String[] args) {
		int total = 0;

		for (int i = 0; i < 1000; i++) 
			if (i % 3 == 0 || i % 5 == 0) 
				total += i;

		System.out.println(total);
		// -> 233168
    }
}

