net stop wuauserv
rd /s /q %systemroot%\SoftwareDistribution
net start wuauserv