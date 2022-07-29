resource "azurerm_security_center_assessment_policy" "latest" {
    display_name            = "Security Assessment Policy as Code"
    severity                = "Medium"
    description             = "Policy defined at severity of Medium to have this assessment policy advise on risks in env"
    categories              = "Compute"
    implementation_effort   = "Moderate"
    user_impact             = "Low"
}
