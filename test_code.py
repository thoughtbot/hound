echo "# Fibonacci sequence generator" > test_code.py
echo "def fibonacci(n):" >> test_code.py
echo "    fib_sequence = [0, 1]" >> test_code.py
echo "    while len(fib_sequence) < n:" >> test_code.py
echo "        fib_sequence.append(fib_sequence[-1] + fib_sequence[-2])" >> test_code.py
echo "    return fib_sequence[:n]" >> test_code.py
echo "" >> test_code.py
echo "# Factorial function" >> test_code.py
echo "def factorial(n):" >> test_code.py
echo "    if n == 0:" >> test_code.py
echo "        return 1" >> test_code.py
echo "    else:" >> test_code.py
echo "        return n * factorial(n - 1)" >> test_code.py
echo "" >> test_code.py
echo "# Main function to test Fibonacci and factorial" >> test_code.py
echo "def main():" >> test_code.py
echo "    n = 10  # Adjust the value of n as needed" >> test_code.py
echo "    print(f\"Fibonacci sequence of {n} numbers:\")" >> test_code.py
echo "    fib_result = fibonacci(n)" >> test_code.py
echo "    print(fib_result)" >> test_code.py
echo "" >> test_code.py
echo "    print(f\"\\nFactorial of {n}:\")" >> test_code.py
echo "    fact_result = factorial(n)" >> test_code.py
echo "    print(fact_result)" >> test_code.py
echo "" >> test_code.py
echo "if __name__ == \"__main__\":" >> test_code.py
echo "    main()" >> test_code.py
