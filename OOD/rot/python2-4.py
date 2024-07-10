def hbd(age):
  a = 20
  if age%2  == 0 : 
      resulf = age//2
  else:
      a = 21
      resulf = (age-1)//2
  return f"saimai is just {a}, in base {resulf}!"
year = int(input("Enter year : "))
print(hbd(int(year)))