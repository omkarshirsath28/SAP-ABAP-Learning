# Internal Tables – Standard and Sorted

This is a practice program created while learning **SAP ABAP Internal Tables**.

## Topics Practiced

* Internal Tables
* Standard Internal Table
* Sorted Internal Table
* Internal Table Work Area
* `TYPES`
* `LOOP AT`
* `SELECT-OPTIONS`
* Database selection using `SELECT`
* Reading data from the `MARA` table
* Displaying data using `WRITE`

## Program Description

The program retrieves **Material Number (`MATNR`)** and **Creation Date (`ERSDA`)** from the SAP `MARA` table based on the material number entered in the selection screen.

The same data is stored and displayed using two different internal table types:

1. **Standard Internal Table**
2. **Sorted Internal Table with a unique key on `MATNR`**

The output demonstrates how the data is handled using each internal table.

## ABAP Program

**Program:** `ZPR_8`

**Database Table:** `MARA`

**Fields Used:**

* `MATNR` – Material Number
* `ERSDA` – Creation Date

## Practice Output

### Selection Screen

<!-- Add your selection screen screenshot here -->

### Program Output

<!-- Add your output screenshot here -->

## What I Learned

Through this practice, I learned how to:

* Define a structure using `TYPES`
* Declare standard and sorted internal tables
* Use a work area to process internal table data
* Retrieve database records into internal tables
* Loop through internal tables
* Display internal table data
* Use a sorted internal table with a unique key

## Note

This program is part of my **SAP ABAP learning and practice work**.

