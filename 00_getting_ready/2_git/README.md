# Surfalytics
DA/DE projects

## Summary

Git commands include cloning, checking status, creating branches, and committing changes. Additional commands include fetching, pulling, branching, pushing, and recording changes.

## Git Commands

1. Clone the code from repo

```bash
git clone https://github.com/paulsemenyuk/surfalytics.git
```

2. Check the status of Git repo

```bash
git status
```

3. Create new branch

```bash
git checkout -b pash/local-branch
```

4. Move between branches or main

```bash
git checkout pash/local-branch
```
  or

```bash
git checkout main
```

5. Download objects and refs from another repository

```bash
git fetch
```

6. Fetch from and integrate with another repository or a local branch

```bash
git pull
```

7. List, create, or delete branches

```bash
git branch -a
```

8. Update remote refs along with associated objects

```bash
git push
```

9. Add file contents to the index

```bash
git add .
```

10. Record changes to the repository

```bash
git commit -m "Text"
```

11. See other commands

```bash
git --help
```

### In a nutshell
1. Clone Prod code `git clone`.
2. Create dev branch `git checkout -b branch-name`.
3. Make the changes to the code.
4. Check what we have modified `git status`.
5. Index modified files `git add.`.
6. Commit these files `git commit -m "Message"`.
7. Push to remote `git push`.
8. Create Pull Request for Code review `git pull`.
