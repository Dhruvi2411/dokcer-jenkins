<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Trivy Report</title>
</head>

<body style="font-family: Arial; background:#0f172a; color:#e2e8f0; margin:0;">

<h2 style="text-align:center; padding:20px; color:#38bdf8;">
🚨 Trivy Security Report
</h2>

<table style="width:98%; margin:auto; border-collapse:collapse; background:#1e293b;">
<tr style="background:#334155; color:white;">
    <th style="padding:10px;">Package</th>
    <th style="padding:10px;">Vulnerability</th>
    <th style="padding:10px;">Severity</th>
    <th style="padding:10px;">Installed</th>
    <th style="padding:10px;">Fixed</th>
    <th style="padding:10px;">Links</th>
</tr>

{{ range . }}
  {{ if .Vulnerabilities }}
    {{ range .Vulnerabilities }}

<tr style="border-bottom:1px solid #475569;">
    <td style="padding:8px;">{{ .PkgName }}</td>

    <td style="padding:8px; color:#60a5fa;">
        {{ .VulnerabilityID }}
    </td>

    <td style="padding:8px;">
        {{ if eq .Severity "CRITICAL" }}
            <span style="background:#dc2626;color:white;padding:4px 8px;border-radius:5px;">CRITICAL</span>
        {{ else if eq .Severity "HIGH" }}
            <span style="background:#f97316;color:white;padding:4px 8px;border-radius:5px;">HIGH</span>
        {{ else if eq .Severity "MEDIUM" }}
            <span style="background:#eab308;color:black;padding:4px 8px;border-radius:5px;">MEDIUM</span>
        {{ else if eq .Severity "LOW" }}
            <span style="background:#22c55e;color:black;padding:4px 8px;border-radius:5px;">LOW</span>
        {{ else }}
            <span style="background:#64748b;color:white;padding:4px 8px;border-radius:5px;">UNKNOWN</span>
        {{ end }}
    </td>

    <td style="padding:8px;">{{ .InstalledVersion }}</td>
    <td style="padding:8px;">{{ .FixedVersion }}</td>

    <td style="padding:8px;">
        {{ range .References }}
            <div>
                <a href="{{ . }}" target="_blank" style="color:#38bdf8;">
                    🔗 Link
                </a>
            </div>
        {{ end }}
    </td>
</tr>

    {{ end }}
  {{ end }}
{{ end }}

</table>

</body>
</html>
