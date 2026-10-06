# YXT-Formalization-Framework

Yuanxian Theory formalization (Lean 4 + Mathlib)  
**Author**: Zhenyuan Acharya · Institute of Yuanxian Cosmology  
**License**: MIT · **Language**: English

https://github.com/YuanXian-Theory/YXT-Formalization-Framework

```
|[██████████████░░░░░░]|  ~70%
Steps 1–25 engineering queue
```

## CI (phone-friendly)

Every push to `main` runs **`lake build`** on GitHub Actions.

- Actions page: https://github.com/YuanXian-Theory/YXT-Formalization-Framework/actions
- Install the **official GitHub app**, open the repo → Actions, or use the link above in the mobile browser.
- On failure: open the red run → `lake build` step → copy from the first `error:` and send it for fixes.
- Manual re-run: Actions → **Lean CI** → **Run workflow**.

## Docs

[PROGRESS](docs/PROGRESS.md) · [ROADMAP](docs/ROADMAP.md) · [AXIOM_INVENTORY](docs/AXIOM_INVENTORY.md)

```bash
git pull && lake build   # optional, if you have a desktop
```
