num = int(input("Enter Input : "))
cal_num = num+5+(num-1)
cal1 = int(int(cal_num)/2)
z = 0
for y in range(1,cal1+1):
    z += 1
    for x in range(1,cal_num+1):
        if x < int((cal_num)/2 ) and z < cal1 :
            print('.', end='')
        z += 1 
        if x <= cal1 and z > cal1 and y < cal1  :
           print('#', end='')
        if x > int((cal1)+1) and y == 1 and y < cal1  :
            print('+', end='')
        if x > cal1 and x < int((cal1)+2) and y > 1 and y < cal1  :
            print('+', end='')
        if  x > int((cal1)+1) and y > 1 and y < cal1 and  x != cal_num :
            print('#', end='')
        if x == cal_num and y != cal1  :
            print('+', end='')
        if y == cal1 and  x <= cal1:
            print('#', end='')
        if y == cal1 and  x > cal1:
            print('+', end='')
    print()
    z = y

for y in range(1,cal1+1):
    z += 1
    for x in range(1,cal_num+1):
        if y == 1 and  x <= cal1:
            print('#', end='')
        if y == 1 and  x > cal1:
            print('+', end='')
        if x == 1 and y != 1 :
            print('#', end='')
        if  x > 1 and y > 1 and x < cal1 and y !=cal1 :
            print('+', end='')
        if x == cal1 and y != 1 and  y != cal1  :
            print('#', end='')
        if  x < cal1 and y == cal1 :
            print('#', end='')
        if x > cal1 and z > cal1 and z < int(int(cal_num)+1) and y !=1:
            print('+', end='')
        if x > int(cal1+1) and z > int(cal_num) and y !=1:
            print('.', end='')
        z += 1 
    print()
    z = y