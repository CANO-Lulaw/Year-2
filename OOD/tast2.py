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
num = 1
check = 0

inp = [i.split(" ") for i in input("Enter Input : ").split(',')]
for i in range(len(inp)):
    num = 1
    save = 0
    if inp[i][0] == 'A':
        S.push(int(inp[i][1]))

    elif inp[i][0] == 'B':
        temp = S.pop()
        if not S.isEmpty():
            if temp >= S.items[-1]:
                num = 1
                print(num)
                S.push(temp)
            elif temp < S.items[-1]:
                S.push(temp)
                for i in range(S.size()-1,0,-1):
                    if not S.isEmpty():
                        if check == 1:
                            if S.items[save] < S.items[i]:
                                num += 1          
                        elif S.items[i] < S.items[i-1]:
                            num += 1
                        else : 
                            save = i
                            check = 1
                print(num)
                # temp = S.pop()
                # while check < 1 :
                #     if S.isEmpty():
                #         check = 1
                #     elif temp < S.items[-1] :
                #         num += 1
                #         temp = S.pop()
                # print(num)

    elif inp[i][0] == 'S':
        if S.isEmpty() :
            print("0")
        for i in range(S.size()):
            item = S.pop()
            if (item%2 == 0):
                M.push(item - 1)
            elif (item%2 != 0):
                M.push(item + 2)
        S.items.clear()
        S.items = list(reversed(M.items))
        M.items.clear()