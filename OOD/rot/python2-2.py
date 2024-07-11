class Bus:
    def __init__(self, people, fare):
        self.__people = people
        self.__fare = fare
        
    def __str__(self):
        return 'this bus has ' + str(self.__people) + ' people with fare = ' + str(self.__fare)
    
    def __lt__(self, rhs):
        return self.__people * self.__fare < rhs.__people * rhs.__fare
    
    def people_in(self, k):
        self.__people += k
    
    def people_out(self, k):
        if self.__people <= k:
            self.__people = 0
        
        else:
            self.__people -= k
    
    def change_fare(self, new_fare):
        self.__fare = new_fare


b1, b2, f1, f2 = input("Enter people in Bus1, Bus2, fare Bus1, Bus2 : ").split()
b1 = Bus(int(b1), int(f1))
b2 = Bus(int(b2), int(f2))

if b1 < b2:
    print(b1)
else:
    print(b2)

b1.people_in(3)
b1.people_out(6)
b1.change_fare(12)
print(b1)
