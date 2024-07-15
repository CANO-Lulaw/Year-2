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
    
def Find_exit(w,h,r,q):
    if not any('F'in row for row in r)  or len(r) != h or any(len(row) != w for row in room_mx):
        print("Invalid map input.") 
        return
    
    start = None

    for i in range(h):
        for j in range(w):
            if r[i][j] == 'F':
                start = (j,i)
                break
        if start:
            break

    direc = [(0,-1),(1,0),(0,1),(-1,0)]
    q.en_queue(start)
    visited = set()
    visited.add(start)

    while not q.isEmpty():
        print("Queue:",q.items)
        current = q.de_queue()

        for d in direc:
            new_j, new_i  = current[0]+d[0], current[1]+d[1]
            if 0 <= new_i < h and 0 <= new_j < w and (new_j,new_i) not in visited and r[new_i][new_j] in '_O':
                if r[new_i][new_j] in 'O':
                    print("Found the exit portal.")
                    return 
                q.en_queue((new_j ,new_i))
                visited.add((new_j,new_i))

    print("Cannot reach the exit portal.")
    return

input_data = input("Enter width, height, and room: ")
width, height, room = input_data.split(' ')
width, height = int(width), int(height)
room_mx = room.split(',')

q = Queue()
Find_exit(width, height, room_mx, q)