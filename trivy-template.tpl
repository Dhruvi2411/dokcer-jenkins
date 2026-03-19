<!DOCTYPE html>
<html>
<head>
    <title>Trivy Security Report</title>
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
        .CRITICAL { background-color: #dc2626; color: white; }
        .HIGH { background-color: #f97316; color: white; }
        .MEDIUM { background-color: #eab308; color: black; }
        .LOW { background-color: #22c55e; color: black; }
        .UNKNOWN { background-color: #64748b; color: white; }
    </style>
</head>
<body>

<h1>🚨 Trivy Security Scan Report</h1>

<table>
<tr>
    <th>Package</th>
    <th>Vulnerability</th>
    <th>Severity</th>
    <th>Description</th>
</tr>

{{ range .Results }}
  {{ range .Vulnerabilities }}
  <tr class="{{ .Severity }}">
      <td>{{ .PkgName }}</td>
      <td>{{ .VulnerabilityID }}</td>
      <td>{{ .Severity }}</td>
      <td>{{ .Title }}</td>
  </tr>
  {{ end }}
{{ end }}

</table>

</body>
</html>
