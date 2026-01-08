{{/* The subchart that is used to fill in the calling chart with a data */}}
{{/* The full set of values can be found https://github.com/mariadb-operator/mariadb-operator/blob/main/deploy/charts/mariadb-operator/values.yaml */}}
{{- define "mariadbOperator.computedValues" -}}
metrics:
  enabled: true
{{- end -}}
