# Introduction
I don't exactly know what to put here, but I'll do my best I suppose!

## Summary Commands

```
git clone --bare $REPO $HOME/.dotfiles

# Save Convenience Functions first!
dtf config --local status.showUntrackedFiles no

# If non-default branch in repo, or naming the initial branch before first push:
git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME switch -c base

# If first-time push to empty repo, add and commit some files, then push
# Just adding ".profile" in the following example
git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME add .profile
git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME commit -m "initial commit"
git --git-dir=$HOME/.dotfiles/ push -u origin base

# If instead pulling an already populated repo, simply:
dtf checkout
# Deal with conflicting files, or run again with -f flag if you are OK with overwriting
```

## Convenience Functions;
Make sure to add this to Bash/Zsh/Ash!

```
dtf () {
  git --git-dir="$HOME/.dotfiles" --work-tree="$HOME" "$@"
}
```

And this for Powershell. Specifically for; Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1

```
function dtf {
  git --git-dir="$HOME\.dotfiles" --work-tree="$HOME" @Args
}
```
