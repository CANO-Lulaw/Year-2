n,k = input("Enter num and sub : ").split()
def weirdSubtract(n,k):
    for i in range(k):
        if int(n)%10 == 0:
            n = int(n)/10
        elif int(n)%10 != 0:
            n = int(n)-1
    return int(n)

print(weirdSubtract(int(n),int(k)))