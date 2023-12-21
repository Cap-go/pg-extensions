# `supabase_auth_admin`

Useful extensions for Supabase Auth, allow users to be admin, this is useful to allow exceptions in RLS, for impersonation, or other use cases.



- Source: https://github.com/Cap-go/pg-extensions/tree/main/supabase_auth_admin
- Docs: https://github.com/Cap-go/pg-extensions/tree/main/supabase_auth_admin
- DbDev: https://database.dev/Cap-go/pg-extensions

## Usage

Functions 

- `is_admin()` - check if the current user is admin. This is made to use in RLS, This is safe to use in Frontend
- `is_admin(user_id)` - check if the user is admin. This is made to use in your backend
- `set_admin(user_id)` - set the user as admin, only admin can do this or the first user


## Installation

```bash
dbdev install riderx-supabase_auth_admin --connection <CONNECTION_STRING>
```

or

```sql
select * from dbdev('riderx-supabase_auth_admin')
```

then:

```sql
create extension supabase_auth_admin;
```

or to install in a separate schema (recommended):

```sql
create extension supabase_auth_admin with schema extensions;
```

