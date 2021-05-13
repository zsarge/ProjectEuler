// https://projecteuler.net/problem=28
// Run with: 'javac solve28.java && java Solve28'
// using openjdk version 11.0.10 and javac 11.0.10
// by Zack Sargent

/* Prompt:


   Starting with the number 1 and moving to the right in a clockwise direction a 5 by 5 spiral is formed as follows:

   21 22 23 24 25
   20  7  8  9 10
   19  6  1  2 11
   18  5  4  3 12
   17 16 15 14 13

   It can be verified that the sum of the numbers on the diagonals is 101.
   What is the sum of the numbers on the diagonals in a 1001 by 1001 spiral formed in the same way?

*/

// I'm sure there's some mathematical way to do this,
// but I just modeled the situation because I'm trying not to look up any answers.

class Position {
	private int x;
	private int y;

	private enum Direction {
		UP, DOWN, LEFT, RIGHT
	};

	private Direction direction;
	private int limit;
	private int moves;
	private boolean shouldIncrement;

	public Position(int size) {
		x = y = (size - 1) / 2;
		direction = Direction.RIGHT;

		limit = 0;
		moves = 1;
		shouldIncrement = true;
	}

	public int getX() {
		return x;
	}

	public int getY() {
		return y;
	}

	private void move() {
		moves++;
		switch (direction) {
			case RIGHT:
				x++;
				break;
			case DOWN:
				y--;
				break;
			case LEFT:
				x--;
				break;
			case UP:
				y++;
				break;
		}

	}

	private void turn() {
		switch (direction) {
			case RIGHT:
				direction = Direction.UP;
				break;
			case DOWN:
				direction = Direction.RIGHT;
				break;
			case LEFT:
				direction = Direction.DOWN;
				break;
			case UP:
				direction = Direction.LEFT;
				break;
		}
	}

	public void next() {
		move();
		if (moves > limit) {
			turn();
			moves = 0;
			shouldIncrement = !shouldIncrement;

			// turn twice before increasing limit of moves
			// thus building a spiral
			if (shouldIncrement)
				limit++;
		}
	}

	public void print() {
		System.out.println(String.format("(%s,%s)", x, y));
	}
}

class Spiral {
	private int[][] spiral;

	public Spiral(int size) {
		spiral = new int[size][size];

		Position pos = new Position(size);

		for (int i = 1; i <= size * size; i++) {
			spiral[pos.getY()][pos.getX()] = i;
			pos.next();
		}
	}

	public int[][] getSpiral() {
		return spiral;
	}

	public int getSumOfDiagonals() {
		int total = 0;
		// assume spiral is perfect square

		// from top left to bottom right
		for (int i = 0; i < spiral.length; i++) {
			total += spiral[i][i];
		}

		// from top right to bottom left
		for (int x = spiral.length - 1, y = 0; x >= 0; x--, y++) {
			total += spiral[y][x];
		}

		// account for cross-over in center
		// which will always equal 1
		total--;

		return total;
	}
}

class Solve28 {
	public static void main(String[] args) {
		Spiral spiral = new Spiral(1001);
		System.out.println(spiral.getSumOfDiagonals());
	}
}
