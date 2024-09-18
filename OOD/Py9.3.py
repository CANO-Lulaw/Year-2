def insertion_sort1(arr,i):
    if i == len(arr):
        return
    iEle = arr[i]
    
    def insertion_sort2(arr,st):
        if arr[st-1] > iEle and st > 0:
            arr[st] = arr[st-1]
            return insertion_sort2(arr,st-1)

        else:
            arr[st] = iEle
            return st
        
    st = insertion_sort2(arr,i)

    if i == len(arr)-1 :
        print(f"insert {iEle} at index {st} : {arr[:i+1]}")
    
    else : print(f"insert {iEle} at index {st} : {arr[:i+1]} {arr[i+1:]}")

    insertion_sort1(arr,i+1)

inp = [int(i) for i in input("Enter Input : ").split()]
insertion_sort1(inp,1)
print("sorted")
print(inp)

# def insertion_sort(x):
#     for i in range(1,len(x)):

#         iEle = x[i]

#         for j in range(i,-1,-1):

#             if x[j-1] > iEle and j > 0 :
#                 x[j] = x[j-1]
#             else:
#                 x[j] = iEle
#                 break