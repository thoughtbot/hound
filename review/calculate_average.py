def calculate_average(numbers):
    if len(numbers) == 0:
        return None
    total = sum(numbers)
    average = total / len(numbers)
    return average

# Test the function
numbers_list = [10, 20, 30, 40, 50]
result = calculate_average(numbers_list)
print("Average:", result)
