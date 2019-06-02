//com.sulake.habbo.communication.messages.outgoing.landingview.GetPromoArticlesComposer

package com.sulake.habbo.communication.messages.outgoing.landingview{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime.IDisposable;

    [SecureSWF(rename="true")]
    public class GetPromoArticlesComposer implements IMessageComposer, IDisposable {

        public function GetPromoArticlesComposer();

        public function getMessageArray():Array;

        public function dispose():void;

        public function get disposed():Boolean;


    }
}//package com.sulake.habbo.communication.messages.outgoing.landingview

