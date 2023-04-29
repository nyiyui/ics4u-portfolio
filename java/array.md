---
title: Arrays
---

Arrays in Java are similar to arrays in languages such as Python or Go. If you know them, only a quick skim is required. (Most concepts in Java are simple and boring, unlike, say, C `:()` )

Arrays are (conceptually) a list of objects. They are usually stored in contiguous parts of memory.
The following code block declares an array with 5 temperatures (although the size is not part of the type).

```java
int[] temperatures = { -2, 0, 4, 4, 5 };
# NOTE: the below is the same semantically
int temperatures[] = { -2, 0, 4, 4, 5 };
# You can also create a new blank array with a specific size:
int[] temperatures = new int[5];
```

Note that a blank array contains zero values (e.g. 0 for `int`, `null` for an object) in all elements.

If you look inside memory, you might see:

```
FFFFFFFE00000000000000040000000400000005
```

Where `FFFFFFFE` represents -2, and so on.

To get the length of an array use the `.length` attribute, like `temperatures.length`.

To get a specific element of the array, use the `array[index]` syntax, like so: `temperatures[0]` (equal to `-2`). (Indexes start with 0 as the first element.)

## C-style Syntax

Java also supports so-called C-style syntax for arrays:

```
// both lines are equivalent:
String   busStops[] = { /* ... */ };
String[] busStops   = { /* ... */ };
```

This is to (apparently) keep C (C++?) programmers less confused when learning Java.
Additionally, the C-style syntax is not preferred, as the former is more consistent with syntax.

## How to do anything with arrays, or, how to loop through arrays

Arrays can be looped using a normal for loop:

```java
int[] speeds = { 0, 2, 4, 6, 8 };
for (int i = 0; i < speeds.length; i ++) {
    System.out.printf("speed at index %d is %d", i, speeds[i]);
}
```

## Similarity to Objects

Arrays are not primitive types, and they have similar reference semantics to objects.
This means that when passing around an array, a reference to that array is passed around, like objects, unlike primitive types, for which their value is copied.

```
void youmax(int a[]) {
    a[0] = 1; // line 2
}

int b[] = new int[2];
b[0] = 123;
youmax(b);
assert b[0] == 1; // b[0] is now 1, as it was changed by line 2
```

## n-dimensional Arrays

Before we do n-dimensional arrays, what are 2D arrays? Simply put, they are arrays of arrays. The first index is used to point to an array, which itself points to an element.
If you think of a 2D array as a grid, `a[r][c]` is the element at row `r` and column `c`[^1].

[^1]: "row" and "column" here are arbitraily defined based on the literal representation of a 2D array.

```java
int a[][] = new int[2][3];
// ↑ same as ↓
int a[][] = {
  {0, 0, 0},
  {0, 0, 0}
};
```

The arrays we have seen so far have the same length for all arrays at the same level. Ones that do not are called ragged arrays:

```
String ragged[][] = {
  {"you"},
  {"you", "max"},
};
```

Iterating through 2D arrays use the same principles:

```java
int a[][] = new int[2][3];
for (int b[] : a) { // loop through 2D array
    for (int c : b) { // loop through array
        System.out.println(c)
    }
}
```

Similarly, higher dimensions can be defined as such:

```java
int a[][][] = new int[2][3][4];
// ↑ same as ↓
int a[][] = {
  { {0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0} },
  { {0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0} }
};
// iteration follows the same principle
for (int i = 0; i < a.length; i ++)
    for (int j = 0; j < a[i].length; j ++)
        for (int k = 0; k < a[i][j].length; k ++)
            System.out.printf("a[%d][%d][%d] = %d", i, j, k, a[i][j][k]);
```
