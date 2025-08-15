# VS Code Workspace Auto-Tracker
# Run this weekly to update your workspace list

$workspaceFile = "workspace-tracker.md"
$date = Get-Date -Format "MMMM dd, yyyy"

Write-Host " Scanning for VS Code workspaces..." -ForegroundColor Cyan

# Common workspace locations
$searchPaths = @(
    "$env:USERPROFILE\OneDrive\Desktop",
    "$env:USERPROFILE\Documents",
    "$env:USERPROFILE\Source",
    "$env:USERPROFILE\Projects"
)

$workspaces = @()

foreach ($path in $searchPaths) {
    if (Test-Path $path) {
        $folders = Get-ChildItem -Path $path -Directory -Recurse -Depth 2 | 
                   Where-Object { 
                       (Test-Path "$($_.FullName)\.git") -or 
                       (Test-Path "$($_.FullName)\.vscode") -or
                       (Test-Path "$($_.FullName)\package.json") -or
                       (Test-Path "$($_.FullName)\requirements.txt")
                   }
        
        foreach ($folder in $folders) {
            $workspace = @{
                Name = $folder.Name
                Path = $folder.FullName
                HasGit = Test-Path "$($folder.FullName)\.git"
                HasVSCode = Test-Path "$($folder.FullName)\.vscode"
                LastModified = $folder.LastWriteTime
            }
            $workspaces += $workspace
        }
    }
}

Write-Host " Found $($workspaces.Count) workspaces" -ForegroundColor Green

# Update tracker file
$content = @"
#  VS Code Workspace Tracker (Auto-Generated)

**Last Scan**: $date
**Workspaces Found**: $($workspaces.Count)

##  Active Workspaces

"@

foreach ($ws in $workspaces | Sort-Object LastModified -Descending) {
    $gitStatus = if ($ws.HasGit) { " Git Repo" } else { " No Git" }
    $vscodeStatus = if ($ws.HasVSCode) { " VS Code Config" } else { "" }
    
    $content += @"

### **$($ws.Name)**
- **Path**: ``$($ws.Path)``
- **Status**: $gitStatus $vscodeStatus
- **Last Modified**: $($ws.LastModified.ToString("yyyy-MM-dd"))

"@
}

$content += @"

##  Quick Access Commands

### Open in VS Code
``````powershell
# Open workspace in VS Code
code "path\to\workspace"
``````

### Git Commands
``````bash
# Quick status check
git status

# Push changes  
git add . && git commit -m "Update" && git push
``````

---
**Auto-Generated**: $date
"@

$content | Out-File -FilePath $workspaceFile -Encoding UTF8
Write-Host " Updated $workspaceFile" -ForegroundColor Yellow
