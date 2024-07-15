def is_valid_map(width, height, room):
    # ตรวจสอบว่าแผนที่มี 'F' หรือไม่
    start_found = any('F' in row for row in room)

    # ตรวจสอบความยาวของแต่ละแถว
    valid_width = all(len(row) == width for row in room)

    # ตรวจสอบเงื่อนไขทั้งหมด
    if not start_found or not valid_width:
        return False
    return True

def bfs_find_exit(width, height, room):
    if not is_valid_map(width, height, room):
        print("Invalid map input.")
        return

    start = None
    for i in range(height):
        for j in range(width):
            if room[i][j] == 'F':
                start = (i, j)
                break
        if start:
            break

    directions = [(-1, 0), (0, 1), (1, 0), (0, -1)]  # เหนือ ตะวันออก ใต้ ตะวันตก
    queue = [start]
    visited = set()
    visited.add(start)

    while queue:
        current = queue.pop(0)
        print("Queue:", queue)

        if room[current[0]][current[1]] == 'O':
            print("Found the exit portal.")
            return

        for d in directions:
            ni, nj = current[0] + d[0], current[1] + d[1]
            if 0 <= ni < height and 0 <= nj < width and (ni, nj) not in visited and room[ni][nj] != '#':
                queue.append((ni, nj))
                visited.add((ni, nj))

    print("Cannot reach the exit portal.")

# รับ input
input_data = input("Enter width, height, and room: ")
try:
    width, height, room_str = input_data.split(' ', 2)
    width, height = int(width), int(height)
    room = room_str.split(',')
    bfs_find_exit(width, height, room)
except ValueError:
    print("Invalid map input.")
