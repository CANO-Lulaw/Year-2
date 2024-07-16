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

def run_q():
    c1_time = 3
    c1_counter = 0
    c2_time = 2
    c2_counter = 0
    time = 0

    for i in range(Q.size()):
        time += 1
        
        if c1_counter == c1_time :
                c1_counter = 0
                if not Q1.isEmpty():
                    Q1.de_queue()

        if not Q2.isEmpty():
            c2_counter += 1
            if c2_counter == c2_time  :
                c2_counter = 0    
                if not Q2.isEmpty():
                    Q2.de_queue()
                    
        if Q1.size() < 5:
            Q1.en_queue(Q.de_queue())
            
        elif Q2.size() < 5:
            Q2.en_queue(Q.de_queue())
 
        print(f"{time} {Q.items} {Q1.items} {Q2.items}")
        c1_counter += 1

        if Q.isEmpty():
            return
            
Q = Queue()
Q1 = Queue()
Q2 = Queue()

inp = input("Enter people : ")
for i in inp:
    Q.en_queue(i)
run_q()
    
