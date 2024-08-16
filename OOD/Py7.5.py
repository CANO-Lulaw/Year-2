class Node:
    def __init__(self, data,left = None,right = None):
        self.data = data
        self.left = left
        self.right = right

    def __str__(self):
        return str(self.data)

class BST:
    def __init__(self):
        self.root = None

    def postfix_append(self, data):
        stact = []
        for char in data:
            if char in '+-*/':
                node = Node(char)
                node.right = stact.pop()
                node.left = stact.pop()
                stact.append(node)
            else:
                stact.append(Node(char))
        self.root =  stact[0]
        return self.root

    def inorder(self, node):
        if node != None:
            left = self.inorder(node.left)
            right = self.inorder(node.right)
            if node.left and node.right:
                return f"({left}{node.data}{right})"
            return f"{node.data}"

    def prefix(self, node):
        if node != None:
            left = self.prefix(node.left)
            right = self.prefix(node.right)
            if node.left and node.right:
                return f"{node.data}{left}{right}"
            return f"{node.data}"
            
    
    def printTree(self, node, level=0):
        if node != None:
            self.printTree(node.right, level + 1)
            print('     ' * level, node)
            self.printTree(node.left, level + 1)

T = BST()
inp = input('Enter Postfix : ')
node = T.postfix_append(inp)
print("Tree :")
T.printTree(node)
print("--------------------------------------------------")
print("Infix :",end=' ')
print(T.inorder(node))
print("Prefix :",end=' ')
print(T.prefix(node))
