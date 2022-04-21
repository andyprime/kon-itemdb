kon-itemdb
==========

KoN Item Database

The current iteration of this project uses Vue.js and PureCSS.  I am still debating whether to leave the php backend as is, or relatively so, or replace it with a nice modern python.



### To-Do
- Better way to view full item details
- Button to find first unused item #
- Search 
- Item deletes
- PDF export, probably a better way to do this now in modern tymes
- Support dev/prod variation in instance file
- Unit tests (lol)
- Form disable on submit press
- Scroll to new item on create


### Setup

This is intended to be run on Ubuntu, initially 20.04. I use a VM, you do you.

1. Checkout the repo, duh
2. Install nginx, example site-available config is at `kon-itemdb/config/konitemdb`
3. Install php and the nginx sub package, I forget the details, I'm sure you can google it
4. Install mysql, it don't need to be local but whatever
  - You can get a baseline of DB structure and some test data in `kon-itemdb/sql/backup.sql`
  - Create a user with access to those tables and put the info in `kon-itemdb/rest/inc/instance.inc`
5. Uh, you're done? Should come up on localhost port 80 if you did it right.
6. If you plan to make contributions, make a branch and open a pull request on it when you're ready for review