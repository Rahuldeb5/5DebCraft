# 5DebCraft

**Final Project for AP Computer Science A (APCSA)**  
**Teacher:** Ms. Novillo  
**Student:** Rahul Deb (Period 6)  
**Email:** rdeb60@stuy.edu  

---

## 🧱 Project Overview

**5DebCraft** is a 3D Minecraft-clone sandbox game developed in Processing as a final project for APCSA. The game simulates core Minecraft mechanics, including block placement, destruction with cracking animation, a dynamic HUD, and a first-person camera system.

---

## 🎮 Features

- **Procedural Terrain Generation**  
  World is randomly generated with Perlin noise and includes terrain features like hills and lakes.

- **Block Types**  
  Includes 6 block types: dirt, stone, sand, wood, leaf, and water. Each is a subclass of a `Block` superclass with:
  - `hardness`
  - `breakable` flag
  - `texture`

- **Player Controls**
  - `W/A/S/D` – Move forward/left/back/right
  - `Space` – Jump
  - `Shift` – Sprint
  - `1–5` – Select item in hotbar
  - `Left Click` – Break block (respecting hardness)
  - `Right Click` – Place block from inventory

- **Mining & Cracking Animation**  
  Blocks take time to break, with a crack texture overlay displayed based on progress.

- **Inventory System**
  - Stack up to 64 items per type (except water, which is not collectible)
  - Right-click places the selected block, if available

- **HUD Elements**
  - Crosshair
  - Hotbar with selected item highlight

---

## 🛠️ Technologies

- **Language:** Java (Processing)
- **Graphics:** Processing 3 with `P3D` renderer
- **Audio:** Processing Sound library

---

## 🗂️ Project Structure

- `Block.java` – Abstract base class for all blocks
- `Camera.java` – Handles first-person view and mouse movement
- `Inventory.java` – Tracks item stacks and player selection
- `HUD.java` – Renders UI elements
- `World.java` – Procedural generation of terrain
- `InputManager.java` – Keyboard input state handling

---

## 💡 Credits

Developed by **Rahul Deb** for APCSA  
Teacher: **Ms. Novillo**  
Stuyvesant High School | Period 6

---
