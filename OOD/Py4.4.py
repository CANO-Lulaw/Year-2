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
    
inp = [i.split(" ") for i in input("Enter Input : ").split(',')]
data = []
score = 0
my_q = Queue()
dic_act = {'0':"Eat",'1':"Game",'2':"Learn",'3':"Movie"}
dic_loc = {'0':"Res.",'1':"ClassR.",'2':"SuperM.",'3':"Home"}

for i in range(len(inp)):
    my_q.en_queue(inp[i][0]) 

your_q = Queue()
for i in range(len(inp)):
    your_q.en_queue(inp[i][1]) 

print("My   Queue =",", ".join(my_q.items))
print("Your Queue =",", ".join(your_q.items))

for pair in inp:
    temp = []
    for item in pair:
        temp.extend(item.split(':'))
    data.append(temp)

for i in data:
    if i[0] == i[2] and i[1] == i[3]:
        score += 4
    elif i[0] == i[2] :
        score += 1
    elif i[1] == i[3] :
        score += 2
    else : score -= 5

num = 1
print(f"My   Activity:Location = ",end="")
for i in my_q.items:
    my_act, my_loc = i.split(":")
    print(f"{dic_act[my_act]}:{dic_loc[my_loc]}",end="")
    if num != my_q.size():
        print(", ",end="")
    num += 1
print()

print(f"Your Activity:Location = ",end="")
num = 1
for i in your_q.items:
    your_act, your_loc = i.split(":")
    print(f"{dic_act[your_act]}:{dic_loc[your_loc]}",end="")
    if num != your_q.size():
        print(", ",end="")
    num += 1

print()
if score >= 7:
    print(f"Yes! You're my love! : Score is {score}.")
elif score < 7 and score > 0 :
    print(f"Umm.. It's complicated relationship! : Score is {score}.")
elif score < 0:
    print(f"No! We're just friends. : Score is {score}.")