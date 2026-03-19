<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Trivy Report</title>
</head>

<body style="font-family: Arial; background:#0f172a; color:#e2e8f0; margin:0;">

<h1 style="text-align:center; padding:20px; color:#38bdf8;">
🚨 Trivy Security Scan Report
</h1>

<table style="width:95%; margin:auto; border-collapse:collapse; background:#1e293b; border-radius:10px; overflow:hidden;">
<tr style="background:#334155;">
    <th style="padding:12px;">Target</th>
    <th style="padding:12px;">Package</th>
    <th style="padding:12px;">Vulnerability</th>
    <th style="padding:12px;">Severity</th>
    <th style="padding:12px;">Description</th>
</tr>

{{ range . }}
    {{ $target := .Target }}
    {{ if .Vulnerabilities }}
        {{ range .Vulnerabilities }}

        <tr style="border-bottom:1px solid #475569;">
            <td style="padding:10px;">{{ $target }}</td>
            <td style="padding:10px;">{{ .PkgName }}</td>
            <td style="padding:10px;">{{ .VulnerabilityID }}</td>

            <td style="padding:10px;">
                {{ if eq .Severity "CRITICAL" }}
                    <span style="background:#dc2626;color:white;padding:5px 10px;border-radius:6px;">CRITICAL</span>
                {{ else if eq .Severity "HIGH" }}
                    <span style="background:#f97316;color:white;padding:5px 10px;border-radius:6px;">HIGH</span>
                {{ else if eq .Severity "MEDIUM" }}
                    <span style="background:#eab308;color:black;padding:5px 10px;border-radius:6px;">MEDIUM</span>
                {{ else if eq .Severity "LOW" }}
                    <span style="background:#22c55e;color:black;padding:5px 10px;border-radius:6px;">LOW</span>
                {{ else }}
                    <span style="background:#64748b;color:white;padding:5px 10px;border-radius:6px;">UNKNOWN</span>
                {{ end }}
            </td>

            <td style="padding:10px;">{{ .Title }}</td>
        </tr>

        {{ end }}
    {{ end }}
{{ end }}

</table>

</body>
</html>
