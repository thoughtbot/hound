def subarray_with_given_sum(arr, target_sum):
    if not arr:
        return None
    
    current_sum = arr[0]
    start = 0
    
    for end in range(1, len(arr)):
        while current_sum > target_sum and start < end - 1:
            current_sum -= arr[start]
            start += 1
        
        if current_sum == target_sum:
            return arr[start:end]
        
        current_sum += arr[end]
    
    if current_sum == target_sum:
        return arr[start:]
    
    return None

# Example usage
arr = [1, 4, 20, 3, 10, 5]
target_sum = 33
result = subarray_with_given_sum(arr, target_sum)
print("Subarray with sum", target_sum, ":", result)
