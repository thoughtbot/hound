# This is a sample Python code for testing Hound code review

class Calculator:
    def __init__(self):
        self.result = 0

    def add(self, num1, num2):
        self.result = num1 + num2

    def subtract(self, num1, num2):
        self.result = num1 - num2

    def multiply(self, num1, num2):
        self.result = num1 * num2

    def divide(self, num1, num2):
        if num2 != 0:
            self.result = num1 / num2
        else:
            print("Error: Division by zero")

# Example usage of the Calculator class
calculator = Calculator()
calculator.add(10, 5)
print("Result after addition:", calculator.result)

calculator.subtract(20, 7)
print("Result after subtraction:", calculator.result)

calculator.multiply(5, 6)
print("Result after multiplication:", calculator.result)

calculator.divide(12, 4)
print("Result after division:", calculator.result)

calculator.divide(10, 0)  # Testing division by zero
