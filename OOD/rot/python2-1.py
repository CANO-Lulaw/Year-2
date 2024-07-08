class translator:

    def deciToRoman(self, num):
        list_ro = []
        if num/1000 >= 1 :
            a = int(num/1000)
            for i in range(a):
                list_ro.append('M') 
            num = num - (a*1000)
        if  num/900 >= 1 :
            a = int(num/900)
            list_ro.append('CM'*a)
            num = num - (a*900)
        if  num/500 >= 1 :
            a = int(num/500)
            for i in range(a):
                list_ro.append('D')
            num = num - (a*500)
        if  num/400 >= 1 :
            a = int(num/400)
            list_ro.append('CD'*a)
            num = num - (a*400)
        if  num/100 >= 1 :
            a = int(num/100)
            for i in range(a):
                list_ro.append('C')
            num = num - (a*100)
        if  num/90 >= 1 :
            a = int(num/90)
            list_ro.append('XC'*a)
            num = num - (a*90)
        if  num/50 >= 1 :
            a = int(num/50)
            for i in range(a):
                list_ro.append('L')
            num = num - (a*50)
        if  num/40 >= 1 :
            a = int(num/40)
            list_ro.append('XL'*a)
            num = num - (a*40)
        if  num/10 >= 1 :
            a = int(num/10)
            for i in range(a):
                list_ro.append('X')
            num = num - (a*10) 
        if  num/9 >= 1 :
            a = int(num/9)
            list_ro.append('IX'*a)
            num = num - (a*9)
        if  num/5 >= 1 :
            a = int(num/5)
            for i in range(a):
                list_ro.append('V')
            num = num - (a*5)
        if  num/4 >= 1 :
            a = int(num/4)
            list_ro.append('IV'*a)
            num = num - (a*4)
        if  num/1 >= 1 :
            a = int(num/1)
            for i in range(a):
                list_ro.append('I')

        return list_ro
        
    def romanToDeci(self, s):
        a = 0
        for c in s :
           if c == 'M':  a = a+1000
           if c == 'CM': a = a+900
           if c == 'D': a = a+500
           if c == 'CD': a = a+400
           if c == 'C': a = a+100
           if c == 'XC': a = a+90
           if c == 'L': a = a+50
           if c == 'XL': a = a+40
           if c == 'X': a = a+10
           if c == 'IX': a = a+9
           if c == 'V': a = a+5
           if c == 'IV': a = a+4
           if c == 'I': a = a+1
        return a

num = int(input("Enter number to translate : "))

print(''.join(translator().deciToRoman(num)))

print(translator().romanToDeci(translator().deciToRoman(num)))

