class Node():
    def __init__(self, data, prev=None, next=None):
        self.data = data
        self.next: Node = next


class LinkedList():
    count = 0

    def __init__(self):
        self.head: Node = None

    def __str__(self):
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
            return

        current = self.head
        while current.next is not None:
            current = current.next

        current.next = Node(data)
        LinkedList.count += 1

    def check_index(self, index1, index2):
        if index1 > LinkedList.count:
            print("Error! {index not in length}: ", index1)
            return False
        if index2 > LinkedList.count:
            self.append(index2)
            print("index not in length, append : ", index2)
            return False
        return True

    def set_index(self, index1, index2):
        current = self.head
        if index1 == 0:
            self.head.next = Node(index2)
            print(f"Set node.next complete!, index:value = {index1}:{self.head.data} -> {index2}:{self.head.next.data} ")

        for i in range(index1):
            current = current.next

        temp_index1 = current

        for i in range(index2):
            current = current.next

        temp_index1.next = current
        print(f"Set node.next complete!, index:value = {index1}:{temp_index1.data} -> {index2}:{current.data}")

    def check_loop(self, index1, index2):
        if index1 >= index2:
            return True
        return False


L = LinkedList()
inp = [i.split() for i in input("Enter input : ").split(",")]

for i in inp:
    if i[0] == 'A':
        L.append(i[1])
        print(L)

    elif i[0] == 'S':
        index1, index2 = i[1].split(':')
        index = L.check_index(int(index1), int(index2))
        loop = L.check_loop(int(index1), int(index2))

        if index:
            L.set_index(int(index1), int(index2))

        if loop:
            print(L)
            print("Found Loop")
            
        elif not loop:
            print("No Loop")
            print(L)
