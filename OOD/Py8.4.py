class AVLTree:

    class AVLNode:
        def __init__(self, data, left=None, right=None):
            self.data = data
            self.left = left
            self.right = right
            self.height = self.setHeight()

        def setHeight(self):
            a = self.getHeight(self.left)
            b = self.getHeight(self.right)
            self.height = 1 + max(a, b)
            return self.height

        def getHeight(self, node):
            return -1 if node is None else node.height

        def balanceValue(self):
            return self.getHeight(self.right) - self.getHeight(self.left)

    def __init__(self, root=None):
        self.root = root

    def add(self, data):
        self.root = self._add(self.root, int(data))

    def _add(self, root, data):
        if root is None:
            return self.AVLNode(data)

        if data < root.data:
            root.left = self._add(root.left, data)
        else:
            root.right = self._add(root.right, data)

        root.setHeight()

        return self.reBalance(root)

    def reBalance(self, root):
        if root.balanceValue() < -1: #หนักซ้าย
            if root.left.balanceValue() > 0: #ขวา
                root.left = self.rotateLeftChild(root.left)
            return self.rotateRightChild(root) 

        if root.balanceValue() > 1: #หนักขวา
            if root.right.balanceValue() < 0:
                root.right = self.rotateRightChild(root.right) #ซ้าย
            return self.rotateLeftChild(root) 

        return root

    def rotateLeftChild(self, root):
        head = root.right
        root.right = head.left
        head.left = root

        root.setHeight()
        head.setHeight()
        return head

    def rotateRightChild(self, root):
        head = root.left
        root.left = head.right
        head.right = root

        root.setHeight()
        head.setHeight()
        return head

    def postOrder(self):
        print("AVLTree post-order : ", end='')
        self._postOrder(self.root)
        print()

    def _postOrder(self, root):
        if root is not None:
            self._postOrder(root.left)
            self._postOrder(root.right)
            print(root.data, end=' ')

    def _printTree(self, node, level=0):
        if node is not None:
            self._printTree(node.right, level + 1)
            print('     ' * level, node.data)
            self._printTree(node.left, level + 1)

    def printTree(self):
        self._printTree(self.root)
        print()


avl1 = AVLTree()

inp = list(i.split(" ") for i in input('Enter node and burn node :  ').split('/'))

for e in inp[0] :
    avl1.add(e)
avl1.printTree()