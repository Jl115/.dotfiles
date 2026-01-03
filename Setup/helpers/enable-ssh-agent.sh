#!/bin/bash

SSH_HOME="~/.ssh"

echo "🔑 Starting SSH Agent..."
eval "$(ssh-agent -s)"

echo "➕ Adding keys to agent..."
# --apple-use-keychain stores the passphrase in the macOS Keychain so you don't re-type it
ssh-add --apple-use-keychain "$SSH_HOME/bitbucket-ssh"
ssh-add --apple-use-keychain "$SSH_HOME/github"
ssh-add --apple-use-keychain "$SSH_HOME/id_rsa"

# Check if keys are added
ssh-add -l

echo "✅ SSH Agent initialized."
