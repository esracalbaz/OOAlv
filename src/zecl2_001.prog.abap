*&---------------------------------------------------------------------*
*& Report ZECL2_001
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZECL2_001.
include ZECL2_001_top. "degiskenleri tanimla
include ZECL2_001_pbo. "screenlerin acilmadan onceki modullerinin toplandigi yer
include ZECL2_001_pai. "olusturduktan sonra butonlari yakaladigim yer
include ZECL2_001_frm. "formlari, performlari olusturdugum yapi

start-of-selection.
*screen uzerinde konumlandirilir

perform get_data.
perform set_fcat.  "fieldcatalogu dolduran bir form

call screen 0100.
