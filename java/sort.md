---
title: "Sort"
---

## Insertion Sort

Time complexity: O(n²) (average case)
Space complexity: O(n)

Insertion sort is simple: take each element one-by-one, and find where it fits in the new sorted position.

Insertion sort is slow for large (say length > 16), but is simple and efficient for small ones.
Therefore, a common optimisation (for e.g. Quicksort, WikiSort, and TimSort) is to sort small chunks with insertion sort.

```
a = [3 9 2 5]
for i in [1, length of a) # take each element one-by-one
    j = i
    while j > 0 and a[j-1] > a[j] # swap-move a[j] until its sorted on both sides (a[j-1] > a[j]) (j > 0 is for when the value does to the leftmost position)
        swap a[j] and a[j-1]
        j --
```

```java
void insertionSort(int a[]) {
    for (int i = 0; i < a.length; i ++) {
        int tmp = a[i];
        int j = i-1;
        while (j > 0 && a[j-1] > a[j]) {
            a[j+1] = a[j];
            j --;
        }
        a[j+1] = tmp;
    }
}
```

## Selection Sort

Time complexity: O(n²) (average case)
Space complexity: O(1)

In selection sort, we find the element with the maximum (or minimum) value and swap it to the left- or right- most side.

```
[3 9 2 5]
 ^~~~~~~
 search here
swap 9 to right
[3 5 2 9]
 ^~~~~
swap 5 to right
[3 2 5 9]
 ^~~
swap 3 to right
[2 3 5 9]
```

I think this is simple enough that we don't need pseudocode:

```java
void selectionSort(int a[]) {
    for (int r = a.length-1; r > 0; r --) {
        int max = Integer.MIN_VALUE;
        int maxI = 0;
        for (int i = 0; i < r; i ++) {
            if (max < a[i]) {
                max = a[i];
                maxI = i;
            }
        }
        int tmp = a[r];
        a[r] = a[maxI];
        a[maxI] = tmp;
    }
}
```

## Quicksort

Time complexity: O(n log n) (average case)
Space complexity: O(n)

The main idea of quicksort is to split the array into two parts that meet the following: all elements of the LHS part must be smaller than the pivot, while all elements of the RHS part must be equal to or larger than the pivot. Then, we sort the parts separately, which makes the whole array sorted.

```
[4   2   1   9   0]
         ^ pivot
[0   1   4   2   9]
     ^ pivot
[0   1   4   2   9]
         ^~~~~~~~~
             ^ pivot
[0   1   2   4   9]
```

```java
void quicksort(int a[]) {
    quicksort(a, 0, a.length-1);
}

void quicksort(int a[], int l, int r) {
    if (l >= r || l < 0) return;
    int p = partition(a, l, r);
    quicksort(a, l, p-1);
    quicksort(a, p+1, r);
}

int partition(int a[], int l, int r) {
    int pivot = a[r];
    int i = l-1;
    for (int j = l; j < r; j ++) {
        if (a[j] > pivot) continue;
        i ++;
        int tmp = a[i];
        a[i] = a[j];
        a[j] = tmp;
    }
    i ++;
    int tmp = a[i];
    a[i] = a[r];
    a[r] = tmp;
    return i;
}
```

## Merge Sort

Time complexity: O(n log n) (average case)
Space complexity: O(n)

We'll cover a simple sorting algorithm, merge sort.

Merge sort works by splitting an array into several blocks (subarrays):

```
[8   3   1   5   7   3]
[8] [3] [1] [5] [7] [3]
```

And then "merging" each block together:

```
[8] [3] [1] [5] [7] [3]
[3   8] [1   5] [3   7]
[1   3   5   8] [3   7]
[1   3   3   5   7   8]
```

The splitting-into-blocks part should be self-explanatory, so we'll cover the merging part the most.

First, let's cover merging two blocks of length 1 each:

```
[9] [3]
[3   9]
```

As you can see, we'll sort as we're merging. We put the smallest element first.

```
[3   9] [2   5]
[2   ?   ?   ?] # take lowest of the 2 firsts
[3   9] [2   5]
 ^           ^ compare these two
[2   3   ?   ?] # take lowest (3)
[2   3   5   9] # repeat until done
```

Aand... we're done. We just merge blocks of size 1 until we have 1 large block with the same size as the original array.

Here's the pseudocode for merging:

```
merge(a, l, r, e, merged):
  i, j = l, r # pointers to currently merging elem of the left and right blocks
  for k in [l, e):
    if i < r and (j >= e or a[i] >= a[j]):
      # i < r - we still have stuff remaining on the left block (if we used i up, then it would be at r - 1 after the end of the left block)
      # j >= e - we've used up the right array (at the end)
      # a[i] <= a[j] - the left is smaller
      merged[k] = a[i] # - take left element
      i = i + 1
    else:
      # we've used up the left array
      merged[k] = a[j]
      j = j + 1
  # merged contains the merged and sorted array
```

And we can call this repeatedly to sort the whole array:

```
merge-sort(a)
  n = length of a
  b = array of identities (zeroes) with length of n
  for width in [1, 2, 4, ...]:
    for i in [0 to n with 2*width apart]:
      merge(a, i, min(i+width, n), min(i+2*width, n), b)
      #           ^                ^
      #           prevent merging outside of array
    copy from b to a
```
