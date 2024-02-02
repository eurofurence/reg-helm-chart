{{- define "helpers.service" -}}
{{- /* render a service. Use with template directive. Expects a dictionary with keys .all (=top level .Values), .component (= config for component), .name (= the name of the service) */ -}}
apiVersion: v1
kind: Service
metadata:
  name: {{ .name }}
  {{- with .all.global.namespace }}
  namespace: '{{ . }}'
  {{- end }}
  labels:
    {{- $mergedLabels := merge .component.labels .all.system.labels }}
    {{- $mergedLabels | toYaml | nindent 4 }}
spec:
  ports:
    - port: 8080
      appProtocol: http
      name: application
      targetPort: primary
  selector:
    {{- pick $mergedLabels "app" "service" "regsysChart" | toYaml | nindent 4 }}
  type: ClusterIP
{{- end }}

{{- define "helpers.deployment" -}}
{{- /* render a deployment. Use with template directive. Expects a dictionary with keys .all (=top level .Values), .component (= config for component), .name (= the name of the service), .secrets (= list of secret envs to add to env) */ -}}
apiVersion: apps/v1
kind: Deployment
metadata:
  name: {{ .name }}
  {{- with .all.global.namespace }}
  namespace: '{{ . }}'
  {{- end }}
  labels:
    {{- $mergedLabels := merge .component.labels .all.system.labels }}
    {{- $mergedLabels | toYaml | nindent 4 }}
spec:
  replicas: {{ .component.replicas }}
  revisionHistoryLimit: 3
  selector:
    matchLabels:
      {{- pick $mergedLabels "app" "service" "regsysChart" | toYaml | nindent 6 }}
  template:
    metadata:
      labels:
        {{- $mergedLabels | toYaml | nindent 8 }}
    spec:
      containers:
        - name: application
          {{- with .component.docker }}
          image: '{{ .registry }}/{{ .repository }}:{{ .tag }}'
          {{- end }}
          {{- with .command }}
          command: ["{{ . }}"]
          {{- end }}
          {{- with .args }}
          args:
          {{- toYaml . | nindent 14 }}
          {{- end }}
          ports:
            - containerPort: 8080
              name: primary
          readinessProbe:
            httpGet:
              port: primary
              path: /
            initialDelaySeconds: 2
            periodSeconds: 10
            successThreshold: 1
            timeoutSeconds: 5
          resources:
            limits:
              memory: {{ .component.limits.memory }}
          securityContext:
            allowPrivilegeEscalation: false
            capabilities:
              drop:
                - ALL
          env:
{{- range .secrets }}
            - name: {{ . }}
              valueFrom:
                secretKeyRef:
                  name: regsys-secret
                  key: {{ . }}
{{- end }}
{{- range .envs }}
            - name: {{ . }}
              valueFrom:
                configMapKeyRef:
                  name: regsys-cm
                  key: {{ . }}
{{- end }}
{{- if ne .volume "no" }}
          volumeMounts:
            - name: config-file
              mountPath: /config
              readOnly: true
      volumes:
        - name: config-file
          configMap:
            name: regsys-cm
            items:
              - key: {{ .name }}-config
                path: config.yaml
                mode: 0444
{{- end }}
{{- end }}
