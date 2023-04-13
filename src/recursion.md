# Recursion

Recursion is a (in my opinion) beautiful way to declaratively represent functions.

Let's take the example of the Fibonacci numbers. A classical (not particularly effective) Haskell implementation is as follows:

```haskell
# means fib(n=0) returns 0
fib 0 = 0
fib 1 = 1
# used when n is not 0 or 1
fib n = fib (n-1) + fib (n-2)
```

Here, `fib 0` is defined as `0`, 1 as 1, and `fib n` is defined as the penultimate plus the antepenultimate value.

An iterative implementation of the above (in Python) is as follows:

```python
def fib(n):
    a, b = 0, 1 # two latest parts of the sequence
    for _ in range(n):
        a, b = b, a + b
    return a
```

As you can see, the iterative implementation is less declarative (farther away in terms of representation from what we want to implement).
This generally means the code is more confusing (or [clever!](https://dave.cheney.net/paste/clear-is-better-than-clever.pdf)).

## Tail Calls

In recursion, a tail call is a (series of) function(s) that calls itself as the *last* instruction the machine executes.

```python
def fib(n, a=0, b=1): # same as a and b in the above (iterative) example
    if n == 0:
        return a
    elif n == 1:
        return b
    return fib(n-1, b, a+b) # <- the tail call
```

In this case, we can rewrite the tail call to be this:

```go
func fib(n int, a int, b int) int {
Start:
    if (n == 0) { return a }
    if (n == 1) { return b }
    // instead of a tail call, we can jump to the start of the function:
    n = n-1
    oldB := b
    b = a+b
    a = oldB
    goto Start
}
```

This version would not use any more of stack space (function calls).

Some functional languages optimise away tail calls (called tail call optimisation) to reduce the stack space used.

## In Java

Finally, in Java! Recursion is actually pretty simple, as there is no tail call optimisation, etc.
