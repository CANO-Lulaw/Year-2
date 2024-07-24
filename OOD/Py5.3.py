class Node():
    def __init__(self, data, prev=None, next=None):
        self.data = data
        self.prev: Node = prev
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
            result += ' -> ' + str(current.data)
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
        current.next.prev = current


def bubble_sort(inp):
    for i in range(len(inp)-1, 0, -1):
        swapped = False

        for j in range(i):
            if inp[j] > inp[j+1]:
                swapped = True
                inp[j], inp[j+1] = inp[j+1], inp[j]

        if not swapped:
            return


L = LinkedList()
inp = input("Enter unsorted Linked List: ").split()
print(f"Before: {(' -> ').join(inp)}")
bubble_sort(inp)

for i in inp:
    L.append(i)

print(f"After : {L}")