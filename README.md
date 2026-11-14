# Linux University Subject

> Hands-on Linux system administration coursework: Bash scripting, text processing, Slackware package building, Linux kernel compilation, and a final Slax live-system configuration assignment.

![Linux](https://img.shields.io/badge/OS-Linux-blue?logo=linux)
![Bash](https://img.shields.io/badge/Language-Bash-4EAA25?logo=gnu-bash&logoColor=white)
![Slax](https://img.shields.io/badge/Live%20System-Slax-green)
![University Coursework](https://img.shields.io/badge/Type-University%20Coursework-orange)

---



## 📖 Table of Contents

- [About](#-about)
- 🛠️ [Skills & Technologies](#️-skills--technologies)
- [Featured Work](#-featured-work)
- [Getting Started](#-getting-started)
- [How to Run the Scripts](#-how-to-run-the-scripts)
- [Learning Outcomes](#-learning-outcomes)
- [License](#-license)
- [Contact](#-contact)

---



## ℹ️ About

This repository contains the practical assignments completed for a university-level **Linux operating systems** subject. It documents end-to-end experience with Linux administration, from writing shell scripts and processing text data to compiling the Linux kernel, building Slackware packages, and producing a bootable Slax live-system module.

The work reflects a systematic, lab-driven approach to learning: each directory groups related exercises (labs and homework) alongside reports and build artifacts, mirroring real-world system-administration workflows.

---



## 🛠️ Skills & Technologies


| Category                  | Tools & Concepts                                                                           |
| ------------------------- | ------------------------------------------------------------------------------------------ |
| **Operating Systems**     | Linux (Slackware 15.0, Slax), shell environment, system configuration                      |
| **Shell Scripting**       | Bash, variables, arrays, conditionals, loops, functions, exit codes, positional parameters |
| **Text Processing**       | `awk`, `sed`, `grep`, CSV/data extraction, regular expressions                             |
| **Package Management**    | `slackpkg`, `upgradepkg`, `removepkg`, `.txz` packages, blacklists, repositories           |
| **Software Compilation**  | `make`, `gcc`, `binutils`, `glibc`, kernel headers, building from source                   |
| **Linux Kernel**          | Kernel configuration (`localmodconfig`, `streamlineconfig`), compilation, modules          |
| **Live System Authoring** | Slax modules (`.sb`), `dir2sb`, `slax activate`, initramfs, overlay customization          |
| **System Administration** | Users/permissions, timezone, locale, services, logging, disk/sync operations               |


---



## 🌟 Featured Work



### Final Assignment — `FinalAssignmentSlaxConfig.sh`

The capstone script of the course. It automates the full configuration of a Slax-based live Linux system:

- Configures `slackpkg` (repository mirrors, batch mode, GPG/MD5 checks, blacklists)
- Performs system updates and upgrades
- Manages user accounts (`guest` removal, `user` creation)
- Removes unwanted software (Chrome/Chromium entries)
- Downloads and installs development toolchains (make, gcc, binutils, glibc, pkg-config, flex, X11 libs)
- Compiles **XNedit 1.6.3** from source against the Slackware toolchain
- Packages the compiled binary into a Slax module (`90-xnedit.sb`) using `dir2sb`
- Deploys and activates the module on the live USB/persistent storage

> **Takeaway:** full-stack system automation — from repository configuration and source compilation to live-system module authoring and deployment.

---



## 🚀 Getting Started



### Prerequisites

- A Linux machine (Slackware 15.0 or Slax recommended for package/kernel tasks)
- `bash` (4.x+)
- Root/sudo privileges for system-level scripts
- `slackpkg`, `upgradepkg`, `removepkg`, `make`, `gcc` (package/kernel sections)



### Clone the repository

```bash
git clone https://github.com/<your-username>/LinuxUniversitySubject.git
cd LinuxUniversitySubject
```

---



## ▶️ How to Run the Scripts

Most scripts are standalone and do not require installation.

```bash
# Example: run a Bash lab script
chmod +x BasicTools/Bash/Lab/script1.sh
./BasicTools/Bash/Lab/script1.sh

# Example: run the final Slax configuration assignment (requires root)
sudo ./FinalAssignmentSlaxConfig.sh
```

> ⚠️ **Warning:** The final assignment script modifies system configuration (`/etc/slackpkg/`, user accounts, package database, live-system modules). Review it before running, and only execute on a disposable or virtualized environment.

---



## 🎯 Learning Outcomes

By working through this coursework, the following competencies were developed:

- Writing robust, readable Bash scripts with proper error handling
- Processing structured and unstructured text using `awk`/`sed`
- Building and installing Linux software from source code
- Compiling and configuring the Linux kernel from source
- Creating and managing Slackware packages (`.txz`) and repositories
- Authoring and deploying Slax live-system modules (`.sb`)

---



## 📄 License

This project is licensed under the **MIT License**. See [LICENSE](LICENSE) for details.

> ⚠️ Note: Kernel configuration archives and compiled binaries (`.zip` / `.txz` files) are included for reference and may be subject to their respective upstream licenses.

