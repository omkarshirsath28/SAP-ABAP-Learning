*&---------------------------------------------------------------------*
*& Report ZPR_11
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZPR_11.


TABLES: MARA,MARC,MARD,MAKT.
type-pools:slis.

TYPes: BEGIN OF t_final,
matnr   TYPE marc-matnr,
werks   TYPE marc-werks,
maktx   TYPE makt-maktx,
sloc     TYPE mard-lgort,
valstk   TYPE mard-labst,
status   TYPE char15,
END OF t_final.

DATA: it_final  TYPE STANDARD TABLE OF t_final," final internal table which displays information
      it_final1 TYPE STANDARD TABLE OF t_final," final internal table which displays mofified information
      wa_final TYPE t_final,
      wa_final1 TYPE t_final.

data: it_fcat type lvc_t_fcat,
      wa_fcat type lvc_s_fcat.


SELECT-OPTIONS: S_WERKS FOR MARC-WERKS,
                S_MATNR FOR MARC-MATNR.

START-OF-SELECTION.

SELECT MATNR,WERKS FROM MARC INTO TABLE @DATA(IT_MARC) WHERE WERKS IN @S_WERKS AND MATNR IN @S_MATNR.

IF IT_MARC IS NOT INITIAL." CHECK IF INFORMATION IS AVAIBLE FROM MARC TABLE
SELECT MATNR,MAKTX FROM MAKT INTO TABLE @DATA(IT_MAKT) FOR ALL ENTRIES IN @IT_MARC
  WHERE MATNR = @IT_MARC-MATNR.

SELECT matnr,werks,lgort,labst FROM mard INTO TABLE @DATA(it_mard) FOR ALL ENTRIES IN @it_marc
  WHERE matnr = @it_marc-matnr AND werks = @it_marc-werks.
ENDIF.

LOOP AT it_marc ASSIGNING FIELD-SYMBOL(<gs_marc>).
wa_final-matnr  = <gs_marc>-matnr."Material number assignement
wa_final-werks  = <gs_marc>-werks."material Plant assignment

READ TABLE it_makt ASSIGNING FIELD-SYMBOL(<gs_makt>) WITH KEY matnr = <gs_marc>-matnr.

IF <gs_makt> is ASSIGNED.
wa_final-maktx  = <gs_makt>-maktx."material description assignement
UNASSIGN <gs_makt>."TO clear Field symbol
ENDIF.

READ TABLE it_mard ASSIGNING FIELD-SYMBOL(<gs_mard>) with KEY matnr = <gs_marc>-matnr."Read Operation(R)
IF <gs_mard> is ASSIGNED.
wa_final-sloc = <gs_mard>-lgort." Storage location assignment
wa_final-valstk = <gs_mard>-labst." Valuated Stock assignement
UNASSIGN <gs_mard>.
ENDIF.

"to add new row at end of Internal table IT_FINAL
APPEND wa_final to it_final." Creation Operation(C)

ENDLOOP.

IF it_final is NOT INITIAL.
sort it_final by matnr.
new-line.
LOOP AT it_final ASSIGNING FIELD-SYMBOL(<wa>).
IF <wa>-valstk is INITIAl.
  <wa>-status = 'No Status'.
endif.
ENDLOOP.



ENDIF.

wa_fcat-FIELDNAME = 'matnr'.
wa_fcat-SCRTEXT_L = 'material NO.'.
Wa_fcat-no_zero = 'X'.
wa_fcat-EDIT      = 'X'.
append wa_fcat to it_fcat.
clear:wa_fcat.

wa_fcat-FIELDNAME = 'werks'.
wa_fcat-SCRTEXT_L = 'Plant'.
wa_fcat-EMPHASIZE = 'C300'.
append wa_fcat to it_fcat.
clear:wa_fcat.

wa_fcat-FIELDNAME = 'maktx'.
wa_fcat-SCRTEXT_L = 'Material description'.
append wa_fcat to it_fcat.
clear:wa_fcat.

wa_fcat-FIELDNAME = 'sloc'.
wa_fcat-SCRTEXT_L = 'Storage location'.
append wa_fcat to it_fcat.
clear:wa_fcat.

wa_fcat-FIELDNAME = 'valstk'.
wa_fcat-SCRTEXT_L = 'valuated stock'.
append wa_fcat to it_fcat.
clear:wa_fcat.

wa_fcat-FIELDNAME = 'status'.
wa_fcat-SCRTEXT_L = 'Status'.
append wa_fcat to it_fcat.
clear:wa_fcat.

CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY_LVC'
 EXPORTING
*   I_INTERFACE_CHECK                 = ' '
*   I_BYPASSING_BUFFER                =
*   I_BUFFER_ACTIVE                   =
*   I_CALLBACK_PROGRAM                = ' '
*   I_CALLBACK_PF_STATUS_SET          = ' '
*   I_CALLBACK_USER_COMMAND           = ' '
*   I_CALLBACK_TOP_OF_PAGE            = ' '
*   I_CALLBACK_HTML_TOP_OF_PAGE       = ' '
*   I_CALLBACK_HTML_END_OF_LIST       = ' '
*   I_STRUCTURE_NAME                  =
*   I_BACKGROUND_ID                   = ' '
*   I_GRID_TITLE                      =
*   I_GRID_SETTINGS                   =
*   IS_LAYOUT_LVC                     =
    IT_FIELDCAT_LVC                   = it_fcat
*   IT_EXCLUDING                      =
*   IT_SPECIAL_GROUPS_LVC             =
*   IT_SORT_LVC                       =
*   IT_FILTER_LVC                     =
*   IT_HYPERLINK                      =
*   IS_SEL_HIDE                       =
*   I_DEFAULT                         = 'X'
*   I_SAVE                            = ' '
*   IS_VARIANT                        =
*   IT_EVENTS                         =
*   IT_EVENT_EXIT                     =
*   IS_PRINT_LVC                      =
*   IS_REPREP_ID_LVC                  =
*   I_SCREEN_START_COLUMN             = 0
*   I_SCREEN_START_LINE               = 0
*   I_SCREEN_END_COLUMN               = 0
*   I_SCREEN_END_LINE                 = 0
*   I_HTML_HEIGHT_TOP                 =
*   I_HTML_HEIGHT_END                 =
*   IT_ALV_GRAPHICS                   =
*   IT_EXCEPT_QINFO_LVC               =
* IMPORTING
*   E_EXIT_CAUSED_BY_CALLER           =
*   ES_EXIT_CAUSED_BY_USER            =
  TABLES
    t_outtab                          = it_final
 EXCEPTIONS
  PROGRAM_ERROR                     = 1
  OTHERS                            = 2
          .
IF sy-subrc <> 0.
* Implement suitable error handling here
ENDIF.