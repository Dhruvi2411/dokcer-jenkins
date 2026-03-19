<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Trivy Security Report</title>

    <style>
        body {
            font-family: 'Segoe UI', Arial;
            background-color: #0f172a;
            color: #e2e8f0;
            margin: 0;
            padding: 0;
        }

        h1 {
            text-align: center;
            padding: 20px;
            color: #38bdf8;
        }

        .summary {
            display: flex;
            justify-content: center;
            gap: 20px;
            margin-bottom: 20px;
        }

        .card {
            padding: 15px 25px;
            border-radius: 10px;
            font-weight: bold;
            color: white;
        }

        .CRITICAL { background-color: #dc2626; }
        .HIGH { background-color: #f97316; }
        .MEDIUM { background-color: #eab308; color: black; }
        .LOW { background-color: #22c55e; color: black; }
        .UNKNOWN { background-color: #64748b; }

        table {
            border-collapse: collapse;
            width: 95%;
            margin: auto;
            background-color: #1e293b;
            border-radius: 10px;
            overflow: hidden;
        }

        th, td {
            padding: 12px;
            text-align: left;
        }

        th {
            background-color: #334155;
        }

        tr {
            border-bottom: 1px solid #475569;
        }

        tr:hover {
            background-color: #334155;
        }

        .badge {
            padding: 5px 10px;
            border-radius: 6px;
            font-weight: bold;
        }
    </style>
</head>

<body>

<h1>🚨 Trivy Security Scan Report</h1>

<!-- Summary Section -->
<div class="summary">
    <div class="card CRITICAL">Critical: {{ .Critical }}</div>
    <div class="card HIGH">High: {{ .High }}</div>
    <div class="card MEDIUM">Medium: {{ .Medium }}</div>
    <div class="card LOW">Low: {{ .Low }}</div>
</div>

<table>
    <tr>
        <th>Target</th>
        <th>Package</th>
        <th>Vulnerability</th>
        <th>Severity</th>
        <th>Description</th>
    </tr>

{{ range . }}
    {{ $target := .Target }}
    {{ range .Vulnerabilities }}
    <tr>
        <td>{{ $target }}</td>
        <td>{{ .PkgName }}</td>
        <td>{{ .VulnerabilityID }}</td>
        <td>
            <span class="badge {{ .Severity }}">
                {{ .Severity }}
            </span>
        </td>
        <td>{{ .Title }}</td>
    </tr>
    {{ end }}
{{ end }}

</table>

</body>
</html>
