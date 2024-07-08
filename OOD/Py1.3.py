def permute(num):
    permutations = []

    def back(current, remaining):
        if not remaining:
            permutations.append(current[:])  
            return
        
        for i in range(len(remaining)):
            new_current = current + [remaining[i]]
            new_remaining = remaining[:i] + remaining[i + 1:]
            back(new_current, new_remaining)

    back([], num)
    permutations.sort(reverse=True)  
    return permutations

print("*** Fun with permute ***")
list_in = list(int(i) for  i in input("input : ").split(","))
print("Original Cofllection: ", list_in)
print("Collection of distinct numbers:")
permutations = permute(list_in)
# a = permutations[1]
# b = permutations[3]
# c = permutations[2]
# permutations[1] = b
# permutations[3] = a
# permutations[1] = permutations[2]
# permutations[2] = b
print("",permutations)
   

