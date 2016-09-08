# API
## Signup
#### POST `https://ror-api-oauth.herokuapp.com/api/v1/users` +
```javascript
{
  user: {
    email: foo@bar.com,
    password: "password"
  }
}
```

## Login
#### POST `https://ror-api-oauth.herokuapp.com/oauth/token` +
```javascript
{
   grant_type: "password",
   email: "foo@bar.com",
   password: "password"
}
```

## Sync local user data
#### GET `https://ror-api-oauth.herokuapp.com/api/v1/users/sync`
`Authorization: Bearer <oauth access token>`
