def check_expresion(ex):
    st = []
    check1 = 0
    check2 = 0
    for i in range(len(ex)):
        if ex[i] in '[{(':
            st.append(ex[i])
            check2 += 1
        if ex[i] in '])}':
            check1 += 1 
            if st :
                if ex[i] == ']' and st[-1] == '[':
                    st.pop() 
                if  ex[i] == ')' and st[-1] == '(':
                    st.pop()
                if ex[i] == '}' and st[-1] == '{':
                    st.pop()
    if st and ex[-1] in '])}':
        return f"{ex} Unmatch open-close"
        
    elif not st and check1 > check2:
        x = ""
        y = ""
        for i in st:
            x += i
        for j in ex:
            y += j
        return f"{x+y} close paren excess"

    elif st :
        x = ""
        y = ""
        for i in ex:
            x += i
        for j in st:
            y += j
        return f"{x} open paren excess   {len(st)} : {y} "
    
    elif not st and check1 == check2 :
        return f"{ex} MATCH"



        
x = input("Enter expresion : ")
y = check_expresion(x)
print(y)


