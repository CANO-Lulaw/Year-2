def staircase(n, row=0):
    if n > 0:
        if row >= n:
            return 
        print('_' * (n - row - 1), end='')
        print('#' * (row + 1))
    
    elif n == 0:
        print("Not Draw!")
        return
    
    else:
        if row >= -n:
            return
        print('_' * row, end='')
        print('#' * (-n - row))

    staircase(n, row + 1)

staircase(int(input("Enter Input : ")))
