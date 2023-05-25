import sys
import os
import pickle
import getpass

# Queue 
class Queue:

    def __init__(self):
        self.queue = []

    def enqueue(self, val):
        self.queue.insert(0, val)

    def dequeue(self):
        if not self.is_empty():
            return self.queue.pop()
        else:
            return None

    def is_empty(self):
        print(len(self.queue) == 0)
        return len(self.queue) == 0

    def print_all(self):
        print(self.queue)

 # setting up files
user = getpass.getuser()
root = os.path.abspath(os.sep)
path = os.path.join(root, 'Users', user, 'Documents', 'clipboard_files')
if not os.path.exists(path):
    os.makedirs(path)

clipboard_file = os.path.join(path, 'clipboard_queue.pickle')
tempboard_file = os.path.join(path, 'temp_clipboard.txt')

# creates empty queue if none exists
if not os.path.exists(clipboard_file):
    queue = Queue()
    with open(clipboard_file, 'wb') as file:
        pickle.dump(queue, file)
    file.close()

# retreiving parameters 
text = sys.argv[1]
operation = sys.argv[2] # -c or -v








with open(clipboard_file, 'rb') as file:
    keyboard_queue = pickle.load(file)
    file.close()
#chooses operation
if operation == '-c': #enqueues seletcted text
    keyboard_queue.enqueue(text)
    
elif operation == '-v': #pastes text from queue to file
    return_word = keyboard_queue.dequeue()
    
    with open(tempboard_file, 'w') as file:
        file.write(return_word)
        file.close()
    #keyboard_queue.print_all()


with open(clipboard_file, 'wb') as file:
    pickle.dump(keyboard_queue, file)
    file.close()





