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

x = [i.split(" ") for i in input("Enter Input : ").split(',')]
Q = Queue()
for i in x:
    if len(i) > 1:
        Q.en_queue(i[1])
        print(Q.size())
    elif len(i) == 1 :
        if not Q.isEmpty():
            print(f"{Q.items[0]} 0")
            Q.de_queue()
        elif Q.isEmpty():
            print("-1")
if not Q.isEmpty():
    for i in Q.items:
        print(i,end=" ")
if Q.isEmpty():
    print("Empty")




