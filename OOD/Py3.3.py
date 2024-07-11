class Stack() :
    def __init__(self)  :
        self.stack =[]
    def push(self,i):
        self.stack.append(i)
    def pop(self):
        return self.stack.pop()
    def isEmpty(self):
        return len(self.stack) == 0
    def size(self) :
        return len(self.stack) 

dic_op = {'+':1,'-':1,'*':2,'/':2,'^':3} 

def check(st,op):
    if S.isEmpty():
        return True
    elif dic_op[S.stack[-1]] < dic_op[op] :
        return True
    elif dic_op[S.stack[-1]] >= dic_op[op] :
        return False
    
inp = input('Enter Infix : ')

S = Stack()

print('Postfix : ', end='')
output = ""

for i in inp :
    if i.isalpha():
        output += i
    elif i in '+-*/^':
        if check(S.stack,i) :
            S.push(i)
        elif not check(S.stack,i):
            while not check(S.stack,i):
                output += S.pop()
    elif i == '(': 
        S.push(i)

    elif i == ')':
        while S.stack[-1] != ')':
            output += S.pop()
        
print(output)

while not S.isEmpty():

    print(S.pop(), end='')
