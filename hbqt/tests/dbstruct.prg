/*
 * $Id: dbstruct.prg 41 2012-10-25 21:15:00Z bedipritpal $
 */

/*
 * Copyright 2012 Pritpal Bedi <bedipritpal@hotmail.com>
 * www - http://harbour-project.org
 *
 */
/*----------------------------------------------------------------------*/

#include "hbqtgui.ch"
#include "common.ch"

/*----------------------------------------------------------------------*/

FUNCTION main()
   LOCAL oStruct

   oStruct := uie_dbstruct():new()
   oStruct:create()
   oStruct:show()

   QApplication():exec()

   RETURN NIL

/*----------------------------------------------------------------------*/

