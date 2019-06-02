//com.sulake.habbo.communication.messages.outgoing.catalog.GetSnowWarGameTokensOfferComposer

package com.sulake.habbo.communication.messages.outgoing.catalog{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime.IDisposable;

    public class GetSnowWarGameTokensOfferComposer implements IMessageComposer, IDisposable {

        private var _data:Array;

        public function GetSnowWarGameTokensOfferComposer();

        public function getMessageArray():Array;

        public function dispose():void;

        public function get disposed():Boolean;


    }
}//package com.sulake.habbo.communication.messages.outgoing.catalog

