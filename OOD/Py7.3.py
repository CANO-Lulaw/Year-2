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

    def insert(self,data):
        self.root = self._insert(self.root,int(data))
        return self.root
    
    def _insert(self,root,data):
        if root is None:
            return Node(data)
        
        if data < root.data :
            root.left = self._insert(root.left, data)
        else :
            root.right = self._insert(root.right, data)
        
        return root

    def printTree(self, node, level = 0):
        if node is not None:
            self.printTree(node.right, level+1)
            print('     '*level , node)
            self.printTree(node.left,level+1)

    def checkData(self, node, k):
        if node is not None:
            if node.data > k:
                node.data *= 3
            self.checkData(node.left,k) 
            self.checkData(node.right,k)

T = BST()
inp = [i for i in input('Enter Input : ').split("/")]
inp1 = [int(i) for i in inp[0].split()]

for i in inp1:
    root = T.insert(i)

T.printTree(root)
print("--------------------------------------------------")

T.checkData(root,int(inp[1]))
T.printTree(root)

