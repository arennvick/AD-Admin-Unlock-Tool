<%@ Page Language="C#" %>

<!DOCTYPE html>
<html>
<head>
    <title>Admin Account Unlock</title>

    <style>
        body {
            font-family: "Segoe UI", Arial, sans-serif;
            margin: 0;
            height: 100vh;
            background: linear-gradient(135deg, #2563eb, #1e3a8a);
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .card {
            background: #ffffff;
            width: 420px;
            padding: 30px;
            border-radius: 14px;
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.25);
            text-align: center;
        }

        .card h2 {
            margin-top: 0;
            margin-bottom: 20px;
            color: #111827;
        }

        .btn {
            width: 100%;
            padding: 14px;
            font-size: 16px;
            border-radius: 8px;
            border: none;
            background: #2563eb;
            color: white;
            cursor: pointer;
        }

        .btn:hover {
            background: #1d4ed8;
        }

        .result {
            margin-top: 20px;
            font-size: 14px;
            color: #065f46;
        }

        .footer {
            margin-top: 30px;
            font-size: 12px;
            color: #6b7280;
            border-top: 1px solid #e5e7eb;
            padding-top: 10px;
            text-align: left;
        }

        .disclaimer {
            margin-top: 8px;
            color: #9f1c1c;
            font-size: 11px;
        }
    </style>
</head>

<body>

<div class="card">
    <h2>Unlock Admin Account</h2>

    <form runat="server">
        <asp:Button
            ID="UnlockBtn"
            runat="server"
            CssClass="btn"
            Text="Unlock My Admin Account"
            OnClick="Unlock_Click" />

        <asp:Label
            ID="ResultLabel"
            runat="server"
            CssClass="result" />
    </form>

    <div class="footer">
        <div>
            Version <strong>1.0.1</strong> · Build <strong>28-Apr-2026</strong>
        </div>

<div class="credit">
        Solution designed by core365.cloud <a href="https://core365.cloud" target="_blank">core365.cloud</a>
    </div>

        <div class="disclaimer">
            Internal use only. Access is authenticated and actions are logged in accordance with
            organizational security policies.
        </div>
    </div>
</div>

<script runat="server">
    protected void Unlock_Click(object sender, EventArgs e)
    {
        string standardUser = User.Identity.Name.Split('\\')[1];

        var psi = new System.Diagnostics.ProcessStartInfo();
        psi.FileName = @"C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe";
        psi.Arguments = "-ExecutionPolicy Bypass -File \"C:\\AdminUnlockWeb\\unlock-admin.ps1\" " + standardUser;
        psi.UseShellExecute = false;
        psi.CreateNoWindow = true;

        System.Diagnostics.Process.Start(psi);

        ResultLabel.Text = "If your admin account was locked, it has been unlocked.";
    }
</script>

</body>
</html>
