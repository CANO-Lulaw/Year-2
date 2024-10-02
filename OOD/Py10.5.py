def pack(weights, k, max_weight):
    sum_weight = 0
    box_count = 1

    for weight in weights:
        if sum_weight + weight > max_weight:
            box_count += 1
            sum_weight = weight
            if box_count > k:
                return False
        else:
            sum_weight += weight

    return True

def find_minimum_max_weigth(weights, k):
    low, hight = max(weights), sum(weights)

    while low < hight:
        mid = (low + hight) // 2
        if pack(weights, k, mid):
            hight = mid
        else:
            low = mid + 1

    return low

inp = input("Enter Input : ").split('/')
weights = list(map(int, inp[0].split()))
k = int(inp[1])

min_weight = find_minimum_max_weigth(weights, k)

print(f"Minimum weigth for {k} box(es) = {min_weight}")
