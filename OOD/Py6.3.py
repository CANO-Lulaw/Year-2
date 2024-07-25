def gcd(num1, num2):
    temp = 0
    i = 1
    if num1 < num2:
        num1, num2 = num2, num1
    if num2 == 0 :
        return num1
    if num1 == 0:
        return 0
    if num1 == 0 and num2 == 0:
        return False
    
    while temp < num1:
        temp = num2 * i
        if temp > num1:
            temp = check
            break
        i += 1
        check = temp 
    if temp == num1:
        return num2
    new = num1 - temp
    num1 = num2
    return gcd(num1,new)

inp = input("Enter Input : ").split()

if int(inp[0]) < int(inp[1]):
    inp[0], inp[1] = inp[1], inp[0]

result = gcd(abs(int(inp[0])),abs(int(inp[1])))

if result == False:
    print("Error! must be not all zero.")
else : print(f"The gcd of {inp[0]} and {inp[1]} is : {result}")