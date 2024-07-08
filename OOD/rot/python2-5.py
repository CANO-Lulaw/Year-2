class funString():

    def __init__(self,string = ""):
        self.__str = string

    def __str__(self):
        return self.__str
     
    def size(self) :

        return len(self.__str)

    def changeSize(self):
        new_str = ""
        for char in self.__str:
            if 'A' <= char <= 'Z':
                new_str += chr(ord(char) + 32) 
            elif 'a' <= char <= 'z':
                new_str += chr(ord(char) - 32) 
        self.__str = new_str  
        return self.__str
    def reverse(self):
        reversed_str = self.__str[::-1] 
        self.__str = reversed_str  
        return self.__str

    def deleteSame(self):
        deleteSame_str = ""
        for i in self.__str:
            if i not in (deleteSame_str):
                deleteSame_str += i
        self.__str = deleteSame_str
        return self.__str



str1,str2 = input("Enter String and Number of Function : ").split()

res = funString(str1)

if str2 == "1" :    print(res.size())

elif str2 == "2":  print(res.changeSize())

elif str2 == "3" : print(res.reverse())

elif str2 == "4" : print(res.deleteSame())