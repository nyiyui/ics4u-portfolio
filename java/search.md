---
title: Search
---

## Linear/Sequential Search

This search is just looping through the array and checking if the current value matches.

```java
/**
 * Linear search. Returns -1 if not found.
 * @param a array to search through
 * @param t target value to find
*/
int linearSearch(int[] a, int t) {
    for (int i = 0; i < a.length; i ++)
        if (a[i] == t) return i;
    return -1;
}
```

## Binary Search

Binary search is a simple search algorithm. It assumes a sorted array is given, and finds an element by finding if the value is on the right or left of the current element. Binary search can work on partially ordered values such as floats, but the result may be indeterminate.

Note: "left" here means the descending direction (i.e. as the index goes left, the values decrease).

```
binary-search(a t l r)
  if l > r
    return no-element-found
  m = floor((l+r)/2) # middle
  if a[m] == t
    return m
  else if a[m] < t
    return binary-search(a t m+1 r)
  else if a[m] > t
    return binary-search(a t l m-1)
```

Here's some Java code.

```java
int binarySearch(int[] a, int t, int l, int r) {
    while (true) {
        if (l > r)
            return -1;
        int m = (l+r)/2;
        if (a[m] == t)
            return m;
        else if (a[m] < t) {
            // tail call binarySearch(a, t, m+1, r)
            l = m+1;
        } else if (a[m] > t) {
            // tail call binarySearch(a, t, l, m-1)
            r = m-1;
        } else {
            // unreachable
            assert false;
        }
    }
}
```

Let's illustrate an example. `l`, `m`, and `r` are set to the left and right of the array, and `t = 2`.

```
[0 1 2 3 4 5 6 7 8 9]
 ^       ^         ^
 l       m         r
```

As 4 is more than 2, we move the window to the left half:

```
[0 1 2 3 4 5 6 7 8 9]
 ^ ^   ^
 l m   r
```

As 1 is less than 2, we move the window to the right half:


```
[0 1 2 3 4 5 6 7 8 9]
     ^ ^
     l r
     m
```

As `a[m] == t`, we found our value.

Let's say we didn't find our value here:

```
[0 1 3 3 4 5 6 7 8 9]
     ^ ^
     l r
     m
```

Then, we would go to:

```
[0 1 3 3 4 5 6 7 8 9]
   ^ ^
   r l
     m
```

And then as `l > r`, we would return `no-element-found`.
