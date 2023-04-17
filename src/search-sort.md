# Search and Sort

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
