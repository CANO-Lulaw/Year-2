class Node():
    def __init__(self, data, prev=None, next=None):
        self.data = data
        self.next: Node = next


class LinkedList():

    def __init__(self):
        self.head: Node = None
        self.count = 0

    def __str__(self):
        if self.isEmpty():
            return "Empty"
        if self.count == 1:
            result = '('+str(self.head.data)+')'+ '->Empty'
            return result
        if self.head is None:
            return ""
        result = '('+str(self.head.data)+')'
        current = self.head.next
        while current is not None:
            result += '->' + str(current.data)
            current = current.next
        return result

    def append(self, data):
        if self.head is None:
            self.head = Node(data)
            self.count += 1
            return

        current = self.head
        while current.next is not None:
            current = current.next

        current.next = Node(data)
        self.count += 1

    def isEmpty(self):
        return self.count == 0

    def swap(self):
        current = self.head
        prev = self.head
        for i in range(1, self.count):
            current = current.next
            if i % 2 != 0:
                if current.next is None:
                    prev.next = None
                    self.count -= 1

                elif current.next is not None:
                    current.data, current.next.data = current.next.data, current.data
            prev = current
        return

    def shake(self):
        death = []
        temp = 0
        current = self.head
        prev = self.head

        for i in range(1, self.count):
            current = current.next
            temp = 0
            if current.data > self.head.data:
                death.append(current.data)
                self.count -= 1
                if current.next is None:
                    prev.next = None
                
                else:
                    prev.next = current.next
                    temp = 1
            if temp == 0:
                prev = prev.next
        return death
    
    def sumof(self, num):
        sum = self.head.data
        current = self.head

        for i in range(1,self.count):
            current = current.next
            sum += current.data
        return sum

    def match(self, num):
        death = []
        found = 0
        sum = self.sumof(num)
        if sum >= num:
            return death

        while found != 1:
            prev = self.head
            current = self.head

            for i in range(1,self.count):
                current = current.next
                if i > 1:
                    prev = prev.next

                if current.data != 0:
                    if num % current.data == 0:
                        found = 2
            
            if found == 0:
                self.head.data, current.data = current.data, self.head.data
                return death

            elif current.data == 0 :
                death.append(current.data)
                prev.next = None
                self.count -= 1

            elif num % current.data != 0 :
                death.append(current.data)
                prev.next = None
                self.count -= 1
            
            elif num % current.data == 0 :
                found = 1
                return death
            
L = LinkedList()
inp = input("Snake Game : ").split("/")
data = inp[0].split()
command = [i.split() for i in inp[1].split(",")]
check = 0

for i in data:
    L.append(int(i))
print(L)

for i in command:
    if check == 0:
        
        if L.count < 2:
            check = 1

        elif i[0] == 'SW':
            L.swap()
            print("Swap success!")

        elif i[0] == 'SH':
            death = L.shake()
            print(f"Shake success!->{death}")

        elif i[0] == 'F':
            L.append(int(i[1]))
            print(f"Steal success!->{i[1]}")

        elif i[0] == 'D':
            death = L.match(int(i[1]))
            print(f"Play success!->{list(reversed(death))}")
        
        if L.count == 1:
            check = 1

        if len(data) > 1:
            print(L)    
            print("------------------------------")

        if check == 1: 
            print("Mom is dead")
            
print("Snake Game :")