class Subscriber:
    def __init__(self, name):
        self.name = name
    def update(self, message):
        print('{} got message "{}"'.format(self.name, message))

class Publisher:
    def __init__(self):
        """Creates an empty set. This will be a useful data structure on the publishers side to keep track of what is 
           going on.
        """        
        self.subscribers = set()
    def register(self, who):
        """Allows the subscriber(observer) to register itself with the Publisher(observable)

        Args:
            who ([type]): [description]
        """        
        self.subscribers.add(who)
    def unregister(self, who):
        """Allows the subscriber(observer) to unregister itself with the Publisher(observable)

        Args:
            who ([type]): [description]
        """        
        self.subscribers.discard(who)
    def dispatch(self, message):
        """When invoked every subscriber has their update method invoked, and the argument message is passed to the 
           subscriber

        Args:
            message ([type]): [description]
        """        
        for subscriber in self.subscribers:
            subscriber.update(message)