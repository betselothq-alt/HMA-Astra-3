HMA ASTRA CLUB - SUPABASE VERSION

Files
-----
index.html       Main HMA Astra Club website
setup.sql        Supabase schema fixes + automatic profile trigger

Supabase project
----------------
URL: https://yzhrhexbrfshlmakpamt.supabase.co
The website already contains the Supabase publishable key.

IMPORTANT
---------
Never put a Supabase service_role/secret key in index.html.
The sb_publishable_ key is intended for the browser.

SETUP ORDER
-----------
1. In Supabase SQL Editor, run the original HMA Astra database schema/policies.
2. Run setup.sql from this folder.
3. Make sure Authentication > Providers > Email is enabled.
4. If Confirm email is enabled, register an account and click the confirmation email.
5. In Supabase Table Editor > profiles, change your first account role from Member to Admin.
   Or use the commented SQL command at the bottom of setup.sql.
6. Upload index.html to the root of your GitHub Pages repository.
7. GitHub Pages should deploy from the main branch and the repository root (/).

GITHUB PAGES
------------
Repository: HMA Astra 2
Expected URL:
https://betselothq-alt.github.io/hma-astra-2/

NOTES
-----
The current website creates reminder records in Supabase. Actual automatic reminder
email delivery requires a server-side scheduled job/Edge Function; the browser alone
should not contain secret credentials.
