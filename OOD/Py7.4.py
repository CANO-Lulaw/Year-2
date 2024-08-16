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

    def append(self, data):
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
                elif data >= current.data:
                    if current.right is None:
                        current.right = Node(data)
                        current = current.right
                    current = current.right
        return self.root

    def cut(self, data):
        current = self.root
        while current.data != data:
            if data <  current.data:
                current = current.left
            elif data >= current.data:
                current = current.right
        if current.right is not None:
            current.right = None
        elif current.left is not None: 
            current.left = None
        else : print("Not thing change")
                
    def preorder(self, node, stop):
        if node != None:
            if node.data <= stop:
                if len(node.data) == 1:
                    print(ord(node.data) ,end=' ')
                else: 
                    temp = ''.join(str(ord(c)) for c in node.data)
                    print(temp,end=' ')
            elif node.data > stop:
                print(node.data ,end=' ')
            self.preorder(node.left, stop)
            self.preorder(node.right, stop)

    def inorder(self, node,stop):
        if node != None:
            self.inorder(node.left, stop)
            if node.data <= stop:
                if len(node.data) == 1:
                    print(ord(node.data) ,end=' ')
                else:
                    temp = ''.join(str(ord(c)) for c in node.data)
                    print(temp,end=' ')
            elif node.data > stop:
                print(node.data ,end=' ')
            self.inorder(node.right, stop)

    def postorder(self, node,stop):
        if node != None:
            self.postorder(node.left, stop)
            self.postorder(node.right, stop)
            if node.data <= stop:
                if len(node.data) == 1:
                    print(ord(node.data) ,end=' ')
                else: 
                    temp = ''.join(str(ord(c)) for c in node.data)
                    print(temp,end=' ')
            elif node.data > stop:
                print(node.data ,end=' ')

    def printMirrorTree(self, node, level=0):
        if node != None:
            self.printMirrorTree(node.left, level + 1)
            print('     ' * level, node)
            self.printMirrorTree(node.right, level + 1)

    def printTree(self, node, level=0):
        if node != None:
            self.printTree(node.right, level + 1)
            print('     ' * level, node)
            self.printTree(node.left, level + 1)

T = BST()
print("What is this a plum tree")
first,inp = input('Enter Input : ').split('/')
first = first.split()
for i in first:
    T.append(i)
print("FIrst look of this plum tree")
T.printTree(T.root)
print("********************************************")
inp = inp.split(',')
for i in inp:
    print(i)
    if i[:2] == "AP":
        T.append(i[3:])
        T.printTree(T.root)
    elif i[:2] == "CU":
        T.cut(i[3:])
        T.printTree(T.root)
    elif i[:2] == "CH":
        print('preorder  :',end=' ')
        T.preorder(T.root,i[3:])
        print('\ninorder   :',end=' ')
        T.inorder(T.root,i[3:])
        print('\npostorder :',end=' ')
        T.postorder(T.root,i[3:])
        print()
    elif i[:2] == "MI":
        T.printMirrorTree(T.root)
    print("********************************************")
print("the last result")
T.printTree(T.root)