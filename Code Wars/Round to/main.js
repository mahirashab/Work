function roundTo(number, point) {
    let pointIndex = undefined
    let given = number.toString()

    if (given.includes('.')) {
        pointIndex = given.indexOf('.')
    } else {
        return Number(given)
    }

    if (pointIndex) {
        let mainPart = given.split('.')[0]
        let decimalPart = given.split('.')[1]

        if (point == 0 && Number(decimalPart[0]) >= 5) {
            return Number(mainPart) + 1
        } else if (point == 0) {
            return Number(mainPart)
        }


        let roundedPart = ''
        for (let i = 0; i < point; i++) {
            if (decimalPart[i] !== undefined) {
                roundedPart += decimalPart[i]
            } else {
                console.log('Decimal points are shorter then needed')
                return mainPart + '.' + decimalPart
            }
        }

        let roundedNumberArray = Array.from(roundedPart)
        let decimalPartArray = Array.from(decimalPart)

        let roundedNum = Number(roundedPart)
        let mainNum = Number(mainPart)

        let lastIndex = roundedNumberArray.length

        let num = Number(decimalPartArray[lastIndex])


        if (num >= 5) {
            roundedNum++
        }

        if (roundedNum.toString().length > roundedPart.length) {
            mainNum++
            return Number(mainNum.toString())

        } else if (roundedNum.toString().length < roundedPart.length) {
            let min = roundedNum.toString().length
            let max = roundedPart.length

            let final = roundedNum.toString()

            for (let i = 0; i < max - min; i++) {
                final = '0' + final
            }

            return Number(mainNum.toString() + '.' + final)
        }

        return Number(mainNum.toString() + '.' + roundedNum.toString())
    }
}