🔐 Ye values kahan se milti hain?
✅ 1. AZURE_SUBSCRIPTION_ID

📍 Azure Portal se directly milta hai:

Steps:

Azure Portal open karo
https://portal.azure.com
Search: Subscriptions
Apni subscription select karo
Wahan milega:

👉 Subscription ID (GUID type)
Example: xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx

✅ 2. AZURE_TENANT_ID

📍 Azure Active Directory (Entra ID) se milta hai:

Steps:

Azure Portal → Search: Microsoft Entra ID
Open karo
Overview page pe milega:

👉 Tenant ID

✅ 3. AZURE_CLIENT_ID (MOST IMPORTANT)

📍 Ye aata hai Service Principal banane se

👉 Service Principal kya hota hai?

CI/CD ke liye ek “login identity” jo Terraform ko Azure access deta hai.

🛠️ Service Principal kaise banate hain
Option 1: Azure CLI (BEST & easiest)
az login

Then run:

az ad sp create-for-rbac \
  --name "github-actions-terraform" \
  --role Contributor \
  --scopes /subscriptions/<SUBSCRIPTION_ID> \
  --sdk-auth
🔥 Output aisa milega:
{
  "clientId": "xxxxxx-xxxx-xxxx",
  "clientSecret": "xxxxxx",
  "subscriptionId": "xxxxxx",
  "tenantId": "xxxxxx"
}
📌 Mapping (IMPORTANT)
GitHub Secret	Value from
AZURE_CLIENT_ID	clientId
AZURE_TENANT_ID	tenantId
AZURE_SUBSCRIPTION_ID	subscriptionId
🔐 4. GitHub Secrets me kaise add kare?
GitHub repo → Settings
Secrets and variables → Actions
New repository secret

Add:

AZURE_CLIENT_ID
AZURE_TENANT_ID
AZURE_SUBSCRIPTION_ID
AZURE_CLIENT_SECRET (optional but often needed)
