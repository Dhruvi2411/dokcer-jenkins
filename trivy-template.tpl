<!DOCTYPE html>
<html>
<head>
    <title>Trivy Report</title>
    <style>
        body {
            font-family: Arial;
            background-color: #0f172a;
            color: #e2e8f0;
        }
        h1 {
            text-align: center;
            color: #38bdf8;
        }
        table {
            border-collapse: collapse;
            width: 100%;
        }
        th, td {
            padding: 10px;
            border: 1px solid #334155;
        }
        th {
            background-color: #1e293b;
        }
        .CRITICAL { background-color: #dc2626; }
        .HIGH { background-color: #f97316; }
        .MEDIUM { background-color: #eab308; }
        .LOW { background-color: #22c55e; }
    </style>
</head>
<body>

<h1>🚨 Trivy Security Report</h1>

<table>
<tr>
    <th>Target</th>
    <th>Package</th>
    <th>Vulnerability</th>
    <th>Severity</th>
</tr>

{{ range . }}
  {{ range .Vulnerabilities }}
  <tr class="{{ .Severity }}">
      <td>{{ $.Target }}</td>
      <td>{{ .PkgName }}</td>
      <td>{{ .VulnerabilityID }}</td>
      <td>{{ .Severity }}</td>
  </tr>
  {{ end }}
{{ end }}

</table>

</body>
</html>
