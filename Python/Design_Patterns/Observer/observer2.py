class SubscriberOne:
    def __init__(self, name):
        self.name = name
    def update(self, message):
        print('{} got message "{}"'.format(self.name, message))


class SubscriberTwo:
    def __init__(self, name):
        self.name = name
    def receive(self, message):
        print('{} got message "{}"'.format(self.name, message))


class Publisher:
    def __init__(self):
        """
        """        
        self.subscribers = dict()
    def register(self, who, callback=None):
        if callback is None:
            callback = getattr(who, 'update')       
        self.subscribers[who] = callback
    def unregister(self, who):
        """Remove subscriber from dictionary
        """        
        del self.subscribers[who]
    def dispatch(self, message):
        """ .item() returns an iterator
        """        
        for subscriber, callback in self.subscribers.items():
            callback(message)