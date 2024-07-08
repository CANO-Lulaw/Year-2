print("*** New Range ***")
argument = list(float(i) for i in input("Enter Input : ").split(' '))
def pang(argument):
    list_num = []
    end_a = argument[0]
    a = 0.0 if len(argument)==1 else argument[0]
    b = end_a if len(argument)==1 else argument[1]
    c = 1.0 if len(argument)!=3 else argument[2]
    while(a < b):
        list_num.append(a)
        a += c
        a = round(a, 3)
    
    return list_num
print(tuple(pang(argument)))
        