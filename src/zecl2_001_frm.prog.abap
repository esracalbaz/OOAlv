*&---------------------------------------------------------------------*
*& Include          ZECL2_001_FRM
*&---------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*& Form display_alv
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM display_alv .
*  create object go_container
*  EXPORTING
*    container_name              = 'CC_ALV'                 " Name of the Screen CustCtrl Name to Link Container To
*    .
*create object go_alv
*  EXPORTING
*    i_parent                = go_container                 " Parent Container
*    .
  create object go_alv
    EXPORTING
      i_parent                = cl_gui_container=>screen0.                " Parent Container

call method go_alv->set_table_for_first_display
*  EXPORTING
*    i_buffer_active               =                  " Buffering Active
*    i_bypassing_buffer            =                  " Switch Off Buffer
*    i_consistency_check           =                  " Starting Consistency Check for Interface Error Recognition
*    i_structure_name              = 'GS_NEW'                 " Internal Output Table Structure Name
*    is_variant                    =                  " Layout
*    i_save                        =                  " Save Layout
*    i_default                     = 'X'              " Default Display Variant
*    is_layout                     =                  " Layout
*    is_print                      =                  " Print Control
*    it_special_groups             =                  " Field Groups
*    it_toolbar_excluding          =                  " Excluded Toolbar Standard Functions
*    it_hyperlink                  =                  " Hyperlinks
*    it_alv_graphics               =                  " Table of Structure DTC_S_TC
*    it_except_qinfo               =                  " Table for Exception Quickinfo
*    ir_salv_adapter               =                  " Interface ALV Adapter
  CHANGING
    it_outtab                     = gt_new              " Output Table
    it_fieldcatalog               = gt_fcat                 " Field Catalog "column bazinda duzenlemelerin yapildigi yapi
*    it_sort                       =                  " Sort Criteria
*    it_filter                     =                  " Filter Criteria
*  EXCEPTIONS
*    invalid_parameter_combination = 1                " Wrong Parameter
*    program_error                 = 2                " Program Errors
*    too_many_lines                = 3                " Too many Rows in Ready for Input Grid
*    others                        = 4
  .
ENDFORM.
*&---------------------------------------------------------------------*
*& Form get_data
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM get_data .
  select * from bkpf
 inner join bseg on bseg~belnr eq bkpf~belnr
  and bseg~bukrs eq bkpf~bukrs
  and bseg~gjahr eq bkpf~gjahr
  into CORRESPONDING FIELDS OF table gt_new .
ENDFORM.
*&---------------------------------------------------------------------*
*& Form set_fcat
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM set_fcat .
  clear: gs_fcat.
  gs_fcat-fieldname = 'bukrs'.
  append gs_fcat to gt_fcat.
  clear: gs_fcat.
  gs_fcat-fieldname = 'belnr'.
  append gs_fcat to gt_fcat.
  clear: gs_fcat.
  gs_fcat-fieldname = 'gjahr'.
  append gs_fcat to gt_fcat.
  clear: gs_fcat.
  gs_fcat-fieldname = 'buzei'.
  append gs_fcat to gt_fcat.
  clear: gs_fcat.
  gs_fcat-fieldname = 'bldat'.
  append gs_fcat to gt_fcat.
*  CALL FUNCTION 'LVC_FIELDCATALOG_MERGE'
*   EXPORTING
**     I_BUFFER_ACTIVE              =
*     I_STRUCTURE_NAME             = 'ZECL_S002'
**     I_CLIENT_NEVER_DISPLAY       = 'X'
**     I_BYPASSING_BUFFER           =
**     I_INTERNAL_TABNAME           =
*    CHANGING
*      ct_fieldcat                  = gt_fcat
**   EXCEPTIONS
**     INCONSISTENT_INTERFACE       = 1
**     PROGRAM_ERROR                = 2
**     OTHERS                       = 3
*  .

ENDFORM.
