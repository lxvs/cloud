# [Cloud Save](https://github.com/lxvs/cloud)

It can link your local game save files to your cloud storage services, such as OneDrive, Dropbox, Google Drive...



## Usage

1. Click **Code** > [**Download Zip**](https://github.com/lxvs/cloud/archive/refs/heads/main.zip) in GitHub
2. Unzip the downloaded `cloud-main.zip`

3. Put `cloud-deploy.bat` to your cloud storage along with **your save files** (*find details in the below chapter*). If you already has local save files, **move** them to your cloud storage

4. **Edit** `cloud-deploy.bat`

   1. Change line 3 `%programfiles(x86)%\Steam` to your Steam installation folder

   2. Change line 4 `324014709` to your Steam ID, which can be found in `Steam\userdata` folder

5. Run `cloud-deploy.bat` **as administrator**

6. If you want to unlink your save files with your PC

   1. **Edit** `cloud-remove.bat`
   2. Change line 4 `%programfiles(x86)%\Steam` to your Steam installation folder
   3. Change line 5 `324014709` to your Steam ID, which can be found in `Steam\userdata` folder
   4. run `cloud-remove.bat` anywhere. It only removes links to the save files to your cloud storage, and won't delete your unlinked local save files



## Your Save Files

#### Local

Please edit the `bat` file and find the **folder name of save files** and the **location of them** of each game.

You can follow the given format to add your games.

#### Steam Cloud

Please edit the `bat` file and find the **game ID** and the **location of save files** of each game.

You can follow the given format to add your games.



## Your Cloud Storage Should Be Like This

![onedrive-cloud-save](https://github.com/lxvs/pic/raw/main/cloud/onedrive-cloud-save.png)