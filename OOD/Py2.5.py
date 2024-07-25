class funString():

    def __init__(self,string = ""):
        self.__str_in = string

    def __str__(self):
        return self.__str_in
    
    def size(self) :
        return len(self.__str_in)

    def changeSize(self):
        chang = ""
        for char in self.__str_in:
            if "a"<= char <= "z":
                chang += chr(ord(char)-32) 
            elif "A" <= char <= "Z":
                chang += chr(ord(char)+32) 
        self.__str_in = chang  
        return self.__str_in
    
    def reverse(self):
        temp = self.__str_in[::-1] 
        self.__str_in = temp  
        return self.__str_in

    def deleteSame(self):
        str2 = ""
        for i in self.__str_in:
            if i not in (str2):
                str2 += i
        self.__str_in = str2 
        return self.__str_in


str1,str2 = input("Enter String and Number of Function : ").split()

res = funString(str1)

if str2 == "1" :    print(res.size())

elif str2 == "2":  print(res.changeSize())

elif str2 == "3" : print(res.reverse())

elif str2 == "4" : print(res.deleteSame())