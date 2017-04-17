# git_basic_hook

Test git hook and add depency analysis

# Tutorial
  
Install user local hooks
$> init.sh  
  
Try dependency hook 
 by modifying a file in the repository
 then try to commit to see the pre commit 
  script kick in.
  
$> nano logical/shared/shared.txt  
$> git commit  
  
The command report a dependency changes 
  that break the commit.

----
This is a simple example to illustrate git hooks usage.
