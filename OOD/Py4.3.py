class Queue() :
    def __init__(self)  :
        self.items = []
    def en_queue(self,value):
        self.items.append(value)
    def de_queue(self):
        return self.items.pop(0)
    def isEmpty(self):
        return len(self.items) == 0
    def size(self) :
        return len(self.items)
    
q = Queue()
y = []
error = 0
error_in = 0
en_q = 0
x = input("input : ").split(',')
for i in x:
    alpha = ''.join(filter(str.isalpha, i))
    digit = ''.join(filter(str.isdigit, i))
    if alpha and digit:
        y.append([alpha, int(digit)])
    else: y.append([alpha])

for i in range(len(x)):
    print(f"Step : {x[i]}")
    de_q = 0
    j = 0    
    if y[i][0] == 'D':
        while not q.isEmpty():
            q.de_queue()
            de_q += 1
        error += y[i][1]- de_q 
        if q.isEmpty():
            print(f"Dequeue : {[]}")
            print(f"Error Dequeue : {error}")
            print(f"Error input : {error_in}")

    elif y[i][0] == 'E':
        while j < y[i][1]:
            q.en_queue('*'+str(en_q))
            j += 1
            en_q += 1
        print(f"Enqueue : {q.items}")
        print(f"Error Dequeue : {error}")
        print(f"Error input : {error_in}")
    
    else:
        error_in += 1
        print(q.items)
        print(f"Error Dequeue : {error}")
        print(f"Error input : {error_in}")
    print("--------------------")

