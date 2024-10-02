class Hash:
    def __init__(self, size, max_collisions, threshold):
        self.size = size
        self.max_collisions = max_collisions
        self.threshold = threshold / 100
        self.table = [None] * size
        self.count = 0

    def is_prime(self, num):
        if num <= 1:
            return False
        for i in range(2, int(num**0.5) + 1):
            if num % i == 0:
                return False
        return True

    def next_prime(self, num):
        while True:
            num += 1
            if self.is_prime(num):
                return num

    def rehash(self, itemx=None):
        new_size = self.next_prime(self.size * 2)
        new_table = [None] * new_size
        old_table = self.table
        self.size = new_size
        self.table = new_table
        self.count = 0

        for index in range(len(old_table) - 1, -1, -1):
            item = old_table[index]
            if item is not None:
                self.add(item)

        if itemx is not None:
            self.add(itemx)

    def add(self, item):
        index = item % self.size
        collisions = 0
        index_start = index

        if (self.count+1) / self.size > self.threshold:
            print("****** Data over threshold - Rehash !!! ******")
            self.rehash(item)
            return

        while self.table[index] is not None:
            collisions += 1
            print(f"collision number {collisions} at {index}")

            if collisions >= self.max_collisions:
                print("****** Max collision - Rehash !!! ******")
                self.rehash()
                return self.add(item)

            index = (index_start + collisions**2) % self.size

        self.table[index] = item
        self.count += 1

    def print_table(self):
        for i in range(self.size):
            print(f"#{i + 1}\t{self.table[i]}")
        print("----------------------------------------")


print(" ***** Rehashing *****")
input_data = input("Enter Input : ")
left, right = input_data.split("/")
size, max_collisions, threshold = map(int, left.split())
data = list(map(int, right.split()))

hash_table = Hash(size, max_collisions, threshold)

print("Initial Table :")
hash_table.print_table()

for item in data:
    print(f"Add : {item}")
    hash_table.add(item)
    hash_table.print_table()
