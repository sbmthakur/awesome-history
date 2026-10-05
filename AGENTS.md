# AGENTS.md — Guide for Agents

This file describes how agents should interact with the `awesome-history` repository.

## Project Overview

`awesome-history` is a curated list of history-related resources (blogs, YouTube channels, etc.).

## Adding a YouTube Channel

When adding a new YouTube channel, **always use the shell script** to fetch the channel's actual display name. Do not guess or hardcode names.

### Steps

1. **Run the fetch script** with the channel URL or handle:

   ```bash
   ./scripts/fetch-youtube-name.sh https://www.youtube.com/@handle
   # or
   ./scripts/fetch-youtube-name.sh @handle
   ```

2. **Use the output** as the display name in the README.

3. **Add the entry** to the "YouTube Channels" section in `README.md` in the same format as existing entries:

   ```markdown
   - [Channel Name](https://www.youtube.com/@handle)
   ```

   If the channel is in a non-English language, append the language in parentheses:

   ```markdown
   - [Channel Name](https://www.youtube.com/@handle) (Hindi)
   ```

### Why Use the Script?

YouTube handles and display names can differ. The script fetches the actual name from YouTube's page source, ensuring accuracy.

## Adding a Blog

Add entries to the "Blogs" section in `README.md` in the same format:

```markdown
- [Blog Name](https://example.com) - Brief description
```

## Conventions

- Use the channel's actual display name (not the handle)
- Include the full YouTube URL
- Keep descriptions concise and informative
- Maintain alphabetical order within each section
