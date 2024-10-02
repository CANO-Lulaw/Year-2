def bi_search(l, h, arr, target):
    if l > h:
        return False
    mid = (l + h) // 2
    if arr[mid] == target:
        return True
    elif arr[mid] > target:
        return bi_search(l, mid - 1, arr, target)
    else:
        return bi_search(mid + 1, h, arr, target)

inp = input('Enter Input : ').split('/')
arr, target = list(map(int, inp[0].split())), int(inp[1])
print(bi_search(0, len(arr) - 1, sorted(arr), target))