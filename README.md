# skill-repo

A public repository for reusable skills.

## Structure

Skills live under `skills/<skill-name>/` so the repository can grow beyond a single skill without cluttering the root.

```text
skills/
  <skill-name>/
    SKILL.md
    scripts/
    references/
    assets/
```

Create only the folders a skill actually needs.

## Current Skills

- `wechat-computer-use-send-message`
  Reliable WeChat message sending on macOS through computer-use, with a clipboard-first workflow for Chinese text.

## Adding a Skill

1. Create a new directory under `skills/`.
2. Add a `SKILL.md` with clear trigger-oriented frontmatter.
3. Add only the supporting folders and files that the skill needs.
4. Keep repository-level documentation in the root and skill-specific logic inside the skill directory.
