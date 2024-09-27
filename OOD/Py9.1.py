def bubbleSort(x,i):
    if i < 0:
        return
    
    def bubbleSort2(x,i,st=0):
        if st == i:
            return
        if x[st] > x[st+1]:
            inp[st], inp[st+1] = inp[st+1], inp[st]
        if st < i:
            bubbleSort2(x,i,st+1)

    if i >= 0 :
        bubbleSort2(x,i)

    bubbleSort(x,i-1)

inp = list(int(i) for i in input("Enter Input : ").split())
bubbleSort(inp,len(inp)-1)
print(inp)

# def bubble_sort(inp):
#     for i in range(len(inp)-1, 0, -1):
#         swapped = False

#         for j in range(i):
#             if inp[j] > inp[j+1]:
#                 swapped = True
#                 inp[j], inp[j+1] = inp[j+1], inp[j]

#         if not swapped:
#             return
