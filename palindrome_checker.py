def is_palindrome(s):
    """Check if a string is a palindrome."""
    s = s.lower()  # Convert string to lowercase for case-insensitive comparison
    # Remove spaces and punctuation
    s = ''.join(char for char in s if char.isalnum())
    return s == s[::-1]  # Compare the string with its reverse

def main():
    user_input = input("Enter a string to check if it's a palindrome: ")
    if is_palindrome(user_input):
        print(f"'{user_input}' is a palindrome.")
    else:
        print(f"'{user_input}' is not a palindrome.")

if __name__ == "__main__":
    main()
