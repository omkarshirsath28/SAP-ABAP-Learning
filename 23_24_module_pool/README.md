

````markdown
# Lecture 14 – Module Pool Programming and Employee Data Display

## 📌 Topic

Module Pool Programming and Screen Programming in SAP ABAP.

## 🎯 What I Learned

In this lecture, I learned the basics of **Module Pool Programming** and how to create an interactive SAP GUI screen.

I created a screen-based program where the user enters an Employee Number and the program retrieves employee details from the custom database table `ZEM_MASTER`.

Key concepts covered:

- Module Pool Programming
- Screen Programming
- Creating and calling a screen
- Screen Flow Logic
- `PROCESS BEFORE OUTPUT` (PBO)
- `PROCESS AFTER INPUT` (PAI)
- ABAP Modules
- `MODULE ... INPUT`
- `SY-UCOMM`
- Function Codes
- `CALL SCREEN`
- `LEAVE TO SCREEN`
- `SELECT SINGLE`
- Retrieving data from a database table
- Screen fields and ABAP variables
- Clearing screen data

## 🧠 Key Concepts

### Module Pool Programming

Module Pool Programming is an ABAP programming technique used to develop interactive screen-based applications in SAP GUI.

It allows users to interact with screens using:

- Input fields
- Buttons
- Checkboxes
- Radio buttons
- Other screen elements

The program processes user actions and controls the screen flow using ABAP logic.

### Screen Programming

Screen Programming is used to create and control interactive SAP GUI screens.

A screen can contain fields and controls that allow users to enter, display, and process data.

### Screen Flow Logic

Screen Flow Logic controls the processing sequence of a screen.

The two main events are:

```text
PBO → Process Before Output
PAI → Process After Input
````

### PBO – Process Before Output

PBO is processed before the screen is displayed to the user.

It is generally used to prepare the screen before output.

### PAI – Process After Input

PAI is processed after the user performs an action on the screen, such as pressing Enter or clicking a button.

It is used to process user input and execute the required ABAP logic.

### ABAP Module

A module contains ABAP processing logic that is called from the screen flow logic.

Example:

```abap
MODULE INPUT INPUT.
```

In this program, the module processes user actions using `SY-UCOMM`.

### SY-UCOMM

`SY-UCOMM` is a system field that contains the function code triggered by a user action.

Example:

```abap
CASE sy-ucomm.
  WHEN 'GENDER'.
    MESSAGE 'Gender is selected' TYPE 'I'.

  WHEN 'BACK'.
    LEAVE TO SCREEN 0.
ENDCASE.
```

### CALL SCREEN

`CALL SCREEN` is used to call and display a screen.

Example:

```abap
CALL SCREEN 100.
```

This program calls Screen `100`.

### LEAVE TO SCREEN

`LEAVE TO SCREEN` is used to control screen navigation.

Example:

```abap
LEAVE TO SCREEN 0.
```

In this program, it is used when the user triggers the `BACK` function.

## 💻 Practical Implementation

In this program, I created an Employee Details screen.

The user enters an Employee Number, and the program retrieves the employee details from the custom database table `ZEM_MASTER`.

The employee information includes:

* Employee Number
* Gender
* First Name
* Last Name
* Department
* Contact
* Email
* Date of Birth

The program uses global variables to store the retrieved employee data.

Example:

```abap
DATA:
GV_EMP_NO       TYPE ZEM_MASTER-emp_no,
GV_EMP_GENDER   TYPE ZEM_MASTER-emp_gender,
GV_EMP_FNAME    TYPE ZEM_MASTER-emp_fname,
GV_EMP_LNAME    TYPE ZEM_MASTER-emp_lname,
GV_EMP_DEPT     TYPE ZEM_MASTER-emp_dept,
GV_EMP_CONTACT  TYPE ZEM_MASTER-emp_contact,
GV_EMP_EMAIL    TYPE ZEM_MASTER-emp_email,
GV_DOB          TYPE ZEM_MASTER-dob.
```

The screen is called using:

```abap
CALL SCREEN 100.
```

The screen flow logic contains PBO and PAI sections:

```abap
PROCESS BEFORE OUTPUT.

PROCESS AFTER INPUT.
  MODULE INPUT.
  MODULE EXTRACT_DATA.
