<h1 align=center>The Sims 1 Starter Pack - by osab </h1> 

### Download & setup resources for The Sims Complete Collection.


[![Discord](https://img.shields.io/discord/912700195249197086?color=fa807a&label=osab%27s%20TS2%20Community%20Discord%20Server&logo=Discord&logoColor=white)](https://discord.com/servers/ts2-community-912700195249197086)  ![GitHub all releases](https://img.shields.io/github/downloads/voicemxil/TS-Starter-Pack/total)

The Starter Pack is an all-in-one source for obtaining, installing, and optimizing TS1 on modern hardware. 

![image](https://user-images.githubusercontent.com/69059862/226063960-485188cd-7dab-4da1-a924-9a5bdd92285e.png)
<sub>(1080p Widescreen Patch pictured)</sub>

### Follow the [Full Installation Guide](https://docs.google.com/document/d/1gKoQyXQKPA9hTtywt8OWEZzb4-9615uaSlibAPGb5Oc/edit) to begin!

## [Web Installer - Latest](https://github.com/voicemxil/TS-Starter-Pack/releases/latest) ![GitHub file size in bytes](https://img.shields.io/github/size/voicemxil/TS-Starter-Pack/bin/Web%20Installer/TS1StarterPack.WebInstaller-v11.exe?branch=v11)
- Lightweight NSIS-based web installer (requires stable Internet connection, there is no standalone version at this time)
- Downloads The Sims Starter Pack - osab's 1.65GB "The Sims Complete Collection" repack automatically 
- Installs/uninstalls game registry keys without needing original installers/uninstallers
- Downloads and guides the user to apply [The Sims 1 Widescreen Patcher](https://github.com/FaithBeam/Sims-1-Complete-Collection-Widescreen-Patcher) by [FaithBeam](https://github.com/FaithBeam)
- Optional:
    - Create desktop/start menu shortcuts

# Resources & Support:
- For help with your TS1 Starter Pack, please [join TS2 Community](https://discord.gg/ts2-community-912700195249197086) and consult the #ts1-help channel! 
- We have FAQs/channels for the whole series and our support volunteers are active daily.
- Our members share gameplay, CC/Mods, and plenty of other useful resources.
## Join TS2 Community here to access our TS1 channels!
[<img src="https://discordapp.com/api/guilds/912700195249197086/widget.png?style=banner3" alt="">](https://discord.gg/ts2-community-912700195249197086)

# Building:
1. Install [negrutiu's NSIS fork](https://github.com/negrutiu/nsis).
1. If building a version prior to v12, copy the `.\plugins` directory to your `x86-unicode` plugins folder.
1. Run NSIS on `.\src\TS_Web_Installer.nsi`, installer will build to `.\bin\Web Installer`.
