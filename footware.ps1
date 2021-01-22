function Open-Pjweb
{
    param()

    begin
    {
        # Add-Type -AssemblyName Microsoft.VidualBasic
    }

    process
    {
        $shell = New-Object -ComObject Shell.Application | Out-Null
        $ie = New-Object -ComObject InternetExplorer.Application
        $url = "https://pjshr170.soln.jp/IJSM08F/pjwebroot/index.jsp"
        $ie.Visible = $true

        $hwnd = $ie.HWND


        $ie.Navigate($url, 4)

        # $window_precess = Get-Process -Name 'iexplore' | ? {$_.MainWindowHandle -eq $ie.HWND }
        # [Microsoft.VisualBasic.Interaction]::AppActivate($window_precess.ID) | Out-Null
        while ($ie.Doucment -isnot [mshtml.HTMLDocumentClass]) {
            $ie = $shell.Windows() | Where-Object {$_.HWND -eq $hwnd}
        }


    }

    end
    {
    }
}

# $ret = Open-Pjweb
# $ret

$apiKey = 'bab7ca18f7de9b9b41ac64df18674fdc'

function Get-ApiFootballTest
{
    param()
    begin{

        $url = 'https://v3.football.api-sports.io'
        $endpoint = '/leagues'
        $uri = "{0}{1}" -f $url, $endpoint
        $headers = @{
            'x-rapidapi-host' = 'v3.football.api-sports.io'
            'x-rapidapi-key' = 'bab7ca18f7de9b9b41ac64df18674fdc'
        }
        $res = Invoke-RestMethod -Method Get -Uri $uri -Headers $headers

        $res.response | ConvertTo-Json
    }
    process{}
    end{}
}

# $ret = Get-ApiFootballTest
# $ret 

[PSCustomObject]@{
    ApiKey = 'bab7ca18f7de9b9b41ac64df18674fdc'
} | ConvertTo-Json