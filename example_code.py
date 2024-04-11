def is_prime(number):
    """Check if a number is prime."""
    if number <= 1:
        return False
    for i in range(2, int(number**0.5) + 1):
        if number % i == 0:
            return False
    return True

def main():
    """Main function to test prime number check."""
    test_numbers = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29]
    for num in test_numbers:
        if is_prime(num):
            print(f"{num} is prime")
        else:
            print(f"{num} is not prime")

if __name__ == "__main__":
    main()
