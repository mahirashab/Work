class Matrix {

    constructor(cols, rows) {
        this.cols = cols
        this.rows = rows

        this.data = []

        for (let i = 0; i < this.cols; i++) {
            this.data[i] = []
            for (let j = 0; j < this.rows; j++) {
                this.data[i][j] = []
            }
        }
        this.randomize()
    }

    randomize() {
        for (let i = 0; i < this.cols; i++) {
            for (let j = 0; j < this.rows; j++) {
                this.data[i][j] = Math.random() * 2 - 1
            }
        }
    }

    static multiply(m, n) {
        let result = new Matrix(m.cols, m.rows)
        if (n instanceof Matrix) {
            for (let i = 0; i < m.rows; i++) {
                for (let j = 0; j < m.cols; j++) {
                    result.data[i][j] = m.data[i][j] * n.data[i][j]
                }
            }
        } else {
            for (let i = 0; i < m.rows; i++) {
                for (let j = 0; j < m.cols; j++) {
                    result.data[i][j] = m.data[i][j] * n
                }
            }
        }
        return result
    }

    static add(m, n) {
        let result = new Matrix(m.cols, m.rows)
        if (n instanceof Matrix) {
            for (let i = 0; i < m.rows; i++) {
                for (let j = 0; j < m.cols; j++) {
                    result.data[i][j] = m.data[i][j] + n.data[i][j]
                }
            }
        } else {
            console.table(1)
            for (let i = 0; i < m.rows; i++) {
                for (let j = 0; j < m.cols; j++) {
                    result.data[i][j] = m.data[i][j] + n
                }
            }
        }
        return result
    }


    static transpose(m) {
        let result = new Matrix(m.rows, m.cols)

        for (let i = 0; i < m.cols; i++) {
            for (let j = 0; j < m.rows; j++) {
                result.data[j][i] = m.data[i][j]
            }
        }
        return result
    }

    static dotProduct(m, n) {
        let result = new Matrix(m.cols, n.rows)
        if (n instanceof Matrix && m.cols == n.rows) {
            if (m.cols == m.rows) {
                for (let i = 0; i < result.rows; i++) {
                    for (let j = 0; j < result.cols; j++) {
                        // inner loop
                        let sum = 0
                        for (let k = 0; k < m.cols; k++) {
                            sum += m.data[i][k] * n.data[k][j]
                        }
                        result.data[i][j] = sum
                    }
                }
            } else {
                for (let i = 0; i < result.rows; i++) {
                    for (let j = 0; j < result.cols; j++) {
                        // inner loop
                        let sum = 0
                        for (let k = 0; k < m.rows; k++) {
                            sum += m.data[i][k] * n.data[k][j]
                        }
                        result.data[i][j] = sum
                    }
                }
            }
        }
        return result
    }

    static subtract(a, b) {
        let result = new Matrix(a.cols, a.rows)
        if (a.cols == b.cols && a.rows == b.rows) {
            for (let i = 0; i < a.rows; i++) {
                for (let j = 0; j < a.cols; j++) {
                    console.log(a.data[i][j], b.data[i][j])

                    let num = a.data[i][j] - b.data[i][j]
                    num = Math.round(num * 1000000000) / 1000000000

                    result.data[i][j] = a.data[i][j] - b.data[i][j]
                }
            }
        }
        return result
    }

    static fromArray(arr) {
        let m = new Matrix(arr.length, 1)
        for (let i = 0; i < arr.length; i++) {
            m.data[i][0] = arr[i]
        }
        return m
    }

    toArray() {
        let arr = []
        for (let i = 0; i < this.rows; i++) {
            for (let j = 0; j < this.cols; j++) {
                arr.push(this.data[j][i])
            }
        }
        return arr
    }

    map(func) {
        for (let i = 0; i < this.rows; i++) {
            for (let j = 0; j < this.cols; j++) {
                let value = this.data[i][j]
                this.data[i][j] = func(value)
            }
        }
    }

    print() {
        console.table(this.data)
    }
}