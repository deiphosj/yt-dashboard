$lines = Get-Content "C:\Users\Music B\.gemini\antigravity\scratch\yt-dashboard\index.html"
$depth = 0
$lineNum = 0
foreach ($line in $lines) {
    $lineNum++
    $opens = ([regex]::Matches($line, '<div[\s>]')).Count
    $closes = ([regex]::Matches($line, '</div>')).Count
    $depth += $opens - $closes
    
    # Check around the panel boundaries
    if ($line -match 'class="panel' -or $line -match '<!-- TAB') {
        Write-Output "Line ${lineNum}: depth=$depth | $($line.Trim())"
    }
}
Write-Output "Final depth: $depth"
