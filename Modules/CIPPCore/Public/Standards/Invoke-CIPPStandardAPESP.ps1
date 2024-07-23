function Invoke-CIPPStandardAPESP {
    <#
    .FUNCTIONALITY
    Internal
    #>
    param($Tenant, $Settings)
    If ($Settings.remediate -eq $true) {
        try {
            $Parameters = @{
                TenantFilter     = $Tenant
                ShowProgress     = $Settings.ShowProgress
                BlockDevice      = $Settings.blockDevice
                AllowReset       = $Settings.AllowReset
                EnableLog        = $Settings.EnableLog
                ErrorMessage     = $Settings.ErrorMessage
                TimeOutInMinutes = $Settings.TimeOutInMinutes
                AllowFail        = $Settings.AllowFail
                OBEEOnly         = $Settings.OBEEOnly
            }

            Set-CIPPDefaultAPEnrollment @Parameters
        } catch {
            $ErrorMessage = Get-NormalizedError -Message $_.Exception.Message
            throw $ErrorMessage
        }
    }


}