```

The `EXTRACT_DATA` module checks whether an Employee Number has been entered.

If an Employee Number is provided, the program retrieves the employee details using `SELECT SINGLE`.

Example:

```abap
SELECT SINGLE EMP_NO
              EMP_GENDER
              EMP_FNAME
              EMP_LNAME
              EMP_DEPT
              EMP_CONTACT
              EMP_EMAIL
              DOB
  FROM ZEM_MASTER
  INTO (GV_EMP_NO,
        GV_EMP_GENDER,
        GV_EMP_FNAME,
        GV_EMP_LNAME,
        GV_EMP_DEPT,
        GV_EMP_CONTACT,
        GV_EMP_EMAIL,
        GV_DOB)
  WHERE emp_no = EMP_NO_INPUT.
```

If no Employee Number is entered, the employee detail variables are cleared.

```abap
CLEAR:
  GV_EMP_NO,
  GV_EMP_GENDER,
  GV_EMP_FNAME,
  GV_EMP_LNAME,
  GV_EMP_DEPT,
  GV_EMP_CONTACT,
  GV_EMP_EMAIL,
  GV_DOB.
```
## 🖼️ Output Screenshots

### Employee Details Screen

The following screenshot shows the Module Pool screen with employee details retrieved from `ZEM_MASTER`.

<img width="1862" height="943" alt="Screenshot 2026-09-16 094124" src="https://github.com/user-attachments/assets/34a33786-fc13-4a31-a6fc-a80e30578e4d" />



### Screen with Employee Number Input

The following screenshot shows the screen before employee details are retrieved.

<img width="1859" height="941" alt="Screenshot 2026-09-16 094152" src="https://github.com/user-attachments/assets/8ac905e5-4b6a-4653-b92e-b1f35b42b1a5" />

## 🔄 Program Flow

```text
Start Program
      ↓
CALL SCREEN 100
      ↓
Screen 100 is Displayed
      ↓
User Enters Employee Number
      ↓
User Performs an Action
      ↓
PAI is Triggered
      ↓
MODULE INPUT
      ↓
Check SY-UCOMM
      ↓
MODULE EXTRACT_DATA
      ↓
Check Employee Number
      ↓
SELECT SINGLE from ZEM_MASTER
      ↓
Store Data in Global Variables
      ↓
Employee Details Displayed on Screen
```

## 📝 Interview Preparation

### What is Module Pool Programming?

Module Pool Programming is an ABAP programming technique used to create dialog-based and interactive SAP GUI applications consisting of one or more screens.

### What is Screen Programming?

Screen Programming is the development of interactive SAP GUI screens that allow users to enter, display, and process data.

### What is PBO?

PBO stands for **Process Before Output**.

It is executed before the screen is displayed and is generally used to prepare the screen.

### What is PAI?

PAI stands for **Process After Input**.

It is executed after the user performs an action on the screen and is used to process user input.

### What is Screen Flow Logic?

Screen Flow Logic defines the processing sequence of a screen and controls when PBO and PAI modules are executed.

### What is `SY-UCOMM`?

`SY-UCOMM` is a system field that contains the function code triggered by a user's action.

### What is `CALL SCREEN`?

`CALL SCREEN` is used to call and display a specific screen during program execution.

### What is `LEAVE TO SCREEN 0`?

`LEAVE TO SCREEN 0` is used to leave the current screen and return from the screen sequence.

### How does a Module Pool program differ from an executable report?

```text
Executable Report
      ↓
Selection Screen
      ↓
Execute Program
      ↓
Process Data
      ↓
Display Output


Module Pool Program
      ↓
Interactive Screen
      ↓
User Interaction
      ↓
PAI
      ↓
ABAP Modules
      ↓
Process Data
      ↓
Update / Display Screen
```

## 📚 Program

**ABAP Program:** `ZPR_15`

**Screen:** `100`

**Database Table:** `ZEM_MASTER`

This program is part of my SAP ABAP learning journey and represents my practice with Module Pool Programming, Screen Flow Logic, PAI processing, user commands, and retrieving employee data from a custom database table.

---

**Learning Status:** ✅ Completed
**Lecture:** 14
**Topic:** Module Pool Programming and Employee Data Display


