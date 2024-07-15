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
M = Stack()

inp = [i.split(" ") for i in input("Enter Input : ").split(',')]
for i in range(len(inp)):
    num = 0
    if inp[i][0] == 'A':
        S.push(int(inp[i][1]))

    elif inp[i][0] == 'B':
        if S.isEmpty():
            print(num)
        elif S.size() == 1: 
            num += 1
            print(num)
        elif not S.isEmpty():
            T = S.items.copy()
            for j in range(S.size()):
                item = T.pop()
                if M.isEmpty():
                    M.push(item)
                    num += 1
                elif item > M.items[-1]:
                    M.push(item)
                    num += 1
            print(num)
        M.items.clear()

    elif inp[i][0] == 'S':
        for i in range(S.size()):
            item = S.pop()
            if (item%2 == 0):
                M.push(item - 1)
            elif (item%2 != 0):
                M.push(item + 2)
        S.items.clear()
        S.items = list(reversed(M.items))
        M.items.clear()