*&---------------------------------------------------------------------*
*& Include          ZECL2_001_TOP
*&---------------------------------------------------------------------*
TABLES: bkpf, bseg.

data: go_alv type ref to cl_gui_alv_grid.
*     go_container type ref to cl_gui_custom_container.

types : begin OF  gty_new ,
          mark ,
          bukrs TYPE bseg-bukrs,
          belnr TYPE bseg-belnr,
          gjahr TYPE bseg-gjahr,
          buzei TYPE bseg-buzei,
          bukrss TYPE bkpf-bukrs,
          belnrr TYPE bkpf-belnr,
          gjahrr TYPE bkpf-gjahr,
          bldat TYPE bkpf-bldat,
        END OF gty_new.

DATA: gt_new   TYPE TABLE OF gty_new,
      gs_new   TYPE gty_new,
      gt_fcat TYPE LVC_T_FCAT,         "fieldcatalog internal tablei olusturdum
      gs_fcat type LVC_S_FCAT.         "fieldcatalog structeri olusturdum
