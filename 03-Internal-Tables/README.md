
````markdown
# Traditional ALV using LVC Field Catalog

This is a practice program created while learning **SAP ABAP Traditional ALV**.

## Topics Practiced

* ALV (ABAP List Viewer)
* Traditional ALV
* Field Catalog
* `LVC_S_FCAT`
* `LVC_T_FCAT`
* Creating and modifying Field Catalog entries
* ALV column properties
* `REUSE_ALV_GRID_DISPLAY_LVC`
* Displaying internal table data using ALV
* Material data retrieval using `MARC`, `MAKT`, and `MARD`

## Program Description

The program retrieves **Material Number (`MATNR`)**, **Plant (`WERKS`)**, **Material Description (`MAKTX`)**, **Storage Location (`LGORT`)**, and **Valuated Stock (`LABST`)** from SAP database tables.

The retrieved data is combined into a final internal table and displayed using a **Traditional ALV Grid**.

A custom **LVC Field Catalog** is created to define the properties and appearance of each column in the ALV output.

## ABAP Program

**Program:** `ZPR_11`

**Database Tables:**

* `MARC` – Plant-specific Material Data
* `MAKT` – Material Descriptions
* `MARD` – Storage Location Data

**Fields Used:**

* `MATNR` – Material Number
* `WERKS` – Plant
* `MAKTX` – Material Description
* `LGORT` – Storage Location
* `LABST` – Valuated Stock
* `STATUS` – Material Status

## Field Catalog

The program uses the following LVC field catalog types:

* `LVC_S_FCAT` – Structure used for a single field catalog entry
* `LVC_T_FCAT` – Table type used to store multiple field catalog entries

The field catalog is used to customize the ALV columns, including:

* Column heading
* Column formatting
* Column emphasis
* Leading zero display
* Edit property

## ALV Function Module

The ALV output is generated using:

```abap
REUSE_ALV_GRID_DISPLAY_LVC
````

The field catalog and final internal table are passed to the function module:

```abap
IT_FIELDCAT_LVC = it_fcat
T_OUTTAB        = it_final
```

## ALV Report Flow

```text
Database Tables
      ↓
SELECT Data
      ↓
Internal Tables
      ↓
Final Internal Table
      ↓
Create LVC Field Catalog
      ↓
REUSE_ALV_GRID_DISPLAY_LVC
      ↓
ALV Output
```

## Practice Output

### Selection Screen

*Add screenshot here*

### ALV Output
<img width="1855" height="939" alt="Screenshot 2026-09-10 172543" src="https://github.com/user-attachments/assets/f1b0bed9-e605-4d09-9e15-308094b7c334" />
<img width="1861" height="943" alt="Screenshot 2026-09-10 172602" src="https://github.com/user-attachments/assets/891cb456-1b35-42f5-870c-684a6a8326e9" />



## What I Learned

Through this practice, I learned how to:

* Understand the purpose of ALV
* Create a Traditional ALV report
* Create an LVC field catalog
* Use `LVC_S_FCAT` and `LVC_T_FCAT`
* Customize ALV column properties
* Use `REUSE_ALV_GRID_DISPLAY_LVC`
* Pass an internal table to the ALV function module
* Display database data in an interactive ALV format

## Note

This program is part of my **SAP ABAP learning and practice work**.

```

This matches the **same style as your existing README**—`Topics Practiced → Program Description → ABAP Program → Practice Output → What I Learned → Note`—so your GitHub learning record will look consistent as you add more lectures.
```
