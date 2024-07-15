class Stack() :
    def __init__(self)  :
        self.items =[]
    def push(self,i):
        self.items.append(i)
    def pop(self):
        return self.items.pop()
    def isEmpty(self):
        return len(self.items) == 0
    def size(self) :
        return len(self.items)  
S = Stack() 
check = 0
inp = [i.split(" ") for i in input("Enter Input : ").split(',')]
for i in range(len(inp)):
    check = 0
    if inp[i][0] == 'A':
        if S.isEmpty():
            S.push(int(inp[i][1]))
        elif int(inp[i][1]) >=  S.items[-1]:
            while check < 1:
                if S.isEmpty() :
                    check = 1
                    S.push(int(inp[i][1]))
                elif int(inp[i][1]) <  S.items[-1]:
                    S.push(int(inp[i][1]))
                    check = 1
                elif int(inp[i][1]) >=  S.items[-1]:
                    S.pop()

        elif int(inp[i][1]) <  S.items[-1]:
            S.push(int(inp[i][1]))
    elif inp[i][0] == 'B':
        print(S.size())