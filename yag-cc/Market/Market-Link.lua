{{/*
	Trigger: RegEx | https?\:\/\/\S+
	Used in Tandem with Market-Reactions
	Post links in the market to a dedicated channel and leverage Discords Auto-Embed feature
*/}}

{{$0 := ""}}
{{$z := (reFind `https?:\/\/\S+` .Message.Content)}}
{{$y := sendMessageRetID 754944735243665450 (reReplace `\S+(?:\.jpg|\.png|\.gif|\.jpg|-gif-|/gifs/)(\S+|)` $z ``)}}
{{$x := (toString $y)}}
 
{{if ne $x $0}}
    {{addMessageReactions 754944735243665450 $y ":heart:" ":hammer:" ":moneybag:" ":exclamation:" ":x:"}}
{{end}}