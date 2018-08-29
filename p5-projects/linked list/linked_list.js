function Node(data) {
    this.data = data;
    this.nextLink = 0;
}


function linked_list() {

    this.head = 0;
    this.size = 0;


    // O(n) Notation
    this.show = function() {
        if (this.head === 0) {
            console.log('No Item');
        } else {
            var current = this.head;
            while (current.nextLink != 0) {
                console.log(current.data);
                current = current.nextLink;
                if (current.nextLink === 0) {
                    console.log(current.data);
                }
            }
        }
    }

    // O(n) Notation
    this.insertFirst = function(data) {
        newNode = new Node(data);
        this.size += 1;

        if (this.head === 0) {
            this.head = newNode;
        } else {
            var temp = this.head;
            this.head = newNode;
            this.head.nextLink = temp;
            console.log(this.head.data);
        }
    }

    // O(n) Notation
    this.insertEnd = function(data) {
        var current = this.head;
        var newNode = new Node(data);
        this.size += 1;

        while (current.nextLink != 0) {
            current = current.nextLink;
        }

        current.nextLink = newNode;
    }

    // O(n) Notation
    this.remove = function(data) {

        if (this.size == 0) {
            return;
        }

        var current = this.head;
        var previous = 0;
        this.size -= 1;

        while (current.data != data) {
            previous = current;
            current = current.nextLink;
        }

        if (previous == 0) {
            this.head = current.nextLink;
        } else {
            previous.nextLink = current.nextLink;
        }
    }

    // O(1) Notation
    this.size0 = function() {
        return this.size;
    }

    // O(n) Notation
    this.size1 = function() {
        var current = this.head;
        size = 0;
        while (current.nextLink != 0) {
            size += 1;
            current = current.nextLink;
        }
        return size + 1;
    }


}
