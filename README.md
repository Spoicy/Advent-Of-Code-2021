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

### Day 5
- Excessive use of commands in general makes your script perform very slowly. If you know that your script will utilize thousands of scripts, you can either rewrite your script to not use a command or group multiple commands at once using **&** and appending **wait** at the end to then run simultaneously to cut down on time.
- Using **echo $string | sed s/./*char*/*pos*** you can replace a character in a string. This is what I did originally before opting to not use commands.

### Day 6
- For exponential functions, it is crucial you break down your script to as barebones as possible. For Part One I did not end up doing this, and it tooks far too long to process 80 days, and would not at all be possible to run the same script for Part Two. For the Part Two solution I ended up giving up and searching for other people's Bash solutions for it. I stumbled upon Reddit user "shrewm"'s solution, which I ended up copying for my solution. It taught me to simplify your code in ways that reduce the amount of steps your script needs to run through everything. Instead of running through millions of values each loop, you could simplify them to 9 counters in order to reduce the amount of values you need to look at each loop down to just one.
- In summary: **The most logical solution isn't always the most optimal. Reduce the amount of steps needed per loop by simplifying your code, i.e. simplying the way your data is stored, in this instance.**