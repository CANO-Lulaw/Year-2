print("*** Election ***")
len_number = input("Enter a number of voter(s) : ")
list_number = input("").split()
count = 0
n = 0
number =0
list_win =[]
for i in list_number :
    if 20 < int(i) or int(i) < 1 or not i.isdigit(): 
        n+=1


if n == int(len_number):
    print("*** No Candidate Wins ***")

else:
    for i in list_number :
        v=1
        for a in list_number :
            if int(i) == int(a) and 0 < int(i) and int(i) <=20 :
                v+=1
        if v >= count :
            if v > count:
               del list_win[:] 
               number = i
               list_win.append(int(number))
               count = v
            else:
                count = v
                number = i
                if int(i) not in list_win:
                    list_win.append(int(number))  
# print(sorted(list_win))

for i in sorted(list_win):
    print(i, end=' ')
