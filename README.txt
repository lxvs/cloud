
                                  Cloud Save
                        https://github.com/lxvs/cloud

It can link your local game save files to your cloud storage services, such as OneDrive, Dropbox, Google Drive...

Usage
=====

1. Download latest source codes.

2. Unzip all files (file cloud-deoloy.bat, cloud-remove.bat, gamelist,
   gamelist-steamcloud are required) to your cloud storage folder that
   contains your save files. If you already has local save files, move them
   to your cloud storage.

3. Edit file cloud-deploy.bat with text editor:

   a. In line 5, replace '%programfiles(x86)%\Steam' with your Steam
      installation folder.

   b. In line 6, replace '324014709' with your Steam ID, which can be found
      in 'Steam\userdata' folder.

4. Run 'cloud-deploy.bat' as administrator.

5. If you want to unlink your save files with your PC, do steps 3~4 for file
   'cloud-remove.bat' and run it.  It only removes the link to your cloud
   storage, and won't delete your unlinked local save files.


Add Your Games
==============

Local
-----

Edit file 'gamelist' and find these of a game:

    1. folder name of save files in your cloud storage
    2. location of local game saves (not in your cloud storage)

You can follow the given format to add your games.

Steam Cloud
-----------

Edit file 'gamelist-steamcloud' and find these of a game:

    1. steam game ID
    1. folder name of save files in your cloud storage

You can follow the given format to add your games.


FAQ
===

why does cloud-remove.bat prompt me that '** xxx game is not removed'?
----------------------------------------------------------------------

It might happen in below situations:
   1. There are saves of that game and isn't created by cloud-deploy.
   2. The script does not have the privilege needed. Try to run it again as
      administrator.

