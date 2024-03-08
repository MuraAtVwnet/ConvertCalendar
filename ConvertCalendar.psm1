# 和暦西暦変換


######################################################
# 西暦 to 和暦
######################################################
function AD2JapaneseCalendar([string]$YMD){
	if( $YMD -ne [string]$null ){
		$InputDateTime = $YMD -as [datetime]
		if( $InputDateTime -eq $null ){
			retrun "$YMD は西暦として認識できません"
		}
	}
	else{
		$InputDateTime = Get-Date
	}

	$Cultureinfo = New-Object cultureinfo("ja-jp", $true)
	$Cultureinfo.DateTimeFormat.Calendar = New-Object System.Globalization.JapaneseCalendar
	Try{
		$StingOutputDateTime = $InputDateTime.ToString("gy年M月d日", $Cultureinfo)
	}
	catch{
		retrun "$YMD は西暦として認識できません"
	}

	return $StingOutputDateTime
}



######################################################
# 和暦 to 西暦
######################################################
function JapaneseCalendar2AD([string]$Gengo, [string]$YMD){
	if( $YMD -ne [string]$null ){
		$JC = $Gengo + $YMD
	}
	elseif( $Gengo -ne [string]$null ){
		$JC = $Gengo
	}
	else{
		retrun "元号 と 年月日を入力してください"
	}

	# 日付分解
	if($JC -match "(?<Gengo>^.+?)(?<YY>[0-9]+?).(?<MM>[0-9]+?).(?<DD>[0-9]+?) *$"){
		# NOP
	}
	elseif($JC -match "(?<Gengo>^.+?)(?<YY>[0-9]+?)年(?<MM>[0-9]+?)月(?<DD>[0-9]+?)日"){
		# NOP
	}
	else{
		return "$JC は和暦として認識できません"
	}

	$GG = $Matches.Gengo
	$YY = $Matches.YY
	$MM = $Matches.MM
	$DD = $Matches.DD

	# 和暦変換ハッシュテーブル
	$WarekiHash = @{
		"r"		= "令和"
		"h"		= "平成"
		"s"		= "昭和"
		"m"		= "明治"
		"t"		= "大正"
		"令和"	= "令和"
		"平成"	= "平成"
		"昭和"	= "昭和"
		"明治"	= "明治"
		"大正"	= "大正"
	}

	$Gengo = $WarekiHash[$GG]
	if( $Gengo -eq $null ){
		return $null
	}

	[string]$Wareki = $Gengo+$YY + "年" + $MM + "月" + $DD + "日"

	$Cultureinfo = New-Object cultureinfo("ja-jp", $true)
	$Cultureinfo.DateTimeFormat.Calendar = New-Object System.Globalization.JapaneseCalendar

	Try{
		$OutputDateTime = [datetime]::ParseExact($Wareki, "gy年M月d日", $Cultureinfo)
	}
	catch{
		return "$JC は和暦として認識できません"
	}

	$StingOutputDateTime = $OutputDateTime.ToString("yyyy/MM/dd")

	return $StingOutputDateTime
}


