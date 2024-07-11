def num_grid(lst):
    num = 0
    toom = 1
    x=0
    for i in range(5):
        for j in range(5):
            if lst[i][j] == '#':
                lst[i][j-1] = str(toom)
                lst[i][j+1] = str(toom)

                # lst[i-1][j-1] = str(toom)
                # lst[i+1][j+1] = str(toom)

                # lst[i-1][j+1] = str(toom)
                # lst[i+1][j-1] = str(toom)
            if lst[j][i] == '#':
                lst[j+1][i] = str(toom)
                lst[j-1][i] = str(toom)

            if lst[i][i] == '#':
                

            if lst[j][i] == '-':
                lst[j][i] = str(num)

    
    

                



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