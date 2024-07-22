class Node():
    def __init__(self, data, prev = None, next=None):
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
        current.next.prev = current

    def tocircle(self):
        current = self.head
        while current.next is not None:
            current = current.next

        current.next = self.head
        self.head.prev = current

    def railway(self, start, end, direct=None):
        if direct == 'F':
            count1 = 0
            route1 = []
            currnt = self.head
            if currnt.data == start:
                route1.append(currnt.data)
                while currnt.next.data != end:
                    currnt = currnt.next
                    route1.append(currnt.data)
                    count1 += 1
                route1.append(currnt.next.data)

            elif currnt.data != start:
                currnt = self.head
                while currnt.next.data != start:
                    currnt = currnt.next

                while currnt.next.data != end:
                    currnt = currnt.next
                    route1.append(currnt.data)
                    count1 += 1
                route1.append(currnt.next.data)

        if direct == 'B':
            count2 = 0
            route2 = []
            currnt = self.head
            if currnt.data == start:
                route2.append(currnt.data)
                while currnt.prev.data != end:
                    currnt = currnt.prev
                    route2.append(currnt.data)
                    count2 += 1
                route2.append(currnt.next.data)
            
            elif currnt.data != start:
                currnt = self.head
                while currnt.prev.data != start:
                    currnt = currnt.prev

                while currnt.prev.data != end:
                    currnt = currnt.prev
                    route2.append(currnt.data)
                    count2 += 1
                route2.append(currnt.next.data)

        if direct is None:
            if count1 <= count2:
                print(f"Forward Route:  {"->".join(route1)},{count1}")
            if count2 <= count1:
                print(f"Backward Route: {"->".join(route2)}, {count2}")
            return

        elif direct == 'F':
            print(f"Forward Route:  {"->".join(route1)},{count1}")
            return

        elif direct == 'B':
            print(f"Backward Route: {"->".join(route2)}, {count2}")
            return


L = LinkedList()
print("***Railway on route***")
inp = [i.split(",") for i in input(
    "Input Station name/Source, Destination, Direction(optional): ").split("/")]


for i in inp[0]:
    L.append(i)
L.tocircle()

L.railway(inp[1][0], inp[1][1], inp[1][2])

# L = LinkedList()
# print("***Railway on route***")
# inp = input("Input Station name/Source, Destination, Direction(optional): ").split(",")
# rul = input("").split(",")


# for i in inp:
#     L.append(i)
    
# L.tocircle()
# L.railway(rul[0], rul[1], rul[2])