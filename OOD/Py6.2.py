
def find(prefix, remaining):
    results = []
    def combinations(prefix, remaining):
        if prefix:
            if prefix in '000' :
                prefix = 0
            results.append(int(prefix))
        for i in range(len(remaining)):
            combinations(prefix + remaining[i], remaining[:i] + remaining[i+1:])

        return sorted(results)
    combinations("", remaining)
    return sorted(results)
        

inp = input("Enter digits : ").split()
check = 0

for i in range(len(inp)):
    if inp[i].isalpha():
        print("Invalid input")
        check = 1
        break

if check == 0:
    print("Output :",find("",inp))
