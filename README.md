
Task

1. Create vagrant file having 4 linux machines. (ubuntu/centos)

2. Machines should be provisioned automatically, with ansible/chef/shell and at the end of "vagrant up" command should work as following:

  2 apache servers reporting “I’m server 1”/"I’am server 2” on default page.

  1 HA proxy balancing 2 apache servers. 

  Last machine should run Jenkins server with 1 job, which passing if "server 1”is active , failing if “server 2” is active.    Job should run every hour in nights only, from 00:00 to 06:00
