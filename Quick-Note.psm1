function Quick-Note {
    param(
        [string] $a,
        [switch] $x)

    #Clers cache if switch on
    if($x -And $notes)
    {
        Clear-Variable -Scope Global -Name notes
    }

    #Initializes cache if first run
    if(!$notes)
    {
        $global:notes = New-Object System.Collections.ArrayList
    }
    
    #Appends new note to cache
    if ($a)
    {
        $datetime = Get-Date
        $id = $notes.Count + 1
        $newnote = New-Object System.Object
        $newnote | Add-Member -MemberType NoteProperty -Name Id -Value $id
        $newnote | Add-Member -MemberType NoteProperty -Name DateTime -Value $datetime
        $newnote | Add-Member -MemberType NoteProperty -Name Note -Value $a
        $notes.Add($newnote)
    }
    
    #Print cache to console
    PrintNotes($notes)

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

#Print note cache to screen
function PrintNotes([System.Collections.ArrayList]$notes)
{
    $spacer = "༻༻༻༻༻༻༻༻༻༻༻༻༻༻༻༻༻༻༻༻༻༻༻༻༻༻༻༻༻"
    Write-Host $spacer
    $notes | Format-Table Id, @{Label="DateTime"; Expression={$_.DateTime.ToString("MM/dd HH:mm")}}, Note 
    Write-Host $spacer
}

#Making module alias available
New-Alias -Name cn -Value Quick-Note
#Exposing module main function
Export-ModuleMember -Function Quick-Note -Alias cn
