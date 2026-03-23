# ZZZ HoyoLab Auto Check-in

Automated HoyoLab daily check-in script for Zenless Zone Zero.

**Language:** English | [한국어](README.ko.md)

---

## Requirements

- Python 3.8+
- Windows

## Usage

**`run.bat` handles everything in one step.**

1. Run `run.bat`
2. First run only:
   - Select language (Korean / English / Japanese)
   - Missing dependencies are installed automatically (Playwright, Chromium)
   - Browser opens — log in to HoyoLab manually
3. Subsequent runs: check-in is performed silently in the background

### Task Scheduler

On first run, you will be asked whether to register a daily scheduled task.
To register or unregister the scheduled task, run `schedule.bat`.

> HoyoLab resets at UTC+8 midnight (01:00 KST). Running at 01:05 KST is recommended.

## File Structure

```
├── run.bat               # Single entry point
├── schedule.bat          # Task scheduler management
└── scripts/
    ├── zzz_checkin.py    # Main script
    ├── _setup.py         # Dependency installer
    ├── _schedule.py      # Task scheduler registration / removal
    └── locales/          # Locale strings (ko / en / ja)
```

## How It Works

### Browser Automation
Uses [Playwright](https://playwright.dev/python/) to drive a Chromium browser in headless mode.
A persistent browser profile (`data/browser_profile/`) stores the HoyoLab session so login is only required once.

### Login Detection
After the browser opens, the script polls for the `ltoken_v2` cookie at regular intervals.
Once detected, the session is saved and the browser closes automatically.

### Check-in Logic
1. Navigates to the ZZZ HoyoLab check-in page
2. Reads today's date in UTC+8 (HoyoLab server time)
3. Scrolls to today's reward card if needed
4. Exits silently if today's check-in is already completed
5. Clicks the card and waits for confirmation of success

### Session Expiry
If the session has expired, the script automatically opens the browser again for re-login, then retries the check-in.
## Changing Language

Delete `data/.lang` and the language selection prompt will appear on the next run.
