import itertools
print("*** Fun with permute ***")
list_in = list( int(i) for i in input("input : ").split(","))
print("Original Cofllection: ",list_in)

permu= list(itertools.permutations(list_in))
permu_list =[list(i) for i in permu]
print("Collection of distinct numbers:")
print(permu_list)
