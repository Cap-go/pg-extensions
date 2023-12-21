# `supabase_auth_apikey`

Useful extensions for Supabase Auth, Allow API Key authentication for users, with roles and permissions.

The goal is to allow users to authenticate with an API Key, when email/password is not an option. This is useful for IoT devices, CLI tools, and other non-interactive applications.

- Source: https://github.com/Cap-go/pg-extensions/tree/main/supabase_auth_apikey
- Docs: https://github.com/Cap-go/pg-extensions/tree/main/supabase_auth_apikey
- DbDev: https://database.dev/Cap-go/pg-extensions

## Usage

Functions 

- `is_allowed_apikey(((current_setting('request.headers'::text, true))::json ->> 'apikey'::text), '{read,write}')` - check in RLS if the header `apikey` exist and has the correct permissions
- `create_apikey(user_id, permissions)` - create an API Key for the user with the given permissions. This is made to use in your backend
- `create_apikey(permissions)` - create an API Key for the current user with the given permissions. This is safe to use in Frontend
- `delete_apikey(user_id, apikey)` - delete the API Key for the user. This is made to use in your backend
- `delete_apikey(apikey)` - delete the API Key for the current user. This is safe to use in Frontend
- `get_user_id(apikey)` - get the user_id for the given API Key


## Installation

```bash
dbdev install riderx-supabase_auth_apikey --connection <CONNECTION_STRING>
```

or

```sql
select * from dbdev('riderx-supabase_auth_apikey')
```

then:

```sql
create extension supabase_auth_apikey;
```

or to install in a separate schema (recommended):

```sql
create extension supabase_auth_apikey with schema extensions;
```

