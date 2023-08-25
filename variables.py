from pathlib import Path

from selenium.webdriver import IeOptions


URL = "https://robocorp.com"
# A 32bit version is recommended.
WEBDRIVER_PATH = str(Path("bin") / "IEDriverServer.exe")
BROWSER_PATH = str(
    Path("C:") / "Program Files (x86)" / "Microsoft" / "Edge" / "Application" /
    "msedge.exe"
)

IE_OPTIONS = IeOptions()
IE_OPTIONS.edge_executable_path = BROWSER_PATH
IE_OPTIONS.attach_to_edge_chrome = True
IE_OPTIONS.native_events = True

# Run in private/incognito mode for testing purposes.
IE_OPTIONS.add_argument("-private")
IE_OPTIONS.force_create_process_api = True  # needed for the arguments to work
IE_OPTIONS.ensure_clean_session = True

# Required if protected mode is not consistent. (aka ON/OFF for all levels)
IE_OPTIONS.ignore_protected_mode_settings = True
