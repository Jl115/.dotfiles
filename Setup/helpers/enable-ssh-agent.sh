#!/bin/bash

SSH_HOME="$HOME/.ssh"

echo "🔒 Fixing SSH permissions..."

chmod 600 "$SSH_HOME/bitbucket-ssh"
chmod 600 "$SSH_HOME/github"
chmod 600 "$SSH_HOME/id_rsa"

chmod 644 "$SSH_HOME/"*.pub
chmod 644 "$SSH_HOME/config"
chmod 644 "$SSH_HOME/known_hosts" 2>/dev/null

echo "🔑 Starting SSH Agent..."
eval "$(ssh-agent -s)"

echo "➕ Adding keys to agent..."
ssh-add --apple-use-keychain "$SSH_HOME/bitbucket-ssh"
ssh-add --apple-use-keychain "$SSH_HOME/github"
ssh-add --apple-use-keychain "$SSH_HOME/id_rsa"

# Check if keys are added
ssh-add -l

echo "✅ SSH Agent initialized."
