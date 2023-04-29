---
title: ArrayList
---

ArrayLists in Java are more like list in Python or slices in Go. They can be dynamically resized and appended to. They are also backed (in memory/by implementation) by boring arrays.

## Introduction

Similar to slices in Go, ArrayLists in Java have a size and capacity. This is because of how ArrayLists are implemented:

```
backing array:
[1 2 3 4 5 6 7 ? ? ? ?]
 ^size~~~~~~~~
 ^capacity~~~~~~~~~~~~
```

ArrayLists are implemented with arrays, and they are reallocated when the required data does not fit the current array:

```
[1 2 3 ? ? ?]
add [4 5 6 7]
[1 2 3 4 5 6 7 ? ?]
```

Note that the new length of the backing array is not specified.

The capacity points to the length of the backing array, while the size is the amount of used space.

## Usage

An `ArrayList` is a generic class. Therefore, it takes a single type (which is type-erasured[^1] before runtime). Due to Java-isms, we need to use classes, not primitive types (e.g. `Double` instead of `double`).

```java
ArrayList<Double> temperatures = new ArrayList<Double>();
// class in new is optional as can be seen below:
// we can also specify a capacity
ArrayList<ArrayList<Boolean>> gameOfLifeState = new ArrayList<>(capacity);

for (int i = 0; i < 4; i ++)
    temperatures.add(25.0);
// array is like: [25.0 25.0 25.0 25.0]

assert temperatures.size() == 4;
// use size to get length of used part

assert !temperatures.isEmpty();
// returns true if size is 0

temperatures.add(0, 4.0);
// shift elements to make space:
// [4.0 25.0 25.0 25.0 25.0]
// so, temperatures.add(v) is equivalent to temperatures.add(temperatures.size(), v)

temperatures.add(2, 2.0);
// now [4.0 25.0 2.0 25.0 25.0 25.0]

temperatures.remove(0);
// remove object at index
// now [25.0 2.0 25.0 25.0 25.0]

assert temperatures.remove(25.0);
// remove object first occurence of value and returns true
// now [2.0 25.0 25.0 25.0]

assert temperatures.contains(25.0);

for (int i = 0; i < temperatures.size(); i ++) {
    System.out.println(temperatures.get(i));
}

// as ArrayList implementes the List interface, for-each loops can be used
for (Double temp : temperatures) {
    System.out.println(temp);
}
// for-each loops may seem cleaner, but can only increment by one and don't show the index.
```

## Auto(un)boxing

Although we used class type (e.g. `Integer`) instead of primitive types (e.g. `int`), we can still somewhat-ergonomically use primitive types with ArrayLists with a feature called autoboxing:

```
ArrayList<Integer> a = new ArrayList<>();
int b = 10;
a.add(b); // autoboxed from int to Integer type
int c = a.get(0); // we can also do the opposite, autounboxing
```

## Bibliography

- https://docs.oracle.com/javase/tutorial/java/data/autoboxing.html

[^1]: See more: https://docs.oracle.com/javase/tutorial/java/generics/erasure.html
