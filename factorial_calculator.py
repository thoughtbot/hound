class FactorialCalculator:
    def calculate_factorial(self, n):
        if n < 0:
            return None  # Factorial is not defined for negative numbers
        elif n == 0:
            return 1  # Factorial of 0 is 1
        else:
            result = 1
            for i in range(1, n + 1):
                result *= i
            return result

# Usage example:
calculator = FactorialCalculator()
number = 5
result = calculator.calculate_factorial(number)
print(f"The factorial of {number} is {result}")
