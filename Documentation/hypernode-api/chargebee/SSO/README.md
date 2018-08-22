# Chargebee SSO URL endpoint

The following endpoints are available:
```
GET: https://api.hypernode.com/v1/chargebee/sso/<your_email>/
```
This endpoint allows you to retrieve the SSO login URL for Chargebee, which you can then use
to login to Chargebee and manage your subscriptions. You can request the URL like so:
```bash
curl https://api.hypernode.com/v1/chargebee/sso/<your_email>/ -X GET --header "Authorization: Token <your_hypernode_api_token>"
```
The return value should look like this if there is a Chargebee account associated with your email:
```json
{
  "chargebee_sso_url": "https://hypernode.chargebee.com/portal/v2/authenticate?token=my_token"
}
```
If there is no Chargebee account associated with your account a 404 with the following will be returned:
```json
{
  "detail": "Not found."
}
```

