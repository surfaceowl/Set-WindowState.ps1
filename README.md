# Powershell Set-WindowsState 

Some minor updates to @Nora-Ballard's excellent work at:
https://gist.github.com/Nora-Ballard/11240204

These .ps1 enables effective window mgmt in Win 11 using Powershell, even with annoying windows like Evernote that love to maximize front and center at login. <br>

**Three files to consider - broken out to show order of changes:** <br>
*Set-WindowState.ps1*  -- directly from Nora's gist, for reference / diffs<br>
*Set-WindowState-v2-basic-fixes.ps1* -- corrects quote and dash chars that cause powershell errors on my Win 11 install <br> 
*Set-WindowState-v3-style-suggestions.ps1* -- building on v2, some minor order/style changes <br><br>

*These fixes address a few issues encountered on my Win 11 platform: <br>*
**v2 file changelog**<br>
-- curly quotes caused powershell errors. <br>
-- long dashes did not error, but I changed them for consistency with rest of original code.  <br>
-- recommend file be UTF-8 to help avoid encoding issues.<br>
<br>
**v3 file changelog**<br>
-- continued with some formatting / style chx<br>
