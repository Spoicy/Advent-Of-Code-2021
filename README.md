# Advent Of Code 2021
Welcome to my repository for Advent of Code 2021. I'm partaking this year and using this opportunity to learn more about Bash/Shell Scripting. I will be documenting my progress here as well as the things I have learned throughout the project.

## Things that I've learned:
---
### Day 1

- If having trouble with data types, you can declare the type of the variable with **declare** and using an option (i.e -i)
- If-statements use two different syntaxes, either [ *condition* ] **or** ((*condition*)). The square brackets method is based on the command **test** and uses the same operators. The double brackets is a light variation and can be used for more complex conditions.
- If you need to read from a file, you can use **while read** to effectively do so.
- To get the length of an array, you can use @ or * to call all elements and prefixing # to get the number of elements.

### Day 2

- **set - $var** is bash's equivalent of PHP's explode, and the string is split up into numbered variables (i.e. $1, $2, $3, etc.). The default separator is whitespace, but can be set with the variable **IFS**.

### Day 3

- Bash only has one-dimensional arrays. It does have associative arrays if required.
- You cannot nest a **${}** mechanism inside itself.
- **while read** skips the last line for some unknown reason that I'm not quite sure of yet.
- Bash is also absolutely not intended for such tasks, but that's okay, it makes it all the more satisfying when it works. But it will also be complete hell.

### Day 4

- You can use **read -a *variable_name* <<< *string*** to accomplish the same thing as **set - $var**, but instead of the string being split up into numbered variables, it is split up into elements of an array. This process is **noticeably** slower than **set - $var** and will result in extremely slow processing time if used excessively. It should not be used if processing time is vital. Otherwise it allows you to do more complex functionality as you have more leeway with arrays.
- Using pipes "|" as a delimiter does not work with Bash for reasons currently unknown to me.