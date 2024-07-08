print("*** Converting hh.mm.ss to seconds ***")
hh,mm,ss = input( "Enter hh mm ss : ").split()
if int(mm)>= 60 or int(mm)< 0:
    error = f'mm({mm}) is invalid!'
    print( error)


elif int(mm)<60 :
    hs =  int(hh)*3600
    ms = int(mm)*60
    s = hs + ms + int(ss)
    format = '{:,}'.format(s)
    if int(hh) < 10 :
        hh = "0"+hh
    if int(mm) < 10 :
        mm = "0"+mm
    if int(ss) < 10 :
        ss = "0"+ss
    message = f'{hh}:{mm}:{ss} = {format} seconds'
    print(message)
