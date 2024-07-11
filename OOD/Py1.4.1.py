def num_grid(lst):
    n = 0
    t = 0
    num_t = 0
    for i in lst:
        n = 0
        for a in i:
            if n != 4 and i[n+1] == '#':
                num_t += 1
            if n != 0 and i[n-1] == '#' :
                num_t+=1
            if t !=0 and lst[t-1][n] == '#' :
                num_t+=1
            if t !=4 and lst[t+1][n] == '#' :
                num_t+=1
            if t !=0 and n != 0 and lst[t-1][n-1] == '#' :
                num_t+=1
            if t !=0 and n != 4 and lst[t-1][n+1] == '#' :
                num_t+=1
            if t != 4  and n != 0 and lst[t+1][n-1] == '#' :
                num_t+=1
            if t != 4  and n != 4 and lst[t+1][n+1] == '#' :
                num_t+=1
            if a != '#' :
                lst[t][n] = str(num_t) 
            n+=1
            num_t =0
            
        t+=1  
    return lst



'''lst_input = [

    ["-","-","-","-","-"],

    ["-","-","-","-","-"],

    ["-","-","#","-","-"],

    ["-","-","-","-","-"],

    ["-","-","-","-","-"]

]'''

lst_input = []
print("*** Minesweeper ***")
input_list = input("Enter input(5x5) : ").split(",")

for e in input_list:

  lst_input.append([i for i in e.split()])

print("\n",*lst_input,sep = "\n")

print("\n",*num_grid(lst_input),sep = "\n")