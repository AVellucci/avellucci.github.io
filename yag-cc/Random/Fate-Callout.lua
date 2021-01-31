{{/* 
	Trigger: Contains | 👍
	Callout Fate's :+1: messages
*/}}

{{$var := randInt 100}}
{{if eq .User.ID 134041770785767426}}
{{if lt $var 15}}
	Wow, just wow. Look what we have here, Fate has used this **{{dbIncr .User.ID "+1" 1}}** times now...
{{else if lt $var 30}}
	Fate must really approve for him to be using this again. Congrats he has used this **{{dbIncr .User.ID "+1" 1}}** times.
{{else}}
	Fate has used this reaction **{{dbIncr .User.ID "+1" 1}}** tiimes.
{{end}}
{{end}}