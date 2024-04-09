# Example Python script with intentional errors

# Function to calculate factorial
def factorial(n):
    if n == 0:
        return 1
    else:
        return n * factorial(n-1)

# Function to check if a number is prime
def is_prime(num):
    if num <= 1:
        return False
    for i in range(2, num):
        if num % i == 0:
            return False
    return True

# List comprehension to generate Fibonacci sequence
fibonacci = [0, 1]
n = 10
for i in range(2, n):
    fibonacci.append(fibonacci[i-1] + fibonacci[i-2])

# Function to demonstrate divide by zero error
def divide_by_zero():
    return 10 / 0

# Intentional error: Calling undefined function
undefined_function()

# Intentional error: Index out of range
example_list = [1, 2, 3]
print(example_list[3])

# Intentional error: Syntax error
for i in range(5)
    print(i)

# Intentional error: Unused variable
unused_variable = 10

# Intentional error: Typo in variable name
result = factorial(5)
print("Factorial of 5 is:", reslut)  # Typo: reslut instead of result
