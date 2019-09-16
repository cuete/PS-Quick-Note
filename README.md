# PS-Quick-Note
Powershell module to take and display quick notes in the console

## Importing the Powershell module to your session
`PS> Import-Module -Name {path}/Quick-Note.psm1`

## Usage
Clears cached notes
`PS> Quick-Note -x`

Appends a new note to cache
`PS> Quick-Note -a "new note"`

Display cached notes
`PS> Quick-Note`

## Alias
To make it easier use the alias `cn` (instead of `Quick-Note`)
