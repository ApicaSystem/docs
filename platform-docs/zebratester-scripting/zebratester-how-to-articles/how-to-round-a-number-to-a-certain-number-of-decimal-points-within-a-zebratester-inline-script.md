# How to round a number to a certain number of decimal points within a ZebraTester Inline Script

It is possible to implement rounding of numbers within a ZebraTester script by converting the given number to a string and then creating a substring of the value out of the first number in the string and the number _after_ the desired rounding place. Consider the following example:

```
a = "1.624000000000002" 
b = strSubString(a,"1","4") 
print b #this is a comment as denoted by the # character - "b" is now 1.62
```



In the above example, strSubString method uses “1” and the “4” in “1.624” to create a new value shortened to the value before “4” - that is, 1.62.
