


# Lecture 13 – Traditional ALV using LVC Field Catalog

## 📌 Topic

Traditional ALV (ABAP List Viewer) using LVC Field Catalog.

## 🎯 What I Learned

In this lecture, I learned how to create a traditional ALV report using the LVC field catalog approach.

Key concepts covered:

- What is ALV (ABAP List Viewer)
- Purpose of an ALV report
- What is a Field Catalog
- `LVC_S_FCAT`
- `LVC_T_FCAT`
- Creating and populating a field catalog
- Customizing ALV column properties
- `REUSE_ALV_GRID_DISPLAY_LVC`
- Passing the field catalog to the ALV function module
- Passing an internal table as the ALV output table

## 🧠 Key Concepts

### ALV

ALV (ABAP List Viewer) is used to display internal table data in a structured and interactive tabular format.

### Field Catalog

A field catalog defines the properties and display characteristics of columns in the ALV output.

For example:

- Field name
- Column heading
- Column width
- Column visibility
- Column formatting

### LVC_S_FCAT

`LVC_S_FCAT` is a structure used to define the properties of a single ALV column.

### LVC_T_FCAT

`LVC_T_FCAT` is a table type used to store multiple field catalog entries.

```text
LVC_S_FCAT → One field catalog entry
LVC_T_FCAT → Collection of field catalog entries
````

## 💻 Practical Implementation

In this program, I created an ALV report that displays:

* Material Number
* Plant
* Material Description
* Storage Location
* Valuated Stock
* Status

The field catalog was customized for the output columns.

Example:

```abap
DATA: it_fcat TYPE lvc_t_fcat,
      wa_fcat TYPE lvc_s_fcat.
```

A field catalog entry was created and appended for each column:

```abap
wa_fcat-FIELDNAME = 'matnr'.
wa_fcat-SCRTEXT_L = 'Material NO.'.
wa_fcat-NO_ZERO   = 'X'.

APPEND wa_fcat TO it_fcat.
CLEAR wa_fcat.
```

The field catalog was then passed to the ALV function module:

```abap
CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY_LVC'
  EXPORTING
    IT_FIELDCAT_LVC = it_fcat
  TABLES
    t_outtab        = it_final.
```

## 🔄 ALV Report Flow

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

## 📝 Interview Preparation

### What is ALV?

ALV (ABAP List Viewer) is a standard SAP framework used to display internal table data in a structured and interactive format.

### What is a Field Catalog?

A field catalog contains metadata that defines the properties and display characteristics of fields in an ALV output.

### What is `LVC_S_FCAT`?

`LVC_S_FCAT` is a structure used for defining one field catalog entry.

### What is `LVC_T_FCAT`?

`LVC_T_FCAT` is a table type used to hold multiple field catalog entries.

### Difference between `LVC_S_FCAT` and `LVC_T_FCAT`

```text
LVC_S_FCAT → Structure → One field catalog entry

LVC_T_FCAT → Table Type → Multiple field catalog entries
```

## 📚 Program

**ABAP Program:** `ZPR_11`

This program is part of my SAP ABAP learning journey and represents my practice with traditional ALV and LVC field catalogs.



**Learning Status:** ✅ Completed
**Lecture:** 13
**Topic:** Traditional ALV using LVC Field Catalog




