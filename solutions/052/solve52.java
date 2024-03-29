// https://projecteuler.net/problem=52
// Run with: 'javac solve52.java && java Solve52'
// using openjdk version 11.0.10 and javac 11.0.10
// by Zack Sargent

/* Prompt:

It can be seen that the number, 125874, and its double, 251748, contain exactly 
the same digits, but in a different order.

Find the smallest positive integer, x, such that 2*x, 3*x, 4*x, 5*x, and 6*x,
contain the same digits.
*/

import java.util.*;
import java.util.stream.Collectors;

class Solve52 {
    private static String sort(int i) {
        String str = Integer.toString(i);
        char[] chars = str.toCharArray();
        Arrays.sort(chars);
        return new String(chars);
    }

    private static String uniqDigits(int i, int x) {
        return sort(i * x).chars()
            .mapToObj(e -> (char)e)
            .distinct()
            .map(String::valueOf)
            .collect(Collectors.joining());
    }

    private static boolean check(int x) {
        String ref = uniqDigits(2, x);
        return (ref.equals(uniqDigits(3, x)) && 
                ref.equals(uniqDigits(4, x)) && 
                ref.equals(uniqDigits(5, x)) && 
                ref.equals(uniqDigits(6, x)));
    }

    public static void main(String[] args) {
        int x = 1;
        while (!check(x)) {
            x++;
        }
        System.out.println(x);
        // -> 142857
    }
}

