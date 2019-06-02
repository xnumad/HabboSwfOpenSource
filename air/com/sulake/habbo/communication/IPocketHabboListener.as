//com.sulake.habbo.communication.IPocketHabboListener

package com.sulake.habbo.communication{
    public /*dynamic*/ interface IPocketHabboListener {

        function get disposed():Boolean;
        function pocketHabboResponse(k:String, _arg_2:Object):void;
        function pocketHabboRawResponse(k:String, _arg_2:Object):void;
        function pocketHabboError(k:String, _arg_2:Object):void;

    }
}//package com.sulake.habbo.communication

