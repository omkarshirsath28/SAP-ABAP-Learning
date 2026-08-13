*&---------------------------------------------------------------------*
*& Report ZPR_8
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zpr_8.

TABLES: mara.

TYPES:BEGIN OF tab,
        matnr TYPE mara-matnr,
        ersda TYPE mara-ersda,
      END OF tab.

DATA: it  TYPE STANDARD TABLE OF tab,
      it1 TYPE SORTED TABLE OF tab WITH UNIQUE KEY matnr,
      wa  TYPE tab.

SELECT-OPTIONS: s_matnr FOR mara-matnr.

SELECT matnr ersda
INTO CORRESPONDING FIELDS OF TABLE it
FROM mara
WHERE matnr IN s_matnr.
WRITE:'using the standard internal table'.
NEW-LINE.
WRITE:'material number ', 'creation date'.
LOOP AT it INTO wa.
  NEW-LINE.
  WRITE:wa-matnr , wa-ersda.
  CLEAR:wa.
ENDLOOP .

ULINE.
WRITE:'using the sorted internal table'.
NEW-LINE.
WRITE:'material number ', 'creation date'.
SELECT matnr ersda
INTO CORRESPONDING FIELDS OF TABLE it1
FROM mara
WHERE matnr IN s_matnr.

LOOP AT it1 INTO wa.
  NEW-LINE.
  WRITE:wa-matnr , wa-ersda.
  CLEAR:wa.
ENDLOOP .