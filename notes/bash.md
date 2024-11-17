
# Bash Notes 

This page is dedicated to info regarding bash scripting  

# Bash Conditionals Examples

You can find a link to the GNU manual below. 

> Reference: ![GNU Bash Conditionals](https://www.gnu.org/software/bash/manual/html_node/Bash-Conditional-Expressions.html)

## 1. If-Else Conditional

### Syntax:
```bash
if [ condition ]; then
  # Code to execute if condition is true
elif [ another_condition ]; then
  # Code to execute if another_condition is true
else
  # Code to execute if none of the above conditions are true
fi
```

### Example:
```bash
#!/bin/bash
num=10

if [ $num -gt 5 ]; then
  echo "$num is greater than 5"
elif [ $num -eq 5 ]; then
  echo "$num is equal to 5"
else
  echo "$num is less than 5"
fi
```

---

## 2. Comparison Operators

### Numeric Comparisons:
| Operator | Description                   | Example                |
|----------|-------------------------------|------------------------|
| `-eq`    | Equal to                      | `[ $a -eq $b ]`       |
| `-ne`    | Not equal to                  | `[ $a -ne $b ]`       |
| `-gt`    | Greater than                  | `[ $a -gt $b ]`       |
| `-ge`    | Greater than or equal to      | `[ $a -ge $b ]`       |
| `-lt`    | Less than                     | `[ $a -lt $b ]`       |
| `-le`    | Less than or equal to         | `[ $a -le $b ]`       |

### String Comparisons:
| Operator | Description                   | Example                |
|----------|-------------------------------|------------------------|
| `=`      | Strings are equal            | `[ "$a" = "$b" ]`      |
| `!=`     | Strings are not equal        | `[ "$a" != "$b" ]`     |
| `<`      | String is less than (lexicographically)| `[ "$a" \< "$b" ]` |
| `>`      | String is greater than       | `[ "$a" \> "$b" ]`     |
| `-z`     | String is empty              | `[ -z "$a" ]`          |
| `-n`     | String is not empty          | `[ -n "$a" ]`          |

---

## 3. Logical Operators

| Operator | Description       | Example                          |
|----------|-------------------|----------------------------------|
| `!`      | Logical NOT       | `[ ! condition ]`               |
| `&&`     | Logical AND       | `[ condition1 ] && [ condition2 ]` |
| `||`     | Logical OR        | `[ condition1 ] || [ condition2 ]` |

### Example:
```bash
is_admin=true
is_logged_in=true

if [ "$is_admin" = "true" ] && [ "$is_logged_in" = "true" ]; then
  echo "Access granted"
else
  echo "Access denied"
fi
```

---

## 4. Using `[[` for Advanced Conditions

`[[` is more flexible than `[`. It supports pattern matching and avoids certain pitfalls.

### Example:
```bash
str="Hello"
if [[ $str == H* ]]; then
  echo "String starts with H"
fi
```

---

## 5. Case Statement

### Syntax:
```bash
case $variable in
  pattern1)
    # Code to execute if pattern1 matches
    ;;
  pattern2)
    # Code to execute if pattern2 matches
    ;;
  *)
    # Default case
    ;;
esac
```

### Example:
```bash
#!/bin/bash
fruit="apple"

case $fruit in
  apple)
    echo "It's an apple!"
    ;;
  banana)
    echo "It's a banana!"
    ;;
  *)
    echo "Unknown fruit."
    ;;
esac
```

---

## 6. File Tests

| Operator | Description                       | Example                 |
|----------|-----------------------------------|-------------------------|
| `-e`     | File exists                      | `[ -e file ]`           |
| `-f`     | File exists and is a regular file| `[ -f file ]`           |
| `-d`     | Directory exists                 | `[ -d directory ]`      |
| `-r`     | File is readable                 | `[ -r file ]`           |
| `-w`     | File is writable                 | `[ -w file ]`           |
| `-x`     | File is executable               | `[ -x file ]`           |
| `-s`     | File is not empty                | `[ -s file ]`           |

### Example:
```bash
#!/bin/bash
file="example.txt"

if [ -f "$file" ]; then
  echo "$file exists and is a regular file."
else
  echo "$file does not exist."
fi
```

---

## Summary
- Use **`if`**, **`case`**, and logical operators for branching.
- Use **`[ ]`** or **`[[ ]]`** for conditions.
- Combine numeric, string, and file tests as needed.

These tools are the foundation of Bash scripting logic.
