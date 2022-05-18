*&---------------------------------------------------------------------*
*& Include          ZECL2_001_PAI
*&---------------------------------------------------------------------*
MODULE user_command_0100 INPUT.
  CASE  sy-ucomm.
    WHEN '&BACK'.
      SET SCREEN 0.
  ENDCASE.
ENDMODULE.
