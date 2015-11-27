iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))

@(
    "sysinternals",
    "notepadplusplus.install",
    "git.install",
    "vagrant",
    "virtualbox",
    "packer",
    "make",
    "sublimetext3.app",
    "cntlm",
    "adobereader",
    "windbg",
    "golang",
    "fiddler4"
) | % {
    choco install --yes $_
}
