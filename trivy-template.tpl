<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Trivy Report</title>

<style>
body {
    font-family: Arial;
    background: #0f172a;
    color: #e2e8f0;
    margin: 0;
}

h1 {
    text-align: center;
    padding: 20px;
    color: #38bdf8;
}

/* Table */
table {
    width: 95%;
    margin: auto;
    border-collapse: collapse;
    background: #1e293b;
    border-radius: 10px;
    overflow: hidden;
}

th {
    background: #334155;
    padding: 12px;
}

td {
    padding: 10px;
    border-bottom: 1px solid #475569;
}

tr:hover {
    background: #334155;
}

/* Severity badges */
.badge {
    padding: 5px 10px;
    border-radius: 6px;
    font-weight: bold;
}

.CRITICAL { background: #dc2626; color: white; }
.HIGH { background: #f97316; color: white; }
.MEDIUM { background: #eab308; color: black; }
.LOW { background: #22c55e; color: black; }
.UNKNOWN { background: #64748b; color: white; }

</style>
</head>

<body>

<h1>🚨 Trivy Security Scan Report</h1>

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
    {{ if .Vulnerabilities }}
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
{{ end }}

</table>

</body>
</html>
