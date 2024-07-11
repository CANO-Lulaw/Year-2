def check_expresion(ex):
    stack = []
    d = {')':'(',']':'[','}':'{'}
    for p in ex:
        if p in '([{' :
            stack.append(p)
        elif p in ')}]':
            if not stack:
                return f"{"".join(ex)} close access"
            if p == d[p]:
                stack.pop()
    return "open access" if stack else "match"



x = input("Enter expresion : ")
y = check_expresion(x)
print(y)