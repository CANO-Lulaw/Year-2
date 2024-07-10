def permute(num_list):
  permutations = []
  normal_list = num_list.copy()
  j = 0
  if len(num_list) > 3:
       for i in reversed(range(len(num_list)+2)) :
          k = 3
          if j > 0 :
              if i == 3 :
                  k -= 1
              temp = normal_list[k-1] 
              normal_list[k-1] = normal_list[k-2]
              normal_list[k-2] = temp
              
              a =  normal_list.copy()
              if i == 2:
                  a = num_list.copy()
              b = a.copy() 
              permutations.append(b)
              x = 0
          if j == 0:
              b = num_list.copy()
              permutations.append(b)
              x = 0
          for i in reversed(range(len(b))) :
              if b[0] != 3:
                  if x == 0:
                      c = b.copy()  
                  temp = c[i] 
                  c[i] = c[i-1]
                  c[i-1] = temp
                  d = c.copy()
                  if d == [3,2,1,1] :
                      print(d)
                  permutations.append(d)
                  x+=1
          permutations.pop()
          j += 1
          k -=1
  return permutations


print("*** Fun with permute ***")
list_in = list(int(i) for  i in input("input : ").split(","))

print("Original Cofllection: ", list_in)
print("Collection of distinct numbers:")

permutations = permute(list_in)
x = list(reversed(permutations))
print("",x)


