# Arrays

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

To get the length of an array use the `.length` attribute, like `temperatures.length`.

To get a specific element of the array, use the `array[index]` syntax, like so: `temperatures[0]` (equal to `-2`). (Indexes start with 0 as the first element.)
