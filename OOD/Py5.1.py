class Node():
    def __init__(self, data, next=None):
        self.data = data
        self.next: Node = next


class LinkedList():
    def __init__(self):
        self.head: Node = None

    def __str__(self):
        if self.head is None:
            return ""
        result = str(self.head.data)
        current = self.head.next
        while current is not None:
            result += ' <- ' + str(current.data)
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

    def locomotive(self):
        if self.head.data == '0':
            return

        current = self.head
        while current.next.data != '0':
            current = current.next
        zero = current.next
        current.next = None

        current = zero
        while current.next is not None:
            current = current.next
        current.next = self.head
        self.head = zero


L = LinkedList()
print(" *** Locomotive ***")
inp = input("Enter Input : ").split()

for i in inp:
    L.append(i)
print(f"Before : {L}")
L.locomotive()
print(f"After : {L}")
