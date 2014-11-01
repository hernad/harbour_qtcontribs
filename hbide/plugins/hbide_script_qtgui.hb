/*
 * $Id: hbide_script_qtgui.hb 34 2012-10-13 21:57:41Z bedipritpal $
 */

/*
 * Harbour Project source code:
 * hbide plugin.
 *
 * Copyright 2010 Pritpal Bedi <bedipritpal@hotmail.com>
 * www - http://harbour-project.org
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2, or (at your option)
 * any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this software; see the file COPYING.  If not, write to
 * the Free Software Foundation, Inc., 59 Temple Place, Suite 330,
 * Boston, MA 02111-1307 USA (or visit the web site http://www.gnu.org/).
 *
 * As a special exception, the Harbour Project gives permission for
 * additional uses of the text contained in its release of Harbour.
 *
 * The exception is that, if you link the Harbour libraries with other
 * files to produce an executable, this does not by itself cause the
 * resulting executable to be covered by the GNU General Public License.
 * Your use of that executable is in no way restricted on account of
 * linking the Harbour library code into it.
 *
 * This exception does not however invalidate any other reasons why
 * the executable file might be covered by the GNU General Public License.
 *
 * This exception applies only to the code released by the Harbour
 * Project under the name Harbour.  If you copy code from other
 * Harbour Project or Free Software Foundation releases into a copy of
 * Harbour, as the General Public License permits, the exception does
 * not apply to the code that you add in this way.  To avoid misleading
 * anyone as to the status of such modified files, you must delete
 * this exception notice from them.
 *
 * If you write modifications of your own for Harbour, it is your choice
 * whether to permit this exception to apply to your modifications.
 * If you do not wish that, delete this exception notice.
 *
 */

/*----------------------------------------------------------------------*/

FUNCTION Main( oIde )
   LOCAL nRet, cText, lOtherLib, cOpt
   LOCAL qDlg, qLbl, qCheck, qEdit, qCombo, qBtnOk, qBtnCn
   LOCAL pEvents := HBQT_EVENTS_NEW()
   LOCAL pSlots  := HBQT_SLOTS_NEW()

   IF ! hb_isObject( oIde )
      oIde := hbide_setIde()
   ENDIF

   qDlg := QDialog( oIde:oDlg:oWidget )
   qdlg:resize( 300, 350 )

   qLbl := QLabel( qDlg )
   qLbl:setText( "Harbour-Qt Gui Dialog as Script" )
   qLbl:move( 20,20 )

   qCombo := QComboBox( qDlg )
   qCombo:move( 100, 100 )
   qCombo:resize( 130, 30 )
   qCombo:addItem( "Sky"       )
   qCombo:addItem( "Is"        )
   qCombo:addItem( "The Limit" )
   qCombo:setCurrentIndex( 0 )

   qCheck := QCheckBox( qDlg )
   qCheck:move( 100, 150 )
   qCheck:setText( "Harbour is Preferred ?" )
   qCheck:setChecked( .t. )

   qEdit := QLineEdit( qDlg )
   qEdit:move( 100, 180 )
   qEdit:resize( 130, 30 )
   qEdit:setText( "Harbour Root Path" )

   qBtnOk := QPushButton( qDlg )
   qBtnOk:move( 50, 300 )
   qBtnOk:setText( "OK" )

   qBtnCn := QPushButton( qDlg )
   qBtnCn:move( 170, 300 )
   qBtnCn:setText( "Cancel" )

   QT_EVENTS_CONNECT( pEvents, qDlg, 10, {|| qDlg:done( 0 ) } )

   HBQT_SLOTS_CONNECT( pSlots, qBtnOk, "clicked()", {|| qDlg:done( 1 ) } )
   HBQT_SLOTS_CONNECT( pSlots, qBtnCn, "clicked()", {|| qDlg:done( 2 ) } )

   nRet := qDlg:exec()

   IF nRet == 1 /* OK */
      cText     := qEdit:text()
      lOtherLib := qCheck:isChecked()
      cOpt      := { "Sky", "Is", "The Limit" }[ qCombo:currentIndex() + 1 ] /* Zero based */

      msgBox( cText, cOpt )
   ENDIF

   RETURN NIL

/*----------------------------------------------------------------------*/