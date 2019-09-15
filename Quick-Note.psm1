function Quick-Note {
    param(
        [string] $a,
        [switch] $x)

    if($x -And $note)
    {
        Clear-Variable -Scope Global -Name note
    }
    elseif ($a)
    {
        $global:note += "> " + $a + "`n"
    }

    outputNote($note)

<#
.SYNOPSIS
Store and view quick text notes in the Powershell console.

.DESCRIPTION
This module caches text notes appending them to a persistent variable in the current Powershell session. 
It allows to clear, append and display the note cache on the Powershell console.
The note cache will be cleared when the Powershell session ends.

To use import as a PS module: 
PS> Import-Module -Name {path}/Quick-Note.psm1 

.PARAMETER a
String to append to current note cache.

.PARAMETER x
Clear note cache.

.EXAMPLE
PS> Quick-Note -x

.EXAMPLE
PS> Quick-Note -a "Hello world"

.EXAMPLE
PS> Quick-Note

#>
}

function outputNote([string]$note)
{
    $spacer = "༻༻༻༻༻༻༻༻༻༻༻༻༻༻༻༻༻༻༻༻༻༻༻༻༻༻༻༻༻"
    Write-Host `n$spacer`n
    Write-Host $note
    Write-Host $spacer`n
}

New-Alias -Name cn -Value Quick-Note

Export-ModuleMember -Function Quick-Note -Alias cn
