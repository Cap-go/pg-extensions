/*
 * MIT License
 *
 * Copyright (c) 2023 Martin Donadieu: https://github.com/Capgo-go/pg-extensions/
 * 
 *  Permission is hereby granted, free of charge, to any person obtaining a copy
 *  of this software and associated documentation files (the "Software"), to deal
 *  in the Software without restriction, including without limitation the rights
 *  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 *  copies of the Software, and to permit persons to whom the Software is
 *  furnished to do so, subject to the following conditions:
 * 
 *  The above copyright notice and this permission notice shall be included in
 *  all copies or substantial portions of the Software.
 * 
 *  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 *  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 *  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 *  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 *  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 *  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 *  THE SOFTWARE.
 */

CREATE OR REPLACE FUNCTION "public"."is_admin"("userid" "uuid") RETURNS boolean
    LANGUAGE "plpgsql" SECURITY DEFINER
    AS $$
Declare
    admin_user text;
Begin
    select decrypted_secret into admin_user from vault.decrypted_secrets where name = 'admin_user';
    return admin_user is null or userid::text = admin_user;
End;

CREATE OR REPLACE FUNCTION public.is_admin()
RETURNS boolean
LANGUAGE plpgsql
AS $$
BEGIN
    RETURN is_admin(auth.uid());
END;  
$$;

-- function set admin who do this select vault.create_secret('c591b04e-cf29-4945-b9a0-776d0672061a', 'admin_user', 'admin user id');

CREATE OR REPLACE FUNCTION "public"."set_admin"("userid" "uuid") RETURNS boolean
    LANGUAGE "plpgsql"
    AS $$
Begin
    if is_admin(auth.uid()) then
        update vault.decrypted_secrets set decrypted_secret = $1 where name = 'admin_user';
        return true;
    else
        return false;
    end if;
    End;
