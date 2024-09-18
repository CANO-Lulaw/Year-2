def findMedian(arr):
    quickSort(arr) 
    n = len(arr)

    if n % 2 == 1:  
        return float(arr[n // 2])
    else:  
        mid1 = arr[n // 2 - 1]
        mid2 = arr[n // 2]
        return (mid1 + mid2) / 2.0
    
def quickSort(arr):
    qSort(arr, 0, len(arr) - 1)

def qSort(arr, left, right):
    if left < right:
        p = partition(arr, left, right)
        qSort(arr, left, p - 1)
        qSort(arr, p + 1, right)

def partition(arr, left, right):
    pivot = arr[left]  
    i = left + 1
    j = right

    while True:
        while i <= j and arr[i] <= pivot:
            i += 1
        while i <= j and arr[j] >= pivot:
            j -= 1
        if i <= j:
            arr[i], arr[j] = arr[j], arr[i]
        else:
            break

    arr[left], arr[j] = arr[j], arr[left] 
    return j
    
l = [e for e in input("Enter Input : ").split()]
if l[0] == 'EX':
    Ans = "quick sort"
    print("Extra Question : What is a suitable sort algorithm?")
    print("   Your Answer : "+Ans)
else:
    l=list(map(int, l))

l1 = []
l2 = []

for i in l :
    l1.append(i)
    l2.append(i)
    median = findMedian(l1)
    print(f"list = {l2} : median = {median}")
