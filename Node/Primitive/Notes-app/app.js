console.log('app started!!!')

const yargs = require('yargs')
const notes = require('./notes.js')

const commands = yargs.argv

if (commands._[0] === 'add') {
    notes.addNotes(yargs.argv.title, yargs.argv.body)
} else if (commands._[0] === 'list') {
    notes.listNotes()
} else if (commands._[0] === 'remove') {
    notes.removeNotes(yargs.argv.title)
} else if (commands._[0] === 'read') {
    notes.readNotes(yargs.argv.title)
}