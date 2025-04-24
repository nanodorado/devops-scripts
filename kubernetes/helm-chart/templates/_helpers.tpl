{{- define "nginx-app.name" -}}
nginx-app
{{- end }}

{{- define "nginx-app.fullname" -}}
{{ include "nginx-app.name" . }}
{{- end }}
