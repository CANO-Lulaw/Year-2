class Data:
    def __init__(self, key, value):
        self.key = key
        self.value = value

    def __str__(self):
        return "({0}, {1})".format(self.key, self.value)

class Hash:
    def __init__(self, size, max_collision):
        self.size = size
        self.max_collision = max_collision
        self.table = [None] * size
        self.full_message_shown = False

    def hash_function(self, key):
        ascii_sum = sum(ord(c) for c in key)
        return ascii_sum % self.size

    def insert(self, data):
        index = self.hash_function(data.key)
        collision_count = 0
        index_start = index

        while self.table[index] is not None:
            print(f"collision number {collision_count + 1} at {index}")
            collision_count += 1
            if collision_count >= self.max_collision:
                print("Max of collisionChain")
                return

            index = (index_start + collision_count**2) % self.size

        self.table[index] = data

    def is_full(self):
        return all(self.table)

    def show_table(self):
        for i in range(self.size):
            if self.table[i] is None:
                print(f"#{i+1}\tNone")
            else:
                print(f"#{i+1}\t{self.table[i]}")
        print("-" * 27)


print(" ***** Fun with hashing *****")
inp = input("Enter Input : ").split("/")
size, max_collision = map(int, inp[0].split())
hash_table = Hash(size, max_collision)
items = [item.split() for item in inp[1].split(",")]

for key, value in items:
    if hash_table.is_full():
        if not hash_table.full_message_shown:
            print("This table is full !!!!!!")
            hash_table.full_message_shown = True
        continue

    data = Data(key, value)
    hash_table.insert(data)
    hash_table.show_table()


