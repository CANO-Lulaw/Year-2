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

    def height_of_tree(node: AVLNode):
        if node is None:
            return 0
        return 1 + max(AVLTree.height_of_tree(node.left), AVLTree.height_of_tree(node.right))
    def print_space(self, n, removed):
        for _ in range(n):
            print("  ", end="")
        if removed is None:
            print("  ", end="")
        else:
            print(removed.data, end=" ")
    def printTree(self):
        tree_level = []
        temp = []
        tree_level.append(self.root)
        counter = 0
        height = AVLTree.height_of_tree(self.root) - 1
        number_of_elements = 2 ** (height + 1) - 1
        while counter <= height:
            removed = tree_level.pop(0)
            if len(temp) == 0:
                self.print_space(int(number_of_elements / (2 ** (counter + 1))), removed)
            else:
                self.print_space(int(number_of_elements / (2 ** counter)), removed)
            if removed is None:
                temp.append(None)
                temp.append(None)
            else:
                temp.append(removed.left)
                temp.append(removed.right)
            if len(tree_level) == 0:
                print("\n",end='')
                tree_level = temp
                temp = []
                counter += 1

def burnTreeUtil(node, target, q):
    if node is None:
        return 0
    if node.data == target:
        print(node.data)
        if node.left is not None:
            q.append(node.left)
        if node.right is not None:
            q.append(node.right)
        return 1
    a = burnTreeUtil(node.left, target, q)
    if a == 1:
        q_size = len(q)
        while q_size:
            temp = q[0]
            print(temp.data, end=' ')
            q.pop(0)
            if temp.left is not None:
                q.append(temp.left)
            if temp.right is not None:
                q.append(temp.right)
            q_size -= 1
        if node.right is not None:
            q.append(node.right)
        print(node.data)
        return 1
    b = burnTreeUtil(node.right, target, q)
    if b == 1:
        q_size = len(q)
        while q_size:
            temp = q[0]
            print(temp.data, end=' ')
            q.pop(0)
            if temp.left is not None:
                q.append(temp.left)
            if temp.right is not None:
                q.append(temp.right)
            q_size -= 1
        if node.left is not None:
            q.append(node.left)
        print(node.data)
        return 1
def burnTree(root, target):
    q = []
    burnTreeUtil(root, target, q)
    while q:
        q_size = len(q)
        while q_size:
            temp = q[0]
            print(temp.data, end='')
            if temp.left is not None:
                q.append(temp.left)
            if temp.right is not None:
                q.append(temp.right)
            if len(q) != 1:
                print(' ',end = '')
            q.pop(0)
            q_size -= 1
        print()


avl1 = AVLTree()

data, target = input("Enter node and burn node : ").split('/')

for e in data.split(" "):
    avl1.add(e)
avl1.printTree()

if target not in data:
    print(f"There is no {target} in the tree.")
burnTree(avl1.root, int(target))