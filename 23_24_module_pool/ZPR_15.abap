*&---------------------------------------------------------------------*
*& Module Pool      ZPR_15
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
PROGRAM ZPR_15.

tables: ZEM_MASTER.

data: CHECK type char1,
      RAD1 type char1,
      RAD2 type char1,
      EMP_NO_INPUT type char15.

data:
GV_EMP_NO      type ZEM_MASTER-emp_no,
GV_EMP_GENDER     type ZEM_MASTER-emp_gender,
GV_EMP_FNAME      type ZEM_MASTER-emp_fname,
GV_EMP_LNAME      type ZEM_MASTER-emp_lname,
GV_EMP_DEPT       type ZEM_MASTER-emp_dept,
GV_EMP_CONTACT    type ZEM_MASTER-emp_contact,
GV_EMP_EMAIL      type ZEM_MASTER-emp_email,
GV_DOB            type ZEM_MASTER-dob.


start-of-selection.
call screen 100.

end-of-selection.

module input input.
  CASE sy-ucomm.
    WHEN 'GENDER' .
      message 'Gender is selected' type 'I'.
    WHEN 'BACK'.
      leave to screen 0.
    WHEN OTHERS.
  ENDCASE.
endmodule.

module extract_data input.

    if EMP_NO_INPUT is not initial.
      select single EMP_NO EMP_GENDER EMP_FNAME EMP_LNAME EMP_DEPT EMP_CONTACT EMP_EMAIL DOB from ZEM_MASTER
        INTO (GV_EMP_NO,GV_EMP_GENDER,GV_EMP_FNAME,GV_EMP_LNAME,GV_EMP_DEPT,GV_EMP_CONTACT,GV_EMP_EMAIL,GV_DOB)
        where emp_no = EMP_NO_INPUT.
    else.
      clear:GV_EMP_NO,GV_EMP_GENDER,GV_EMP_FNAME,GV_EMP_LNAME,GV_EMP_DEPT,GV_EMP_CONTACT,GV_EMP_EMAIL,GV_DOB.
    endif.
endmodule.