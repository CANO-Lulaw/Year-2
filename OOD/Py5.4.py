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
        if self.head is None:
            return ""
        result = str(self.head.data)
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

    def check_index(self, index1, index2):
        if index1 > self.count-1:
            print("Error! {index not in length}:",index1)
            return False
        if index2 > self.count-1:
            self.append(index2)
            print("index not in length, append :",index2)
            return False
        return True

    def set_index(self, index1, index2):
        if self.isEmpty():
            return 
        if index1 == 0:
            if index2 == 0:  
                self.head.next = self.head
                print(f"Set node.next complete!, index:value = {index1}:{self.head.data} -> {index2}:{self.head.next.data} ")
                return

            current = self.head
            for j in range(index2):
                current = current.next

            temp_index2 = current
            self.head.next = temp_index2
            print(f"Set node.next complete!, index:value = {index1}:{self.head.data} -> {index2}:{temp_index2.data} ")
            return

        current = self.head
        for i in range(index1):
            current = current.next

        temp_index1 = current

        if index2 == 0:  
            temp_index1.next = self.head
            print(f"Set node.next complete!, index:value = {index1}:{temp_index1.data} -> {index2}:{self.head.data}")
            return

        current = self.head
        for j in range(index2):
            current = current.next

        temp_index1.next = current
        print(f"Set node.next complete!, index:value = {index1}:{temp_index1.data} -> {index2}:{current.data}")

    def check_loop(self, index1, index2):
        if index1 >= index2 and not self.isEmpty():
            return True
        return False
    
    def isEmpty(self):
        return self.count == 0


L = LinkedList()
inp = [i.split() for i in input("Enter input : ").split(",")]

for i in inp:
    if i[0] == 'A':
        L.append(i[1])
        print(L)

    elif i[0] == 'S':
        index1, index2 = i[1].split(':')
        index1 = int(index1)
        index2 = int(index2)

        if L.isEmpty():
            print("Error! {list is empty}")
            index = False

        elif not L.isEmpty():
            index = L.check_index(index1, index2)

        loop = L.check_loop(index1, index2)

        if index:
            L.set_index(index1,index2)

if loop and index:
    print("Found Loop")
            
else:
    print("No Loop")
    print(L)