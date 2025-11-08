# Farm IT (DataFarm IT) 🌱💧
**Low-cost smart irrigation & environment monitoring + cross-platform Flutter app.**  
Supports **ESP8266/ESP32** devices (NodeMCU / DevKit), soil-moisture & temperature sensors, a 5V relay to control a 12V pump—and a beautiful Flutter app for weather, sensors, games, and farm tools.

[![Flutter](https://img.shields.io/badge/Flutter-3.x-blue)](https://flutter.dev/)
[![Dart](https://img.shields.io/badge/Dart-3.x-00B4AB)](https://dart.dev/)
[![Python](https://img.shields.io/badge/Python-3.11+-yellow)](https://www.python.org/)
[![Flask](https://img.shields.io/badge/Flask-API-black)](https://flask.palletsprojects.com/)
[![Arduino](https://img.shields.io/badge/Arduino-ESP8266%2FESP32-teal)](https://www.arduino.cc/)
[![License: MIT](https://img.shields.io/badge/License-MIT-green)](#license)

**Official website:** https://farmit.ma

---

## Table of Contents
- [Overview](#overview)
- [Architecture](#architecture)
- [Farm IT App (Flutter)](#farm-it-app-flutter)
  - [Features (App)](#features-app)
  - [Screenshots](#screenshots)
  - [Getting Started (Flutter)](#getting-started-flutter)
  - [Project Structure (App)](#project-structure-app)
- [IoT & Backend](#iot--backend)
  - [Hardware](#hardware)
  - [Firmware Setup (ESP8266/ESP32)](#firmware-setup-esp8266esp32)
  - [Backend API (Flask)](#backend-api-flask)
- [Automation & Rules](#automation--rules)
- [Safety Notes](#safety-notes)
- [Roadmap](#roadmap)
- [Contributing](#contributing)
- [License](#license)
- [Résumé (Français)](#résumé-français)

---

## Overview
**Farm IT** monitors soil humidity and temperature and automatically waters plants using a relay-controlled pump.  
It can run **fully local** (device serves its own web page) or in **cloud mode** with a Flask API + web dashboard for historical graphs, alerts, and rules.  
A **Flutter** companion app brings weather, sensors, QR tools, kids’ games, and farm management to **Android, iOS, Web, Windows, Linux, and macOS**.

---

## Architecture
       [ Sensors ]   [ Relay (5V) ]
           |               |
      +----+---------------+----+
      |     ESP8266/ESP32       |
      |  Local UI (SSE) or      |
      |  HTTP -> Flask API      |
      +-----------+-------------+
                  |
             (LAN/Internet)
                  |
            +-----v------+
            |  Flask API |
            |  PostgreSQL|
            +-----+------+
                  |
    +-------------v---------------+
    |     Flutter App / Web UI    |
    |  Weather • Sensors • Games  |
    +-----------------------------+

---

## Farm IT App (Flutter)

### Features (App)
- Real-time **weather** and **sensor** data visualization  
- **QR scanner** for quick access to plant information  
- **Educational games & quizzes** for kids  
- **Farm management tools** (reservoirs, pumps, history, etc.)  
- **Multi-platform**: Android, iOS, Web, Windows, Linux, macOS

### Screenshots
<div align="center">
  <img src="https://github.com/user-attachments/assets/2680e1d3-5b6f-4685-a2b5-c43efcd43528" alt="Screenshot 1" width="100%"/>
  <img src="https://github.com/user-attachments/assets/38abdd6a-8115-4590-af0b-df616a5421f6" alt="Screenshot 2" width="100%"/>
  <img src="https://github.com/user-attachments/assets/37f137e1-2935-49ff-9a2f-d26b1bdfc56a" alt="Screenshot 3" width="100%"/>
  <img src="https://github.com/user-attachments/assets/f334e595-a06c-4d45-a4a7-d3503de8012a" alt="Screenshot 4" width="100%"/>
  <img src="https://github.com/user-attachments/assets/64c9f080-3dae-4782-bce9-71b447d664b9" alt="Screenshot 5" width="100%"/>
</div>

> Tip: On GitHub web, click a screenshot to view full size.

### Getting Started (Flutter)
**Prerequisites**
- [Flutter SDK](https://flutter.dev/docs/get-started/install) (includes Dart)
- Android Studio / Xcode / VS Code (for platform builds)

**Install & Run**
```sh
git clone https://github.com/yourusername/farm_it_project.git
cd farm_it_project
flutter pub get
flutter run
