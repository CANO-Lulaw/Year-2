class Node:
    def __init__(self, data):
        self.data = data
        self.left : Node = None
        self.right : Node = None
    
    def __str__(self):
        return str(self.data)

class BST:
    def __init__(self):
        self.root = None

    def insert(self, data):
        if self.root is None :
            self.root = Node(data)
        else :
            current = self.root
            while current is not None: 
                if data < current.data:
                    if current.left is None:
                        current.left = Node(data)
                        current = current.left
                    current = current.left
                elif data > current.data:
                    if current.right is None:
                        current.right = Node(data)
                        current = current.right
                    current = current.right
        return self.root
    
    # def findHeight(self, node, count = 0):
    #     if node is None:
    #         return count
    #     else: 
    #         left_height = self.findHeight(node.left, count + 1) 
    #         right_height = self.findHeight(node.right, count + 1)
    #         return max(left_height, right_height)
        
    def findHeight2(self, node):
        if node is None:
            return -1
        left_height = self.findHeight2(node.left) 
        right_height = self.findHeight2(node.right)
        return max(left_height, right_height)+1
        

T = BST()
inp = [int(i) for i in input('Enter Input : ').split()]
for i in inp:
    root = T.insert(i)
print("Height of this tree is :", T.findHeight2(root))