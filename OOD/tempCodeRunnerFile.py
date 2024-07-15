       for i in range(S.size()):
                item = S.pop()
                if (item%2 == 0):
                    M.push(item - 1)
                elif (item%2 != 0):
                    M.push(item + 2)
            S.items.clear()
            S.items = list(reversed(M.items))
            M.items.clear()