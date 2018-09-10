console.log('Starting Notes.js')

const fs = require('fs')

module.exports.addNotes = function (title, body) {
    console.log(1)
    const note = {
        title: title,
        data: body
    }

    try {
        const fileData = fs.readFileSync('notes.JSON')
        const jsonFileData = JSON.parse(fileData)

        jsonFileData.notes.push(note)

        const addableNote = JSON.stringify(jsonFileData)
        fs.writeFileSync('notes.json', addableNote)
    } catch (e) {
        let mainjson = {
            notes: []
        }
        mainjson.notes.push(note)
        const addableNote = JSON.stringify(mainjson)
        fs.writeFileSync('notes.json', addableNote)
    }
}

module.exports.listNotes = function () {
    let jsonFileData

    try {
        const fileData = fs.readFileSync('notes.JSON')
        jsonFileData = JSON.parse(fileData)

        const notesList = jsonFileData.notes

        for (let i = 0; i < notesList.length; i++) {
            const note = notesList[i]
            console.log(`------------------`)
            console.log(`Title: ${note.title}`)
            console.log(`Data: ${note.data}`)
        }
    } catch (e) {
        console.log('No Notes!!!!!!!')
    }
}

module.exports.readNotes = function (title) {
    let jsonFileData

    try {
        const fileData = fs.readFileSync('notes.JSON')
        jsonFileData = JSON.parse(fileData)

        const notesList = jsonFileData.notes

        const filteredNotes = notesList.filter(function (note) {
            return note.title === title
        })

        console.log(filteredNotes)

        for (let i = 0; i < filteredNotes.length; i++) {
            const note = filteredNotes[i]
            console.log(`Note No: ${i}`)
            console.log(`Title: ${note.title}`)
            console.log(`Data: ${note.data}`)
        }
    } catch (e) {
        console.log('No Notes!!!!!!!')
    }
}

module.exports.removeNotes = function (title) {
    let jsonFileData

    try {
        const fileData = fs.readFileSync('notes.JSON')
        jsonFileData = JSON.parse(fileData)

        const notesList = jsonFileData.notes

        const filteredNotes = notesList.filter(function (note) {
            return note.title !== title
        })

        const data = {
            notes: filteredNotes
        }

        const addableNote = JSON.stringify(data)
        fs.writeFileSync('notes.json', addableNote)
    } catch (e) {
        console.log('No Notes!!!!!!!')
    }
}
