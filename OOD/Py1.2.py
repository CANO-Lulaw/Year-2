print(" *** Wind classification ***")
speed = input("Enter wind speed (km/h) : ")
if float(speed) >= 0 and float(speed) <= 51.99:
    print("Wind classification is Breeze.")
if float(speed) >= 52 and float(speed) <= 55.99:
    print("Wind classification is Tropical Storm.")
if float(speed) >= 56 and float(speed) <= 101.99:
    print("Wind classification is Tropical Storm.")
if float(speed) >= 102 and float(speed) <= 208.99:
    print("Wind classification is Super Typhoon.")
if float(speed) >= 209 :
    print("Wind classification is Super Typhoon.")
