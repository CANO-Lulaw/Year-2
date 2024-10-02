def first_greater_value(arr, target):
    l, h = 0, len(arr) - 1
    result = None
    while l <= h:
        mid = (l + h) // 2
        if arr[mid] > target:
            result = arr[mid]
            h = mid - 1
        else:
            l = mid + 1
    return result if result is not None else "No First Greater Value"

inp = input("Enter Input : ").split('/')
left, right = list(map(int, inp[0].split())), list(map(int, inp[1].split()))

sorted_left = sorted(left) 

for value in right:
    print(first_greater_value(sorted_left, value))
