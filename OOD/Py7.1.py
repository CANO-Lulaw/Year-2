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

    def printTree(self, node, level = 0):
        if node != None:
            self.printTree(node.right, level + 1)
            print('     ' * level, node)
            self.printTree(node.left, level + 1)

T = BST()
inp = [int(i) for i in input('Enter Input : ').split()]
for i in inp:
    root = T.insert(i)
T.printTree(root)