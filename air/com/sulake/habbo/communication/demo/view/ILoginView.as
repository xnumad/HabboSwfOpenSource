//com.sulake.habbo.communication.demo.view.ILoginView

package com.sulake.habbo.communication.demo.view{
    import com.sulake.core.runtime.IDisposable;
    import flash.utils.Dictionary;

    public /*dynamic*/ interface ILoginView extends IDisposable {

        function closeView():void;
        function populateCharacterList(k:Dictionary):void;
        function showDisconnected(k:int, _arg_2:String):void;
        function showInvalidLoginError():void;

    }
}//package com.sulake.habbo.communication.demo.view

