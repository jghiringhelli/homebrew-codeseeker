# Homebrew Tap Setup Instructions

Follow these steps to publish this tap to GitHub and enable automated updates.

## Step 1: Create GitHub Repository

1. Go to https://github.com/new
2. Repository name: **`homebrew-codeseeker`** (MUST be exactly this)
3. Description: `Homebrew tap for CodeSeeker - Graph-powered code intelligence`
4. Public repository
5. Do NOT initialize with README, .gitignore, or license (we already have them)
6. Click "Create repository"

## Step 2: Calculate SHA256 Hash

**IMPORTANT:** You must do this AFTER publishing CodeSeeker 1.7.1 to npm.

```bash
# Calculate SHA256 of the npm tarball
curl -sL https://registry.npmjs.org/codeseeker/-/codeseeker-1.7.1.tgz | shasum -a 256
```

Copy the hash (40-character hex string).

## Step 3: Update Formula with SHA256

Edit `Formula/codeseeker.rb` and replace:

```ruby
sha256 "" # TODO: Calculate after npm publish - see README.md
```

With:

```ruby
sha256 "PASTE_HASH_HERE"
```

## Step 4: Initialize Git and Push

```bash
cd homebrew-codeseeker

# Initialize git
git init
git add .
git commit -m "Initial commit: CodeSeeker Homebrew formula v1.7.1"

# Add GitHub remote (replace with your actual repo URL)
git remote add origin https://github.com/jghiringhelli/homebrew-codeseeker.git

# Push to GitHub
git branch -M main
git push -u origin main
```

## Step 5: Create GitHub Personal Access Token

This allows GitHub Actions to update the formula automatically.

1. Go to https://github.com/settings/tokens
2. Click "Generate new token" → "Generate new token (classic)"
3. Note: `CodeSeeker Homebrew Tap Access`
4. Expiration: No expiration (or set your preference)
5. Scopes: Check **`repo`** (Full control of private repositories)
6. Click "Generate token"
7. **Copy the token** (you won't see it again!)

## Step 6: Add Token to CodeSeeker Repository Secrets

1. Go to https://github.com/jghiringhelli/codeseeker/settings/secrets/actions
2. Click "New repository secret"
3. Name: `HOMEBREW_TAP_TOKEN`
4. Value: Paste the token from Step 5
5. Click "Add secret"

## Step 7: Verify GitHub Actions Workflow

The workflow is already configured in `codeseeker/.github/workflows/publish-packages.yml`.

Verify it includes:

```yaml
update-homebrew:
  needs: publish-npm
  runs-on: ubuntu-latest
  steps:
    - uses: actions/checkout@v4
    - name: Calculate SHA256
      # ... calculates hash automatically
    - name: Update Homebrew Formula
      uses: mislav/bump-homebrew-formula-action@v3
      with:
        formula-name: codeseeker
        homebrew-tap: jghiringhelli/homebrew-codeseeker
      env:
        COMMITTER_TOKEN: ${{ secrets.HOMEBREW_TAP_TOKEN }}
```

## Step 8: Test Installation

```bash
# Tap the repository
brew tap jghiringhelli/codeseeker

# Install CodeSeeker
brew install codeseeker

# Verify
codeseeker --version

# Test configuration
codeseeker install --vscode

# Uninstall test
brew uninstall codeseeker
brew untap jghiringhelli/codeseeker
```

## ✅ Setup Complete!

### What Happens on Future Releases

When you create a GitHub release for CodeSeeker:

1. GitHub Actions publishes to npm
2. Waits 30 seconds for npm propagation
3. Automatically calculates SHA256
4. Updates this formula with new version and SHA256
5. Commits to `homebrew-codeseeker` repository

**Users get updates via:**
```bash
brew upgrade codeseeker
```

### Manual Updates (If Needed)

If you need to manually update the formula:

```bash
# Calculate SHA256 for new version
curl -sL https://registry.npmjs.org/codeseeker/-/codeseeker-X.Y.Z.tgz | shasum -a 256

# Update Formula/codeseeker.rb
# - Change version in url
# - Update sha256

git add Formula/codeseeker.rb
git commit -m "Update codeseeker to vX.Y.Z"
git push origin main
```

## Troubleshooting

### "Error: Invalid formula"

Run Homebrew's audit:
```bash
brew audit Formula/codeseeker.rb
```

Fix any errors reported.

### "SHA256 mismatch"

Recalculate the SHA256:
```bash
curl -sL https://registry.npmjs.org/codeseeker/-/codeseeker-1.7.1.tgz | shasum -a 256
```

Update `Formula/codeseeker.rb`.

### GitHub Actions fails to update formula

Check:
1. `HOMEBREW_TAP_TOKEN` secret exists in CodeSeeker repo
2. Token has `repo` scope
3. Token hasn't expired
4. Repository name is exactly `homebrew-codeseeker`

## Support

- Homebrew tap issues: https://github.com/jghiringhelli/homebrew-codeseeker/issues
- CodeSeeker issues: https://github.com/jghiringhelli/codeseeker/issues
- Homebrew documentation: https://docs.brew.sh/
