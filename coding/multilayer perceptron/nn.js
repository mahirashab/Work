class NuralNetwork {

    constructor(input, hidden, output) {
        this.inputNodes = input
        this.hiddenNodes = hidden
        this.outputNodes = output

        this.weights_ih = new Matrix(this.hiddenNodes, this.inputNodes)
        this.weights_ho = new Matrix(this.outputNodes, this.hiddenNodes)
        this.weights_ih.randomize()
        this.weights_ho.randomize()

        this.biasHidden = new Matrix(this.hiddenNodes, 1)
        this.biasOutput = new Matrix(this.outputNodes, 1)
        this.biasHidden.randomize()
        this.biasOutput.randomize()
    }

    feedForward(input_arr) {
        let inputs = Matrix.fromArray(input_arr)

        let hidden = Matrix.dotProduct(this.weights_ih, inputs)
        hidden = Matrix.add(hidden, this.biasHidden)
        hidden.map(this.sigmoid)


        let output = Matrix.dotProduct(this.weights_ho, hidden)
        output = Matrix.add(output, this.biasOutput)
        output.map(this.sigmoid)

        return output.toArray()
    }

    train(inputs, targets) {
        let outputs = this.feedForward(inputs)

        outputs = Matrix.fromArray(outputs)
        targets = Matrix.fromArray(targets)

        let output_error = Matrix.subtract(targets, outputs)

        let weights_ho_t = Matrix.transpose(this.weights_ho)
        let hidden_errors = Matrix.dotProduct(weights_ho_t, output_error)

        hidden_errors.print()
    }

    sigmoid(x) {
        return 1 / (1 + Math.exp(-x))
    }
}