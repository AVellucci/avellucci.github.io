{{/*
	Trigger: Reaction | Added Reactions only
	Used in Tandem with Market-Link
*/}}

{{ $xEmoji := "❌" }} 
{{ $count := 0 }} {{/* Star emoji name */}}
{{ $xStart := 1 }}
{{ range .ReactionMessage.Reactions }}
	{{ if and (eq .Emoji.Name $xEmoji) (ge .Count $xStart) }}
		{{ $count = .Count }}
	{{ end }}
{{ end }}


{{$cid := .Reaction.ChannelID}}{{$mid := .Reaction.MessageID}}{{$en := .Reaction.Emoji.Name}}
{{if eq .Message.Author.ID 204255221017214977}}
	{{if (eq $en "🔨")}}
		{{$ml := (joinStr "/" "https://discordapp.com/channels" "527608896605388820" $cid $mid)}}
		{{$dm := (joinStr "" $ml "\n" .Message.Content)}}
		{{sendDM $dm}}
	{{else if (eq $en "💰")}}
		{{$ml := (joinStr "/" "https://discordapp.com/channels" "527608896605388820" $cid $mid)}}
		{{$mt := "To be Deleted\n"}}
		{{$mkt := (joinStr "" .Message.Content "\n")}}
		{{$m := (joinStr "" $mt $mkt $ml)}}
		{{sendMessage 756090765721206815 $m}}
	{{else if (eq $en "❗")}}
		{{$ml := (joinStr "/" "https://discordapp.com/channels" "527608896605388820" $cid $mid)}}
		{{$mt := "Attention Needed!\n"}}
		{{$mkt := (joinStr "" .Message.Content "\n")}}
		{{$m := (joinStr "" $mt $mkt $ml)}}
		{{sendMessage 756090765721206815 $m}}
	{{else if and $count (eq .Reaction.Emoji.Name $xEmoji) }}
		{{ if gt $count 9 }}
			{{deleteMessage $cid $mid 3}}
		{{end}}
	{{end}}
{{end}}