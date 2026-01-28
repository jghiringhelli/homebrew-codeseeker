# Homebrew Tap for CodeSeeker

Official Homebrew tap for [CodeSeeker](https://github.com/jghiringhelli/codeseeker) - Graph-powered code intelligence for Claude Code and AI assistants.

## Installation

```bash
brew tap jghiringhelli/codeseeker
brew install codeseeker
```

Or in one command:

```bash
brew install jghiringhelli/codeseeker/codeseeker
```

## After Installation

Configure CodeSeeker for your IDE:

```bash
codeseeker install --vscode      # VS Code (Claude Code & GitHub Copilot)
codeseeker install --cursor      # Cursor IDE
codeseeker install --windsurf    # Windsurf IDE
```

Then restart your IDE.

## Verify Installation

Ask your AI assistant: *"What CodeSeeker tools do you have?"*

You should see tools like: `search`, `search_and_read`, `show_dependencies`, `read_with_context`, `standards`, etc.

## What is CodeSeeker?

CodeSeeker builds a **knowledge graph** of your codebase—not just embeddings—so Claude understands how your code actually connects.

**Features:**
- Hybrid search: Vector + text + path with RRF fusion
- Knowledge graph: Maps imports, calls, extends, implements
- Auto-detected coding standards
- Graph RAG for better AI code understanding
- Works with Claude Code, GitHub Copilot, Cursor, Claude Desktop

## Documentation

- [Main Repository](https://github.com/jghiringhelli/codeseeker)
- [Installation Guide](https://github.com/jghiringhelli/codeseeker#installation)
- [Package Manager Setup](https://github.com/jghiringhelli/codeseeker/blob/master/docs/install/PACKAGE_MANAGERS.md)

## Issues

For CodeSeeker issues: https://github.com/jghiringhelli/codeseeker/issues

For tap/formula issues: https://github.com/jghiringhelli/homebrew-codeseeker/issues

## License

MIT
