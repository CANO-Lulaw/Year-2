
def find(prefix, remaining):
    
    results = set()
    def combinations(prefix, remaining):
        if prefix:
            results.add(int(prefix))
        for i in range(len(remaining)):
            combinations(str(prefix) + remaining[i], remaining[:i] + remaining[i+1:])

        return sorted(results)
    
    combinations("", remaining)

    if len(results) == 0:
        print("Invalid input")
        return False

    return sorted(results)
        

inp = input("Enter digits : ").split()
check = 0

for i in range(len(inp)):
    if inp[i].isalpha() or len(inp) == 1:
        print("Invalid input")
        check = 1
        break

if check == 0:
    output = find("",inp)
    if output == False:
        pass
    else:print("Output :",find("",inp))

    