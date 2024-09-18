def count_num(arr):
    count_dict = {}
    data = set()
    for num in arr:

        if num in data:
            count_dict[num] += 1

        elif num not in data:
            data.add(num)
            count_dict[num] = 1

    return count_dict

def bubble_sort(arr):
    for i in range(len(arr)-1, 0, -1):
        swapped = False

        for j in range(i):
            if arr[j][1] < arr[j+1][1]:
                swapped = True
                arr[j], arr[j+1] = arr[j+1], arr[j]

        if not swapped:
            return


inp = list(int(i) for i in input("Enter list  of numbers: ").split())

x = count_num(inp)

x_list = list(x.items())
bubble_sort(x_list)

for num, count in x_list:
    print(f"number {num}, total: {count}")