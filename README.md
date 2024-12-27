# Simple Calculator in Assembly

This project implements a simple command-line calculator in Assembly language, capable of performing basic arithmetic operations: addition, subtraction, multiplication, and division. The program takes user input for two numbers and an operator, performs the calculation, and outputs the result.

## Features

- Input two numbers from the user.
- Choose an arithmetic operation (`+`, `-`, `*`, `/`).
- Perform the corresponding arithmetic operation based on the user's input.
- Handle errors, including invalid operators and division by zero.
- Output the result or an error message.

## Requirements

To run this program, you will need:

- An x86-64 system (since the code is written for x86-64 architecture).
- An assembler and linker that supports the `NASM` syntax (e.g., **NASM** and **LD**).
- A Linux environment (the program uses Linux system calls).

## Building the Program

To assemble and link the program, follow these steps:

1. **Assemble the code:**

   ```bash
   nasm -f elf64 -o calculator.o calculator.asm

2. **Link the object file to create the executable:**
    ```bash
    ld -o calculator calculator.o
    ```

3. **Run the program:**
    ````bash
    ./calculator
    ```

## Program Workflow
1. The program prompts the user to enter the first number.
2. It then prompts for the second number.
3. The user is asked to enter an arithmetic operator (+, -, *, or /).
4. The program compares the operator and performs the corresponding calculation.
5. The result of the operation is printed to the screen.
6. If the user enters an invalid operator or tries to divide by zero, an error message is displayed.

# Example

### Valid Input:
```
Enter the 1st number : 10
Enter the 2nd number : 5
Enter the Operation symbol (+,-,*,/): +
Result: 15
```

### Invalid Input:
```
Enter the 1st number : 10
Enter the 2nd number : 0
Enter the Operation symbol (+,-,*,/): /
Cannot divide by zero!
```

### Error with invalid operator:
```
Enter the 1st number : 10
Enter the 2nd number : 5
Enter the Operation symbol (+,-,*,/): ^
Cannot perform operations, SORRY!
```

## Files
```calculator.asm``` : The main source code for the calculator.\
```util.asm``` : A utility file that includes helper functions like printstr, readint, etc., used in the program.\
```README.md``` : Documentation for the project.

## License
This project is licensed under the MIT License - see the LICENSE file for details.

Acknowledgments
Thanks to the NASM and Linux community for providing resources and tutorials.
