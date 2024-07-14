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
    elif S.stack[-1] not in '()':
        if dic_op[S.stack[-1]] < dic_op[op] :
            return True
        elif dic_op[S.stack[-1]] >= dic_op[op] :
            return False
    else : return True
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
            S.push(i)
    elif i == '(': 
        S.push(i)

    elif i == ')':
        while S.stack[-1] != '(':
            output += S.pop()
        if S.stack[-1] == '(':
            S.pop()
print(output,end="")

while not S.isEmpty():

    print(S.pop(), end="")
    